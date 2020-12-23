#!/bin/bash

cell_name=$1 # the name of the cell line
root_folder=$2 # results root folder
paired_csv=$3 # paired mapping

./analyse_replicate.sh ${paired_csv} RNA_seq_process_scripts/RNA_seq_results/${cell_name}/clipped_${cell_name}_bio_1_tech_1.fastq ${root_folder} ${cell_name} 1 1 100 3
./analyse_replicate.sh ${paired_csv} RNA_seq_process_scripts/RNA_seq_results/${cell_name}/clipped_${cell_name}_bio_1_tech_2.fastq ${root_folder} ${cell_name} 1 2 100 3
./analyse_replicate.sh ${paired_csv} RNA_seq_process_scripts/RNA_seq_results/${cell_name}/clipped_${cell_name}_bio_1_tech_3.fastq ${root_folder} ${cell_name} 1 3 100 3
./analyse_replicate.sh ${paired_csv} RNA_seq_process_scripts/RNA_seq_results/${cell_name}/clipped_${cell_name}_bio_2_tech_1.fastq ${root_folder} ${cell_name} 2 1 100 3
./analyse_replicate.sh ${paired_csv} RNA_seq_process_scripts/RNA_seq_results/${cell_name}/clipped_${cell_name}_bio_2_tech_2.fastq ${root_folder} ${cell_name} 2 2 100 3
./analyse_replicate.sh ${paired_csv} RNA_seq_process_scripts/RNA_seq_results/${cell_name}/clipped_${cell_name}_bio_2_tech_3.fastq ${root_folder} ${cell_name} 2 3 100 3
./analyse_replicate.sh ${paired_csv} RNA_seq_process_scripts/RNA_seq_results/${cell_name}/clipped_${cell_name}_bio_3_tech_1.fastq ${root_folder} ${cell_name} 3 1 100 3
./analyse_replicate.sh ${paired_csv} RNA_seq_process_scripts/RNA_seq_results/${cell_name}/clipped_${cell_name}_bio_3_tech_2.fastq ${root_folder} ${cell_name} 3 2 100 3
./analyse_replicate.sh ${paired_csv} RNA_seq_process_scripts/RNA_seq_results/${cell_name}/clipped_${cell_name}_bio_3_tech_3.fastq ${root_folder} ${cell_name} 3 3 100 3