#!/bin/bash

file=$1
sample_name=$2
sample_results_folder=$3
sample_logs_folder=$4

fastq_results_folder=$sample_results_folder/03_fastqc_post
fastq_logs_folder=$sample_logs_folder/03_fastqc_post

## Fastqc post
echo " --- Running FastQC POST-clipping --- "
mkdir -p $fastq_results_folder
mkdir -p $fastq_logs_folder

mkdir -p $fastq_results_folder/clipped_$sample_name
$fastqc -o $fastq_results_folder/clipped_$sample_name -t 4 --extract $file  1> $fastq_logs_folder/$sample_name.log 2>&1
