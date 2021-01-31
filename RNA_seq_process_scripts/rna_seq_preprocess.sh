#!/bin/bash

start=$(date +"%s")
fastq=$1 # reads file
sample_name=$2 # proper name this sample will be called

# cutadapt="/Users/barzaruk/.local/bin/cutadapt"

results_folder=RNA_preprocess_clipBarcodes/${sample_name}/results
logs_folder=RNA_preprocess_clipBarcodes/${sample_name}/logs


mkdir -p ${results_folder}
mkdir -p ${logs_folder}


#clip barcodes:
echo "Clipping barcodes"
${cutadapt} -g AACCAGCTCGGATCC \
         -O 3 -n 2 -m 20 -M 25\
         -o ${results_folder}/clipped_${sample_name}.fastq  \
         --untrimmed-output ${results_folder}/unclipped_${sample_name}.fastq \
         $fastq \
         1>> ${logs_folder}/R1_${sample_name}.log 2>&1
