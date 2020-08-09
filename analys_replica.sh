#!/bin/bash

paired_path=$1 # promoter-barcode mapping
rna_seq_fastq_path=$2 # RNA-seq fastq file
root_dir_path=$3 # the root folder to all the outputs files
cell_line=$4 # the name of the cell line
replication=$5 # replication name
highlight_value=$6 # highlight minimum value
threshold_value=$7 # threshold value

threshold_and_number=threshold_${threshold_value}

cell_line_folder_path=${root_dir_path}/${cell_line}
unique_replication_folder_path=${cell_line_folder_path}/unique/${replication}
thresh_replication_folder_path=${cell_line_folder_path}/${threshold_and_number}/${replication}
# unique_replication_folder_path=${cell_line_folder_path}/${replication}/unique
# thresh_replication_folder_path=${cell_line_folder_path}/${replication}/${threshold_and_number}

mkdir -p ${cell_line_folder_path}
# mkdir -p ${replication_folder_path}

unique_paired_path=${root_dir_path}/unique_PAIRED.csv
if [ -f ${unique_paired_path} ]; then
        echo ${unique_paired_path} exists.
else
        python3 barcodes_promotors_mapping_unique.py ${paired_path} ${unique_paired_path}
fi



rna_seq_barcodes_csv_path=${unique_replication_folder_path}/${cell_line}_${replication}_rna_seq_barcodes.csv
python3 rna_seq_extract_barcodes.py ${rna_seq_fastq_path} ${rna_seq_barcodes_csv_path}

# highlighted barcodes by number of reads
unique_highlight_by_barcode=${unique_replication_folder_path}/highlights/by_barcode/unique_${cell_line}_${replication}_highlights.csv
unique_highlight_by_promoter=${unique_replication_folder_path}/highlights/by_promoter/unique_${cell_line}_${replication}_highlights.csv
python3 highlights_by_min_barcodes_representations.py ${rna_seq_barcodes_csv_path} ${unique_paired_path} ${unique_highlight_by_barcode} ${unique_highlight_by_promoter} ${highlight_value}

# top 10 barcodes for replica
unique_top_10_by_barcode=${unique_replication_folder_path}/top_10/by_barcode/unique_${cell_line}_${replication}_top_10.csv
unique_top_10_by_promoter=${unique_replication_folder_path}/top_10/by_promoter/unique_${cell_line}_${replication}_top_10.csv
python3 top_10_analys.py ${rna_seq_barcodes_csv_path} ${unique_paired_path} ${unique_top_10_by_barcode} ${unique_top_10_by_promoter}

# all barcodes
unique_all_by_barcode=${unique_replication_folder_path}/all/by_barcode/unique_${cell_line}_${replication}_all.csv
unique_all_by_promoter=${unique_replication_folder_path}/all/by_promoter/unique_${cell_line}_${replication}_all.csv
python3 all_barcodes_per_cell_analys.py ${rna_seq_barcodes_csv_path} ${unique_paired_path} ${unique_all_by_barcode} ${unique_all_by_promoter}


################################################

thresh_paired_path=${root_dir_path}/${threshold_and_number}_PAIRED.csv
if [ -f ${thresh_paired_path} ]; then
        echo ${thresh_paired_path} exists.
else
        python3 barcodes_promotors_mapping_threshold.py ${paired_path} ${threshold_value} ${thresh_paired_path}
fi

only_top_10_threshold_paired_path=${thresh_replication_folder_path}/${threshold_and_number}_${cell_line}_${replication}_paired.csv
python3 find_highlights_in_duplicated_barcodes.py ${thresh_paired_path} ${unique_top_10_by_promoter} ${only_top_10_threshold_paired_path}

rna_seq_threshold_path=${thresh_replication_folder_path}/${threshold_and_number}_${cell_line}_${replication}_rna_seq_barcodes.csv
top_10_unique_promoter_after_thresh_path=${thresh_replication_folder_path}/${threshold_and_number}_${cell_line}_${replication}_top_10_unique_promoters.csv
python3 extract_barcodes_from_raw_data.py ${only_top_10_threshold_paired_path} ${rna_seq_barcodes_csv_path} ${rna_seq_threshold_path} ${top_10_unique_promoter_after_thresh_path}

# highlighted barcodes by number of reads
thresh_highlight_by_barcode=${thresh_replication_folder_path}/highlights/by_barcode/${threshold_and_number}_${cell_line}_${replication}_highlights.csv
thresh_highlight_by_promoter=${thresh_replication_folder_path}/highlights/by_promoter/${threshold_and_number}_${cell_line}_${replication}_highlights.csv
python3 highlights_by_min_barcodes_representations.py ${rna_seq_threshold_path} ${thresh_paired_path} ${thresh_highlight_by_barcode} ${thresh_highlight_by_promoter} ${highlight_value}

# top 10 barcodes for replica
thresh_top_10_by_barcode=${thresh_replication_folder_path}/top_10/by_barcode/${threshold_and_number}_${cell_line}_${replication}_top_10.csv
thresh_top_10_by_promoter=${thresh_replication_folder_path}/top_10/by_promoter/${threshold_and_number}_${cell_line}_${replication}_top_10.csv
python3 top_10_analys.py ${rna_seq_threshold_path} ${thresh_paired_path} ${thresh_top_10_by_barcode} ${thresh_top_10_by_promoter}

# all barcodes
thresh_all_by_barcode=${thresh_replication_folder_path}/all/by_barcode/${threshold_and_number}_${cell_line}_${replication}_all.csv
thresh_all_by_promoter=${thresh_replication_folder_path}/all/by_promoter/${threshold_and_number}_${cell_line}_${replication}_all.csv
python3 all_barcodes_per_cell_analys.py ${rna_seq_threshold_path} ${thresh_paired_path} ${thresh_all_by_barcode} ${thresh_all_by_promoter}

# example of running - ./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/clipped_rep3_HEK293T.fastq results HEK293T rep3 100 3