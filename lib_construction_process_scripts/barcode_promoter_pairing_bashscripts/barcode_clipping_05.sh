#!/bin/bash

file=$1
sample_name=$2
sample_results_folder=$3
sample_logs_folder=$4
upstream_adapter=$5
downstream_adapter=$6
min=$7
max=$8
pyscripts=$9

clipping_results_folder=$sample_results_folder/05_barcode_clipping
clipping_logs_folder=$sample_logs_folder/05_barcode_clipping

## clip barcodes:
# pre-clipped: CGCCCTTAGACACCATGGTGGCCAGCGCAACATCCAACCATGGGATCCGAGCTGGTTTACCAACAGTACCGGAATGCCAAGCTTACTTAGATCGCAGATCTAGAGTGAGGACGAACGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
# post-clipped: CAGCGCAACATCCAACCATG

## barcodes

mkdir -p $clipping_results_folder
mkdir -p $clipping_logs_folder

echo " --- Clipping barcodes (R1) --- "
$cutadapt -g $upstream_adapter      \
            -a $downstream_adapter     \
            -O 3 -n 2 -m $min -M $max  \
            -o $clipping_results_folder/clipped_$sample_name.fastq  \
            --untrimmed-output $clipping_results_folder/unclipped_$sample_name.fastq  \
	    --too-short-output $clipping_results_folder/too_short_$sample_name.fastq  \
	    --too-long-output  $clipping_results_folder/too_long_$sample_name.fastq \
            $file \
            1>>$clipping_logs_folder/$sample_name.log 2>&1

echo " --- Extracting barcodes --- "

mkdir -p $clipping_results_folder/$sample_name

# r1_to_tsv collects the lines from the clipped barcode fastq file in groups
# of 4 and then outputs the 1rst and  2nd of each (i.e. readname and barcode
# itself, leaving out quality score)
python3 $pyscripts/r1_to_tsv.py $clipping_results_folder/clipped_$sample_name.fastq \
        $clipping_results_folder/$sample_name
