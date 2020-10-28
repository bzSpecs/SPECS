#!/bin/bash

start=$(date +"%s")

read2=$1 # promoters file
read1=$2 #barcodes file
sample_name=$3 # proper name this sample will be called

mkdir -p library_preparation
mkdir -p logs

#Fastqc pre ==> Just quality control, and done only to establish a baseline
# so that when we run QC again after trimming, we can compare and see the
# effects of trimming.
echo "Running FastQC pre-clipping"
mkdir -p library_preparation/Fastqc_pre
mkdir -p logs/Fastqc_pre/
mkdir -p library_preparation/Fastqc_pre/$sample_name
fastqc -o library_preparation/Fastqc_pre/$sample_name -t 4 --extract $read2 1> logs/Fastqc_pre/$sample_name.log 2>&1
#         ^ output_dir                               ^ -t = num threads;
#                                                          ^ --extract=don't compress (zip) output                 ^ log output


# files:
# clipped_$sample_name - the reads that successfuly was able to clip over the parameters
# unclipped_$sample_name - the reads that failed to clip over the parameters
# pre-clipped: GATATCGCGGCCGCCCTGCAGGCGTTGCTAGGCAACCATCCGTTGCTAGGCAACCGCTCGTTGCTAGGCAACCTGACGTTGCTAGGCAACCCAGCGTTGCTAGGCAACCATGCGTTGCTAGGCAACCCGTCGTTGCTAGGCAACCGGCGC
# post-clipped: CGTTGCTAGGCAACCATCCGTTGCTAGGCAACCGCTCGTTGCTAGGCAACCTGACGTTGCTAGGCAACCCAGCGTTGCTAGGCAACCATGCGTTGCTAGGCAACCCGTCGTTGCTAGGCAACC
# N.B. repeat:  CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC
# + linkers:                   ^^^               ^^^               ^^^...

#clipping
echo "Clipping"
mkdir -p logs/clip
mkdir -p library_preparation/fastq_clip
cutadapt -g CGGCCGCCCTGCAGG \ # Define the adapter ligated to the 5' end. The adapter and any preceding bases are trimmed
         -a GGCGCGCCAGACGCT \ # Define the adapter ligated to the 3' end. The adapter and subsequent bases are trimmed
         -O 3 -n 2 \  # minimum overlap between read and adapter for an adapter to be found
         -o library_preparation/fastq_clip/clipped_$sample_name.fastq -m 30 \
         --untrimmed-output library_preparation/fastq_clip/unclipped_$sample_name.fastq \ # output reads that do not contain any adapter here
         $read2 \
         1>>logs/clip/$sample_name.log 2>&1

 #Fastqc post
echo "Running FastQC POST-clipping"
mkdir -p logs/Fastqc_post
mkdir -p library_preparation/Fastqc_post
mkdir -p library_preparation/Fastqc_post/clipped_$sample_name
fastqc -o library_preparation/Fastqc_post/clipped_$sample_name -t 4 --extract library_preparation/fastq_clip/clipped_$sample_name.fastq  1> logs/Fastqc_post/$sample_name.log 2>&1
#         ^ output_dir                                          ^ -t = num threads;  ^ --extract=don't compress (zip) output                 ^ log output


#align
echo "Aligning"
mkdir -p library_preparation/bowtie
mkdir -p library_preparation/bowtie/$sample_name
mkdir -p logs/bowtie
mkdir -p logs/samtools
bowtie2 --very-sensitive --norc \  # sets args. See: bowtie2 --help | grep very-sensitive
        --met-file library_preparation/bowtie/$sample_name/met_$sample_name.txt -p 4\  # output metrics.
        -x bowtie2_lib_D7/D7 \ # N.B. Need to see this reference.
        -U library_preparation/fastq_clip/clipped_$sample_name.fastq \  # -U : unpaired list of files to be aligned --N.B.: why unpaired? depends on reference.
        -S library_preparation/bowtie/$sample_name/$sample_name.sam &> logs/bowtie/$sample_name.log # Define output files & logs
samtools view -F 4 library_preparation/bowtie/$sample_name/$sample_name.sam | \
         cut -f1,3 | \ # cuts to output only readlabel and construct, e.g. : 0115c43a-e552-4415-8c32-cea083bc10b4	chr8
         sort -k1 > library_preparation/bowtie/$sample_name/mapped_$sample_name.txt 2>> logs/samtools/$sample_name.log # sort by read label, (first col, above), and header is placed at bottom of the file.
samtools view -f 4 library_preparation/bowtie/$sample_name/$sample_name.sam | \ # output only mappings with flag 4 set=read unmapped. See: http://www.htslib.org/doc/samtools-view.html flag description: https://broadinstitute.github.io/picard/explain-flags.html
         cut -f1,10 | \ # print columns 1 and 10 == readID and sequence.
         sort -k1> library_preparation/bowtie/$sample_name/unmapped_$sample_name.txt 2>> logs/samtools/$sample_name.log # sort by first col = readID

#stats
echo "Calculating stats"
mkdir -p library_preparation/stats
fastq_name=$(basename -- $read2)
fastq_name=${fastq_name%%.*}
python3 stats.py $sample_name $fastq_name

# pre-clipped: CGCCCTTAGACACCATGGTGGCCAGCGCAACATCCAACCATGGGATCCGAGCTGGTTTACCAACAGTACCGGAATGCCAAGCTTACTTAGATCGCAGATCTAGAGTGAGGACGAACGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
# post-clipped: CAGCGCAACATCCAACCATG
#clip barcodes:
mkdir -p library_preparation/barcodes
echo "Clipping barcodes (R1)"
cutadapt -g GACACCATGGTGGC \
         -a GGATCCGAGCTGGTT \
         -O 3 -n 2 -m 15 -M 25\
         -o library_preparation/barcodes/clipped_R1_$sample_name.fastq  \
         --untrimmed-output library_preparation/barcodes/unclipped_R1_$sample_name.fastq \
         $read1 \
         1>>logs/clip/R1_$sample_name.log 2>&1

echo "Extracting barcodes"
mkdir -p library_preparation/barcodes/R1_$sample_name
python3 r1_to_tsv.py library_preparation/barcodes/clipped_R1_$sample_name.fastq library_preparation/barcodes/R1_$sample_name
python3 get_barcodes.py library_preparation/bowtie/$sample_name/mapped_$sample_name.txt library_preparation/barcodes/R1_$sample_name/barcodes.tsv library_preparation/barcodes/${sample_name}_PAIRED.csv

echo "Matching to promoters"
mkdir -p library_preparation/final
mkdir -p library_preparation/final/lib_$sample_name
python3 barcodes_per_kmer.py library_preparation/barcodes/${sample_name}_PAIRED.csv library_preparation/final/lib_$sample_name/

echo "time taken in minutes"
echo $(($(($(date +"%s")-$start))/60))