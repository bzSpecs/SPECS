#!/bin/bash

file=$1
sample_name=$2
sample_results_folder=$3
sample_logs_folder=$4

fastq_results_folder=$sample_results_folder/01_fastqc_pre
fastq_logs_folder=$sample_logs_folder/01_fastqc_pre

## Fastqc pre ==> Quality control, done to establish a baseline
# so that when we run QC again after trimming, we can compare and see the
# effects of trimming.
echo " --- Running FastQC pre-clipping --- "
mkdir -p $fastq_results_folder
mkdir -p $fastq_logs_folder
mkdir -p $fastq_results_folder/$sample_name

$fastqc -o $fastq_results_folder/$sample_name -t 4 --extract $file 1> $fastq_logs_folder/$sample_name.log 2>&1
# -o output_dir
# -t = num threads
# --extract=don't compress (zip) output    