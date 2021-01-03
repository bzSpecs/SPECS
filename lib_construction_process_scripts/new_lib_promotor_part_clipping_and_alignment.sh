#!/bin/bash

read_promoter=$1 # promoters file
sample_name=$2 # proper name this sample will be called

# cutadapt="/Users/barzaruk/.local/bin/cutadapt"
# bowtie2="/Users/barzaruk/Downloads/bowtie2-2.4.2/bowtie2"
# samtools="/Users/barzaruk/Downloads/samtools/bin/samtools"

echo "Clipping"
mkdir -p logs_new/clip
mkdir -p library_preparation_new/02_Fastq_clip
${cutadapt} -g CCTGCAGG \
            -a GGCGCGCC \
            -O 3 -n 2 \
            -o library_preparation_new/02_Fastq_clip/clipped_$sample_name.fastq -m 30 \
            --untrimmed-output library_preparation_new/02_Fastq_clip/unclipped_$sample_name.fastq  \
	    --too-short-output library_preparation_new/02_Fastq_clip/too_short_$sample_name.fastq  \
	    --too-long-output  library_preparation_new/02_Fastq_clip/too_long_$sample_name.fastq  ${read_promoter} \
            1>>logs_new/clip/$sample_name.log 2>&1

echo "Aligning"
mkdir -p library_preparation_new/04_alignBowtie
mkdir -p library_preparation_new/04_alignBowtie/$sample_name
mkdir -p logs_new/bowtie
mkdir -p logs_new/samtools
# First align against the "genome" as described above
${bowtie2} --very-sensitive --norc \
           --met-file library_preparation_new/04_alignBowtie/$sample_name/met_$sample_name.txt -p 4\
           -x bowtie2_lib_D7/D7 \
           -U library_preparation_new/02_Fastq_clip/clipped_$sample_name.fastq \
           -S library_preparation_new/04_alignBowtie/$sample_name/$sample_name.sam &> logs_new/bowtie/$sample_name.log
# samtools view filters these alignments.
# from http://www.htslib.org/doc/samtools-view.html:
# -F INT --> Do not output alignments with any bits set in INT present i
# and from https://broadinstitute.github.io/picard/explain-flags.html
# code "4" means unmapped. So: omit reads that weren't successfully mapped to any "chromosome"
${samtools} view -F 4 library_preparation_new/04_alignBowtie/$sample_name/$sample_name.sam | \
           cut -f1,3 | \
           sort -k1 > library_preparation_new/04_alignBowtie/$sample_name/mapped_$sample_name.txt 2>> logs_new/samtools/$sample_name.log
# -f INT --> Only output alignments with all bits set in INT present in the FLAG field
# so: only print out the unmapped alignments.
${samtools} view -f 4 library_preparation_new/04_alignBowtie/$sample_name/$sample_name.sam | \
           cut -f1,10 | \
           sort -k1> library_preparation_new/04_alignBowtie/$sample_name/unmapped_$sample_name.txt 2>> logs_new/samtools/$sample_name.log
