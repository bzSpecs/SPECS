#!/bin/bash

start=$(date +"%s")
fastq=$1 # reads file
sample_name=$2 # proper name this sample will be called
experiment_name=$3 # proper name this sample will be called
upstream_adapter=$4
min=$5 # minimum length of seq
max=$6 # maximum length of seq

# Define paths to executables specific to local machine
source ../resources/define_local_exec_paths.sh

output_path=output/$experiment_name
results_folder=$output_path/$sample_name/results
logs_folder=$output_path/$sample_name/logs


mkdir -p $results_folder
mkdir -p $logs_folder


#clip barcodes:
echo "Clipping barcodes"
$cutadapt -g $upstream_adapter \
         -O 3 -n 2 -m $min -M $max \
         -o $results_folder/clipped_${sample_name}.fastq  \
         --untrimmed-output $results_folder/unclipped_${sample_name}.fastq \
         $fastq \
         1>> $logs_folder/R1_${sample_name}.log 2>&1
