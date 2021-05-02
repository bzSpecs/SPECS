#!/bin/bash

lib=results/D11_lib
sample_name=$1
file=$2

source resources/define_local_exec_paths.sh

mkdir -p $lib/$sample_name/17_unique/cutadapt
mkdir -p $lib/$sample_name/17_unique/alignment
mkdir -p $lib/$sample_name/barcodes/cutadapt

# 17 unique
$cutadapt -j 0 -g TGCGATCTAAGTAAGCTTG -a GTACTGTTGGTAAACCAGCTC -m 17 -M 17 -O 3 -n 2 -o $lib/$sample_name/17_unique/cutadapt/cliped_17_unique_output.fastq --untrimmed-output $lib/$sample_name/17_unique/cutadapt/uncliped_17_unique_output.fastq --too-short-output $lib/$sample_name/17_unique/cutadapt/too_short_17_unique_output.fastq --too-long-output  $lib/$sample_name/17_unique/cutadapt/too_long_17_unique_output.fastq $file

$bowtie2 --very-sensitive --norc --met-file $lib/$sample_name/17_unique/alignment/met_17_unique.txt -p 4 -x lib_construction_process_scripts/bowtie2_lib_D11/D11 -U $lib/$sample_name/17_unique/cutadapt/cliped_17_unique_output.fastq -S $lib/$sample_name/17_unique/alignment/new_17_unique.sam &> $lib/$sample_name/17_unique/alignment/new_17_unique.log

$samtools view -F 4 $lib/$sample_name/17_unique/alignment/new_17_unique.sam | cut -f1,3 | sort -k1 > $lib/$sample_name/17_unique/alignment/new_17_unique.txt 2>> $lib/$sample_name/17_unique/alignment/new_17_unique_samtools.log

# barcodes           
$cutadapt -j 0 -g GTACTGTTGGTAAACCAGCTC -O 3 -n 2 -o $lib/$sample_name/barcodes/cutadapt/cliped_barcodes_output.fastq --untrimmed-output $lib/$sample_name/barcodes/cutadapt/uncliped_barcodes_output.fastq --too-short-output $lib/$sample_name/barcodes/cutadapt/too_short_cliped_barcodes_output.fastq --too-long-output $lib/$sample_name/barcodes/too_long_cliped_barcodes_output.fastq $file


python lib_construction_process_scripts/barcode_promoter_pairing_pyscripts/r1_to_tsv.py $lib/$sample_name/barcodes/cutadapt/cliped_barcodes_output.fastq $lib/$sample_name/barcodes/barcodes_mapping.tsv
python lib_construction_process_scripts/barcode_promoter_pairing_pyscripts/pair_barcodes_to_promoters.py $lib/$sample_name/17_unique/alignment/new_17_unique.txt $lib/$sample_name/barcodes/barcodes_mapping.tsv $lib/$sample_name/paired.csv