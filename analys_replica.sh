#!/bin/bash

paired_path=$1 # promoter-barcode mapping
rna_seq_fastq_path=$2 # RNA-seq fastq file
root_dir_path=$3 # the root folder to all the outputs files
cell_line=$4 # the name of the cell line
bio_rep=$5 # biological replica name
tech_rep=$6 # technical replica name
highlight_value=$7 # highlight minimum value
threshold_value=$8 # threshold value

threshold_and_number=threshold_${threshold_value}

cell_line_folder_path=${root_dir_path}/${cell_line}/bio_${bio_rep}
unique_tech_rep=${cell_line_folder_path}/unique/tech_${tech_rep}
thresh_tech_rep=${cell_line_folder_path}/${threshold_and_number}/tech_${tech_rep}
# unique_tech_rep=${cell_line_folder_path}/tech_${tech_rep}/unique
# thresh_tech_rep=${cell_line_folder_path}/tech_${tech_rep}/${threshold_and_number}

mkdir -p ${cell_line_folder_path}
# mkdir -p ${tech_rep}

unique_paired_path=${root_dir_path}/unique_PAIRED.csv
if [ -f ${unique_paired_path} ]; then
        echo ${unique_paired_path} exists.
else
        python3 barcodes_promotors_mapping_unique.py ${paired_path} ${unique_paired_path}
fi


# extract barcodes from fastq file to csv
rna_seq_barcodes_csv_path=${unique_tech_rep}/${cell_line}_bio_${bio_rep}_tech_${tech_rep}_rna_seq_barcodes.csv
python3 rna_seq_extract_barcodes.py ${rna_seq_fastq_path} ${rna_seq_barcodes_csv_path}

# make barcode-count csv
unique_all_by_barcode=${unique_tech_rep}/all/by_barcode/unique_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_all.csv
python3 barcodes_counts.py ${rna_seq_barcodes_csv_path} ${unique_all_by_barcode}

# make promoter-count csv
unique_all_by_promoter=${unique_tech_rep}/all/by_promoter/unique_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_all.csv
python3 promoter_counts.py ${unique_all_by_barcode} ${unique_paired_path} ${unique_all_by_promoter}

# highlighted barcodes and promoters by number of reads
unique_highlight_by_barcode=${unique_tech_rep}/highlights/by_barcode/unique_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_highlights.csv
unique_highlight_by_promoter=${unique_tech_rep}/highlights/by_promoter/unique_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_highlights.csv
python3 highlights_by_count.py ${unique_all_by_barcode} ${unique_highlight_by_barcode} ${highlight_value}
python3 highlights_by_count.py ${unique_all_by_promoter} ${unique_highlight_by_promoter} ${highlight_value}

# top 10 barcodes and promoters for replica
unique_top_10_by_barcode=${unique_tech_rep}/top_10/by_barcode/unique_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_top_10.csv
unique_top_10_by_promoter=${unique_tech_rep}/top_10/by_promoter/unique_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_top_10.csv
python3 top_10_by_count.py ${unique_all_by_barcode} ${unique_top_10_by_barcode}
python3 top_10_by_count.py ${unique_all_by_promoter} ${unique_top_10_by_promoter}

###############################################

# thresh_paired_path=${root_dir_path}/${threshold_and_number}_PAIRED.csv
# if [ -f ${thresh_paired_path} ]; then
#         echo ${thresh_paired_path} exists.
# else
#         python3 barcodes_promotors_mapping_threshold.py ${paired_path} ${threshold_value} ${thresh_paired_path}
# fi

# only_top_10_threshold_paired_path=${thresh_tech_rep}/${threshold_and_number}_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_paired.csv
# python3 find_highlights_in_duplicated_barcodes.py ${thresh_paired_path} ${unique_top_10_by_promoter} ${only_top_10_threshold_paired_path}

# rna_seq_threshold_path=${thresh_tech_rep}/${threshold_and_number}_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_rna_seq_barcodes.csv
# top_10_unique_promoter_after_thresh_path=${thresh_tech_rep}/${threshold_and_number}_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_top_10_unique_promoters.csv
# python3 extract_barcodes_from_raw_data.py ${only_top_10_threshold_paired_path} ${rna_seq_barcodes_csv_path} ${rna_seq_threshold_path} ${top_10_unique_promoter_after_thresh_path}

# # highlighted barcodes by number of reads
# thresh_highlight_by_barcode=${thresh_tech_rep}/highlights/by_barcode/${threshold_and_number}_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_highlights.csv
# thresh_highlight_by_promoter=${thresh_tech_rep}/highlights/by_promoter/${threshold_and_number}_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_highlights.csv
# python3 highlights_by_min_barcodes_representations.py ${rna_seq_threshold_path} ${thresh_paired_path} ${thresh_highlight_by_barcode} ${thresh_highlight_by_promoter} ${highlight_value}

# # top 10 barcodes for replica
# thresh_top_10_by_barcode=${thresh_tech_rep}/top_10/by_barcode/${threshold_and_number}_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_top_10.csv
# thresh_top_10_by_promoter=${thresh_tech_rep}/top_10/by_promoter/${threshold_and_number}_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_top_10.csv
# python3 top_10_analys.py ${rna_seq_threshold_path} ${thresh_paired_path} ${thresh_top_10_by_barcode} ${thresh_top_10_by_promoter}

# # all barcodes
# thresh_all_by_barcode=${thresh_tech_rep}/all/by_barcode/${threshold_and_number}_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_all.csv
# thresh_all_by_promoter=${thresh_tech_rep}/all/by_promoter/${threshold_and_number}_${cell_line}_bio_${bio_rep}_tech_${tech_rep}_all.csv
# python3 all_barcodes_per_cell_analys.py ${rna_seq_threshold_path} ${thresh_paired_path} ${thresh_all_by_barcode} ${thresh_all_by_promoter}

# # example of running - ./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/clipped_rep3_HEK293T.fastq results HEK293T rep3 100 3