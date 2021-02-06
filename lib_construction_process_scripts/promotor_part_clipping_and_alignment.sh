#!/bin/bash

read_promoter=$1 # promoters file
sample_name=$2 # proper name this sample will be called
lib_id=$3

# cutadapt="/Users/barzaruk/.local/bin/cutadapt"
# bowtie2="/Users/barzaruk/Downloads/bowtie2-2.4.2/bowtie2"
# samtools="/Users/barzaruk/Downloads/samtools/bin/samtools"

lib_folder=results/$lib_id
sample_results_folder=$lib_folder/$sample_name/results
sample_logs_folder=$lib_folder/$sample_name/logs
lib_csv_results_folder=$lib_folder/promoters_csv_files

mkdir -p $sample_results_folder
mkdir -p $sample_logs_folder
mkdir -p $lib_csv_results_folder

## clipping
echo "Clipping"
mkdir -p $sample_logs_folder/clip
mkdir -p $sample_results_folder/02_Fastq_clip
${cutadapt} -g GCGGCCGCCCTGCAGG \
            -O 3 -n 2 \
            -o $sample_results_folder/02_Fastq_clip/clipped_$sample_name.fastq -m 30 \
            --untrimmed-output $sample_results_folder/02_Fastq_clip/unclipped_$sample_name.fastq  \
	    --too-short-output $sample_results_folder/02_Fastq_clip/too_short_$sample_name.fastq  \
	    --too-long-output  $sample_results_folder/02_Fastq_clip/too_long_$sample_name.fastq  ${read_promoter} \
            1>>$sample_logs_folder/clip/$sample_name.log 2>&1

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
           cut -f3 | \
           sort -k1 > $sample_results_folder/04_alignBowtie/$sample_name/mapped_$sample_name.txt 2>> $sample_logs_folder/samtools/$sample_name.log
# -f INT --> Only output alignments with all bits set in INT present in the FLAG field
# so: only print out the unmapped alignments.
${samtools} view -f 4 $sample_results_folder/04_alignBowtie/$sample_name/$sample_name.sam | \
           cut -f1,10 | \
           sort -k1> $sample_results_folder/04_alignBowtie/$sample_name/unmapped_$sample_name.txt 2>> $sample_logs_folder/samtools/$sample_name.log

python pyscripts/make_mapped_file_into_csv.py $sample_results_folder/04_alignBowtie/$sample_name/mapped_$sample_name.txt $sample_results_folder/04_alignBowtie/$sample_name/sample_$sample_name.csv

python pyscripts/group_by_promoter.py $sample_results_folder/04_alignBowtie/$sample_name/sample_$sample_name.csv results/$lib_csv_results_folder/sample_grouped_$sample_name.csv

python pyscripts/coverage.py $lib_csv_results_folder/sample_grouped_$sample_name.csv ../resources/libray_D7_details_v2.csv $sample_name $lib_folder/coverage.txt