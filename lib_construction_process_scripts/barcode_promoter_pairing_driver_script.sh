#!/bin/bash

## Define params
start=$(date +"%s")

read_promoter=$1 # fastq file containing reads for promoter
read_barcode=$2  # fastq file containing reads for barcode
sample_name=$3   # proper name this sample will be called
promoter_upstream_adapter=$4
promoter_downstream_adapter=$5
barcode_upstream_adapter=$6
barcode_downstream_adapter=$7
barcode_min_length=$8
barcode_max_length=$9

output_root_dir=barcode_promoter_pairing_output
sample_results_folder=${output_root_dir}/$sample_name/results
sample_logs_folder=${output_root_dir}/$sample_name/logs

mkdir -p ${sample_results_folder}
mkdir -p ${sample_logs_folder}

# Define paths to executables specific to local machine
source define_local_exec_paths.sh
# fastqc="/Applications/FastQC.app/Contents/MacOS/fastqc"
# cutadapt="/Users/barzaruk/.local/bin/cutadapt"
# bowtie2="/Users/barzaruk/Downloads/bowtie2-2.4.2/bowtie2"
# samtools="/Users/barzaruk/Downloads/samtools/bin/samtools"

# subdir for pyscripts and bashscripts called by this driverscript
pyscripts=barcode_promoter_pairing_pyscripts
bashscripts=barcode_promoter_pairing_bashscripts

$bashscripts/promoter_fastq_pre_01.sh $read_promoter $sample_name $sample_results_folder $sample_logs_folder

$bashscripts/promoter_clipping_02.sh $read_promoter $sample_name $sample_results_folder $sample_logs_folder $promoter_upstream_adapter $promoter_downstream_adapter

cutadapt_clipped_file=$sample_results_folder/02_promoter_clipping/clipped_$sample_name.fastq
$bashscripts/promoter_fastq_post_03.sh $cutadapt_clipped_file $sample_name $sample_results_folder $sample_logs_folder

$bashscripts/promoter_alignment_04.sh $cutadapt_clipped_file $sample_name $sample_results_folder $sample_logs_folder

$bashscripts/barcode_clipping_05.sh $read_barcode $sample_name $sample_results_folder $sample_logs_folder $barcode_upstream_adapter $barcode_downstream_adapter $barcode_min_length $barcode_max_length $pyscripts

promoter_alignment_mapped_file=$sample_results_folder/04_alignment/mapped_$sample_name.txt
barcode_tsv_file=$sample_results_folder/05_barcode_clipping/$sample_name/read_barcode.tsv
promoter_barcode_paired_output_csv=$sample_results_folder/${sample_name}_PAIRED.csv
# the following pairs barcodes with promoters by read name
python3 $pyscripts/pair_barcodes_to_promoters.py $promoter_alignment_mapped_file \
        $barcode_tsv_file \
        $promoter_barcode_paired_output_csv

echo "time taken in minutes"
echo $(($(($(date +"%s")-$start))/60))
