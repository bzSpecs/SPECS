#!/bin/bash

read_promoter=$1 # promoters file
sample_name=$2 # proper name this sample will be called
lib_id=$3
promoter_upstream_adapter=$4
promoter_downstream_adapter=$5

pyscripts=$6
bashscripts=$7
resources_folder=$8
output_root_dir=$9

# Define paths to executables specific to local machine
source $resources_folder/define_local_exec_paths.sh


lib_folder=$output_root_dir/$lib_id
sample_results_folder=$lib_folder/$sample_name/results
sample_logs_folder=$lib_folder/$sample_name/logs
lib_csv_results_folder=$lib_folder/promoters_csv_files

mkdir -p $sample_results_folder
mkdir -p $sample_logs_folder
mkdir -p $lib_csv_results_folder

$bashscripts/promoter_clipping_02.sh $read_promoter $sample_name $sample_results_folder $sample_logs_folder $promoter_upstream_adapter $promoter_downstream_adapter

cutadapt_clipped_file=$sample_results_folder/02_promoter_clipping/clipped_$sample_name.fastq
$bashscripts/promoter_alignment_04.sh $cutadapt_clipped_file $sample_name $sample_results_folder $sample_logs_folder

promoter_alignment_mapped_file=$sample_results_folder/04_alignment/mapped_$sample_name.txt
mapped_csv_output=$sample_results_folder/04_alignment/$sample_name/sample_$sample_name.csv
python ${pyscripts}/make_mapped_file_into_csv.py $promoter_alignment_mapped_file $mapped_csv_output

grouped_promoter_csv_output_file=$lib_csv_results_folder/sample_grouped_$sample_name.csv
python ${pyscripts}/group_by_promoter.py $mapped_csv_output $grouped_promoter_csv_output_file

python ${pyscripts}/coverage.py $grouped_promoter_csv_output_file ../resources/libray_D7_details_v2.csv $sample_name $lib_folder/coverage.txt