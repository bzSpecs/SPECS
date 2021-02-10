#!/bin/bash

file=$1
sample_name=$2
sample_results_folder=$3
sample_logs_folder=$4

alignment_results_folder=$sample_results_folder/04_alignment
alignment_bowtie_logs_folder=$sample_logs_folder/04_alignment_bowtie
alignment_samtools_logs_folder=$sample_logs_folder/04_alignment_samtools

## align against the "genome"
# consisting of D6M_[1-5966] "chromosomes".
# Each of these "chroms" is really just the sequence from the word document
# [Kmer]ATC[Kmer]GCT[Kmer]TGA[Kmer]CAG[Kmer]ATG[Kmer]CGT[Kmer]TAC[Kmer]GAA[Kmer]GGCGCGCC
# --then look for alignments == hits for that promoter.

echo " --- Aligning --- "
mkdir -p $alignment_results_folder
mkdir -p $alignment_bowtie_logs_folder
mkdir -p $alignment_samtools_logs_folder

# First align against the "genome" as described above
$bowtie2 --very-sensitive --norc \
           --met-file $alignment_results_folder/met_$sample_name.txt -p 4\
           -x bowtie2_lib_D7/D7 \
           -U $file \
           -S $alignment_results_folder/$sample_name.sam &> $alignment_bowtie_logs_folder/$sample_name.log
# samtools view filters these alignments.
# from http://www.htslib.org/doc/samtools-view.html:
# -F INT --> Do not output alignments with any bits set in INT present i
# and from https://broadinstitute.github.io/picard/explain-flags.html
# code "4" means unmapped. So: omit reads that weren't successfully mapped to any "chromosome"

echo " --- Extracting reads, promoters from bam alignment --- "
$samtools view -F 4 $alignment_results_folder/$sample_name.sam | \
           cut -f1,3 | \
           sort -k1 > $alignment_results_folder/mapped_$sample_name.txt 2>> $alignment_samtools_logs_folder/$sample_name.log
# -f INT --> Only output alignments with all bits set in INT present in the FLAG field
# so: only print out the unmapped alignments.
$samtools view -f 4 $alignment_results_folder/$sample_name.sam | \
           cut -f1,10 | \
           sort -k1> $alignment_results_folder/unmapped_$sample_name.txt 2>> $alignment_samtools_logs_folder/$sample_name.log
# In each case above,
# "cut" then takes the first and third column of the sam file, which is the read name and the "chromosome" (i.e. the promoter)
# "sort" then just sorts
#----------------------
# bowtie args:
# --very-sensitive --norc \  # sets args. See: bowtie2 --help | grep very-sensitive
# --met-file $alignment_results_folder/met_$sample_name.txt -p 4\  # output metrics.
# -x bowtie2_lib_D7/D7 \ # N.B. Need to see this reference.
# -U $sample_results_folder/02_Fastq_clip_promoter/clipped_$sample_name.fastq \  # -U : unpaired list of files to be aligned --N.B.: why unpaired? depends on reference.
#  -S $alignment_results_folder/$sample_name.sam &> $alignment_bowtie_logs_folder/$sample_name.log # Define output files & logs
# view -F 4 $alignment_results_folder/$sample_name.sam | \
# cut -f1,3 | \ # cuts to output only readlabel and construct, e.g. : 0115c43a-e552-4415-8c32-cea083bc10b4	chr8
# sort -k1 > $alignment_results_folder/mapped_$sample_name.txt 2>> $alignment_samtools_logs_folder/$sample_name.log # sort by read label, (first col, above), and header is placed at bottom of the file.
# view -f 4 $alignment_results_folder/$sample_name.sam | \ # output only mappings with flag 4 set=read unmapped. See: http://www.htslib.org/doc/samtools-view.html flag description: https://broadinstitute.github.io/picard/explain-flags.html
# cut -f1,10 | \ # print columns 1 and 10 == readID and sequence.
# sort -k1> $alignment_results_folder/unmapped_$sample_name.txt 2>> $alignment_samtools_logs_folder/$sample_name.log # sort by first col = readID
#
#----------------------