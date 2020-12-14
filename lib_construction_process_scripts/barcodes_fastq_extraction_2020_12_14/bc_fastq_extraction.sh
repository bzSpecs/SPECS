#!/bin/bash

read_barcodes=$1 # barcodes file
sample_name=$2 # proper name this sample will be called

cutadapt="/Users/barzar/Library/Python/3.8/bin/cutadapt"

mkdir -p BC_results/$sample_name
mkdir -p logs/$sample_name

# ACTGTTGGTAAACCAGCTCGGATCC-BC(12/16bp)-GCCACCATGGTGTCTAAGGGCGAAGAGCTGATTAAGGAGAACATGCACATGAAGCTGTACATGGA
echo "Clipping barcodes (R1)"
${cutadapt} -g ACTGTTGGTAAACCAGCTCGGATCC \
            -a GCCACCATGGTGTCTAAGGGCGAAGAGCTGATTAA \
            -O 3 -n 2 -m 12 -M 12 \
            -o BC_results/$sample_name/clipped_barcodes_$sample_name.fastq  \
            --untrimmed-output BC_results/$sample_name/unclipped_barcodes_$sample_name.fastq  \
            --too-short-output BC_results/$sample_name/too_short_$sample_name.fastq  \
            --too-long-output BC_results/$sample_name/too_long_$sample_name.fastq \
            ${read_barcodes} \
            1>>logs/barcode_$sample_name.log 2>&1
