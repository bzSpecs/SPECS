#!/bin/bash

start=$(date +"%s")
fastq=$1 # reads file
sample_name=$2 # proper name this sample will be called

# cutadapt="/Users/barzaruk/.local/bin/cutadapt"

mkdir -p RNA_seq_results
mkdir -p RNA_seq_results/$sample_name
mkdir -p logs/RNA_seq_results

#clip barcodes:
mkdir -p RNA_seq_results/$sample_name/cut_adapt_out
mkdir -p logs/RNA_seq_results/cut_adapt_out
echo "Clipping barcodes"
${cutadapt} -g AACCAGCTCGGATCC \
         -O 3 -n 2 -m 20 -M 25\
         -o RNA_seq_results/$sample_name/cut_adapt_out/clipped_$sample_name.fastq  \
         --untrimmed-output RNA_seq_results/$sample_name/cut_adapt_out/unclipped_$sample_name.fastq \
         $fastq \
         1>>logs/RNA_seq_results/cut_adapt_out/R1_$sample_name.log 2>&1
