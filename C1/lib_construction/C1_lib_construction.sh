#!/bin/bash

experiment_name=$1
cell_line_name=$2
replicate_name=$3
sample_name=$4
file=$5
pyscripts_folder=$6
bowtie2_referece_folder=$7
define_local_exec_paths_file=$8
output_root_dir=$9

sample_folder=$output_root_dir/$experiment_name/$cell_line_name/$replicate_name/$sample_name

# to run on cluster:
module load hurcs
module load cutadapt/3.4
# source $define_local_exec_paths_file #not needed

mkdir -p $sample_folder/17_unique/cutadapt
mkdir -p $sample_folder/17_unique/alignment
mkdir -p $sample_folder/barcodes/cutadapt

# TGCGATCTAAGTAAGCTTGCCTGCATTAAAGGTCAGGTACTGTTGGTAAACCAGCTCCGTGAGACGGATTTGAGGA
# adapter 1: TGCGATCTAAGTAAGCTTG
# 17 unique: CCTGCATTAAAGGTCAG
# adapter 2: GTACTGTTGGTAAACCAGCTC
# barcode: CGTGAGACGGATTTGA
# leftover: GGA

# 17 unique
cutadapt -j 0 -g TGCGATCTAAGTAAGCTTG -a GTACTGTTGGTAAACCAGCTC -m 17 -M 17 -O 3 -n 2 -o $sample_folder/17_unique/cutadapt/clipped_17_unique_output.fastq --untrimmed-output $sample_folder/17_unique/cutadapt/unclipped_17_unique_output.fastq --too-short-output $sample_folder/17_unique/cutadapt/too_short_17_unique_output.fastq --too-long-output  $sample_folder/17_unique/cutadapt/too_long_17_unique_output.fastq $file

bowtie2 --very-sensitive --norc --met-file $sample_folder/17_unique/alignment/met_17_unique.txt -p 4 -x $bowtie2_referece_folder -U $sample_folder/17_unique/cutadapt/clipped_17_unique_output.fastq -S $sample_folder/17_unique/alignment/new_17_unique.sam &> $sample_folder/17_unique/alignment/new_17_unique.log

samtools view -F 4 $sample_folder/17_unique/alignment/new_17_unique.sam | cut -f1,3 | sort -k1 > $sample_folder/17_unique/alignment/new_17_unique.txt 2>> $sample_folder/17_unique/alignment/new_17_unique_samtools.log

# barcodes           
cutadapt -j 0 -g GTACTGTTGGTAAACCAGCTC -O 3 -n 2 -o $sample_folder/barcodes/cutadapt/clipped_barcodes_output.fastq --untrimmed-output $sample_folder/barcodes/cutadapt/unclipped_barcodes_output.fastq --too-short-output $sample_folder/barcodes/cutadapt/too_short_clipped_barcodes_output.fastq --too-long-output $sample_folder/barcodes/too_long_clipped_barcodes_output.fastq $file


python3 $pyscripts_folder/r1_to_tsv.py $sample_folder/barcodes/cutadapt/clipped_barcodes_output.fastq $sample_folder/barcodes/barcodes_mapping.tsv
python3 $pyscripts_folder/pair_barcodes_to_unique_17.py $sample_folder/17_unique/alignment/new_17_unique.txt $sample_folder/barcodes/barcodes_mapping.tsv $sample_folder/paired.csv
python3 $pyscripts_folder/extract_distinct_pairing_and_number_of_barcodes_per_unique_17.py $sample_folder/paired.csv $sample_folder/distinct_paired.csv $sample_folder/number_of_BC_per_unique_17.csv
