#!/bin/bash

## Define params
start=$(date +"%s")

read_promoter=$1 # promoters file
read_barcode=$2 #barcodes file
sample_name=$3 # proper name this sample will be called

mkdir -p results
mkdir -p results/$sample_name

sample_results_folder=results/$sample_name/results
sample_logs_folder=results/$sample_name/logs

mkdir -p sample_results_folder
mkdir -p sample_logs_folder

# fastqc="/Applications/FastQC.app/Contents/MacOS/fastqc"
# cutadapt="/Users/barzaruk/.local/bin/cutadapt"
# bowtie2="/Users/barzaruk/Downloads/bowtie2-2.4.2/bowtie2"
# samtools="/Users/barzaruk/Downloads/samtools/bin/samtools"

## Fastqc pre ==> Quality control, done to establish a baseline
# so that when we run QC again after trimming, we can compare and see the
# effects of trimming.
echo "Running FastQC pre-clipping"
mkdir -p $sample_results_folder/01_Fastqc_pre
mkdir -p $sample_logs_folder/01_Fastqc_pre/
mkdir -p $sample_results_folder/01_Fastqc_pre/$sample_name
${fastqc} -o $sample_results_folder/01_Fastqc_pre/$sample_name -t 4 --extract ${read_promoter} 1> $sample_logs_folder/01_Fastqc_pre/$sample_name.log 2>&1
#         ^ output_dir                               ^ -t = num threads;
#                                                          ^ --extract=don't compress (zip) output                 ^ log output


# files:
# clipped_$sample_name - the reads that successfuly was able to clip over the parameters
# unclipped_$sample_name - the reads that failed to clip over the parameters
# pre-clipped: GATATCGCGGCCGCCCTGCAGGCGTTGCTAGGCAACCATCCGTTGCTAGGCAACCGCTCGTTGCTAGGCAACCTGACGTTGCTAGGCAACCCAGCGTTGCTAGGCAACCATGCGTTGCTAGGCAACCCGTCGTTGCTAGGCAACCGGCGC
# post-clipped: CGTTGCTAGGCAACCATCCGTTGCTAGGCAACCGCTCGTTGCTAGGCAACCTGACGTTGCTAGGCAACCCAGCGTTGCTAGGCAACCATGCGTTGCTAGGCAACCCGTCGTTGCTAGGCAACC
# N.B. repeat:  CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC
# + linkers:                   ^^^               ^^^               ^^^...

## clipping
echo "Clipping"
mkdir -p $sample_logs_folder/clip
mkdir -p $sample_results_folder/02_Fastq_clip
${cutadapt} -g CGGCCGCCCTGCAGG \
            -a GGCGCGCCAGACGCT \
            -O 3 -n 2 \
            -o $sample_results_folder/02_Fastq_clip/clipped_$sample_name.fastq -m 30 \
            --untrimmed-output $sample_results_folder/02_Fastq_clip/unclipped_$sample_name.fastq  \
	    --too-short-output $sample_results_folder/02_Fastq_clip/too_short_$sample_name.fastq  \
	    --too-long-output  $sample_results_folder/02_Fastq_clip/too_long_$sample_name.fastq  ${read_promoter} \
            1>>$sample_logs_folder/clip/$sample_name.log 2>&1
#----------------------
# From word doc:
# trim the CGGCCGCCCTGCAGG and additional upstream sequences
# trim the GGCGCGCCAGACGCT and additional downstream sequences
# cutadapt Args:
#         -g CGGCCGCCCTGCAGG \
          # ^ Define the adapter ligated to the 5' end. The adapter and any preceding bases are trimmed
#         -a GGCGCGCCAGACGCT \
          # ^ Define the adapter ligated to the 3' end. The adapter and subsequent bases are trimmed
#         -O 3 -n 2 \
          # ^ minimum overlap between read and adapter for an adapter to be found
#         -o $sample_results_folder/02_Fastq_clip/clipped_$sample_name.fastq -m 30 \
#         --untrimmed-output $sample_results_folder/02_Fastq_clip/unclipped_$sample_name.fastq \
          # ^ output reads that do not contain any adapter here
#         ${read_promoter} \
#         1>>$sample_logs_folder/clip/$sample_name.log 2>&1
#----------------------
## Fastqc post
echo "Running FastQC POST-clipping"
mkdir -p $sample_logs_folder/03_Fastqc_post
mkdir -p $sample_results_folder/03_Fastqc_post
mkdir -p $sample_results_folder/03_Fastqc_post/clipped_$sample_name
${fastqc} -o $sample_results_folder/03_Fastqc_post/clipped_$sample_name -t 4 --extract $sample_results_folder/02_Fastq_clip/clipped_$sample_name.fastq  1> $sample_logs_folder/03_Fastqc_post/$sample_name.log 2>&1
#         ^ output_dir                                          ^ -t = num threads;  ^ --extract=don't compress (zip) output                 ^ log output


## align against the "genome"
# consisting of D6M_[1-5966] "chromosomes".
# Each of these "chroms" is really just the sequence from the word document
# [Kmer]ATC[Kmer]GCT[Kmer]TGA[Kmer]CAG[Kmer]ATG[Kmer]CGT[Kmer]TAC[Kmer]GAA[Kmer]GGCGCGCC
# --then look for alignments == hits for that promoter.

# Q: Do we really need alignments against the _repeated_ kmer? why not relax this?

echo "Aligning"
mkdir -p $sample_results_folder/04_alignBowtie
mkdir -p $sample_results_folder/04_alignBowtie/$sample_name
mkdir -p $sample_logs_folder/bowtie
mkdir -p $sample_logs_folder/samtools
# First align against the "genome" as described above
${bowtie2} --very-sensitive --norc \
           --met-file $sample_results_folder/04_alignBowtie/$sample_name/met_$sample_name.txt -p 4\
           -x bowtie2_lib_D7/D7 \
           -U $sample_results_folder/02_Fastq_clip/clipped_$sample_name.fastq \
           -S $sample_results_folder/04_alignBowtie/$sample_name/$sample_name.sam &> $sample_logs_folder/bowtie/$sample_name.log
# samtools view filters these alignments.
# from http://www.htslib.org/doc/samtools-view.html:
# -F INT --> Do not output alignments with any bits set in INT present i
# and from https://broadinstitute.github.io/picard/explain-flags.html
# code "4" means unmapped. So: omit reads that weren't successfully mapped to any "chromosome"
${samtools} view -F 4 $sample_results_folder/04_alignBowtie/$sample_name/$sample_name.sam | \
           cut -f1,3 | \
           sort -k1 > $sample_results_folder/04_alignBowtie/$sample_name/mapped_$sample_name.txt 2>> $sample_logs_folder/samtools/$sample_name.log
# -f INT --> Only output alignments with all bits set in INT present in the FLAG field
# so: only print out the unmapped alignments.
${samtools} view -f 4 $sample_results_folder/04_alignBowtie/$sample_name/$sample_name.sam | \
           cut -f1,10 | \
           sort -k1> $sample_results_folder/04_alignBowtie/$sample_name/unmapped_$sample_name.txt 2>> $sample_logs_folder/samtools/$sample_name.log
# In each case above,
# "cut" then takes the first and third column of the sam file, which is the read name and the "chromosome" (i.e. the promoter)
# "sort" then just sorts
#----------------------
# bowtie args:
# --very-sensitive --norc \  # sets args. See: bowtie2 --help | grep very-sensitive
# --met-file $sample_results_folder/04_alignBowtie/$sample_name/met_$sample_name.txt -p 4\  # output metrics.
# -x bowtie2_lib_D7/D7 \ # N.B. Need to see this reference.
# -U $sample_results_folder/02_Fastq_clip/clipped_$sample_name.fastq \  # -U : unpaired list of files to be aligned --N.B.: why unpaired? depends on reference.
#  -S $sample_results_folder/04_alignBowtie/$sample_name/$sample_name.sam &> $sample_logs_folder/bowtie/$sample_name.log # Define output files & logs
# view -F 4 $sample_results_folder/04_alignBowtie/$sample_name/$sample_name.sam | \
# cut -f1,3 | \ # cuts to output only readlabel and construct, e.g. : 0115c43a-e552-4415-8c32-cea083bc10b4	chr8
# sort -k1 > $sample_results_folder/04_alignBowtie/$sample_name/mapped_$sample_name.txt 2>> $sample_logs_folder/samtools/$sample_name.log # sort by read label, (first col, above), and header is placed at bottom of the file.
# view -f 4 $sample_results_folder/04_alignBowtie/$sample_name/$sample_name.sam | \ # output only mappings with flag 4 set=read unmapped. See: http://www.htslib.org/doc/samtools-view.html flag description: https://broadinstitute.github.io/picard/explain-flags.html
# cut -f1,10 | \ # print columns 1 and 10 == readID and sequence.
# sort -k1> $sample_results_folder/04_alignBowtie/$sample_name/unmapped_$sample_name.txt 2>> $sample_logs_folder/samtools/$sample_name.log # sort by first col = readID
#
#----------------------

## stats
echo "Calculating stats"
mkdir -p $sample_results_folder/05_stats
fastq_name=$(basename -- ${read_promoter})
fastq_name=${fastq_name%%.*}
python3 stats.py $sample_name $fastq_name

## clip barcodes:
# pre-clipped: CGCCCTTAGACACCATGGTGGCCAGCGCAACATCCAACCATGGGATCCGAGCTGGTTTACCAACAGTACCGGAATGCCAAGCTTACTTAGATCGCAGATCTAGAGTGAGGACGAACGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
# post-clipped: CAGCGCAACATCCAACCATG

## barcodes

mkdir -p $sample_results_folder/06_barcodes
echo "Clipping barcodes (R1)"
${cutadapt} -g GACACCATGGTGGC      \
            -a GGATCCGAGCTGGTT     \
            -O 3 -n 2 -m 20 -M 20  \
            -o $sample_results_folder/06_barcodes/clipped_R1_$sample_name.fastq  \
            --untrimmed-output $sample_results_folder/06_barcodes/unclipped_R1_$sample_name.fastq  \
	    --too-short-output $sample_results_folder/06_barcodes/too_short_$sample_name.fastq  \
	    --too-long-output  $sample_results_folder/06_barcodes/too_long_$sample_name.fastq \
            ${read_barcode} \
            1>>$sample_logs_folder/clip/R1_$sample_name.log 2>&1

echo "Extracting barcodes"
mkdir -p $sample_results_folder/06_barcodes/R1_$sample_name
python3 r1_to_tsv.py $sample_results_folder/06_barcodes/clipped_R1_$sample_name.fastq \
        $sample_results_folder/06_barcodes/R1_$sample_name
python3 get_barcodes.py $sample_results_folder/04_alignBowtie/$sample_name/mapped_$sample_name.txt \
        $sample_results_folder/06_barcodes/R1_$sample_name/barcodes.tsv \
        $sample_results_folder/06_barcodes/${sample_name}_PAIRED.csv

# echo "Matching to promoters"
# mkdir -p $sample_results_folder/final
# mkdir -p $sample_results_folder/final/lib_$sample_name
# python3 barcodes_per_kmer.py $sample_results_folder/06_barcodes/${sample_name}_PAIRED.csv $sample_results_folder/final/lib_$sample_name/

echo "time taken in minutes"
echo $(($(($(date +"%s")-$start))/60))
