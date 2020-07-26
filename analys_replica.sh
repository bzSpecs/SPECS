#!/bin/bash

paired_path=$1 # promoter-barcode mapping
rna_seq_fastq_path=$2 # RNA-seq fastq file
replication=$3 # replication name
highlight_value=$4 # highlight minimum value

arrIN=(${rna_seq_fastq_path//\// })
folder_name_index=$((${#arrIN[@]}-2))
folder_name=${arrIN[${folder_name_index}]}

full_folder_name=results/${folder_name}

mkdir -p results
mkdir -p ${full_folder_name}

if [ -f "results/distinct_PAIRED.csv" ]; then
        echo "distinct_PAIRED.csv exists."
else
        python3 barcodes_promotors_mapping_distinct.py ${paired_path} results/distinct_PAIRED.csv
fi

# python3 second_exp_extract_barcodes.py ${rna_seq_fastq_path} ${full_folder_name}/raw_barcodes_csv/${replication}_${folder_name}_barcodes.csv

# # highlighted barcodes by number of reads
# python3 highlights_by_min_barcodes_representations.py ${full_folder_name}/raw_barcodes_csv/${replication}_${folder_name}_barcodes.csv results/distinct_PAIRED.csv ${full_folder_name}/highlights_results/${replication}_${folder_name}_highlights.csv ${highlight_value}

# # top 10 barcodes for replica
# python3 top_10_analys.py ${full_folder_name}/raw_barcodes_csv/${replication}_${folder_name}_barcodes.csv results/distinct_PAIRED.csv ${full_folder_name}/top_10/${replication}_${folder_name}_top_10.csv ${highlight_value}

# # all barcodes
# python3 all_barcodes_per_cell_analys.py ${full_folder_name}/raw_barcodes_csv/${replication}_${folder_name}_barcodes.csv results/distinct_PAIRED.csv ${full_folder_name}/all_barcodes/${replication}_${folder_name}_all_barcodes.csv


################################################

if [ -f "results/tresh_3_PAIRED.csv" ]; then
        echo "tresh_3_PAIRED.csv exists."
else
        python3 barcodes_promotors_mapping_tresh_3.py ${paired_path} results/tresh_3_PAIRED.csv
fi

python3 find_highlights_in_duplicated_barcodes.py results/tresh_3_PAIRED.csv ${full_folder_name}/top_10/rep1_XEN_top_10.csv ${full_folder_name}/tresh_3/${replication}_${folder_name}_tresh_3.csv
python3 all_barcodes_per_cell_analys.py ${full_folder_name}/tresh_3/${replication}_${folder_name}_tresh_3.csv results/tresh_3_PAIRED.csv ${full_folder_name}/tresh_3/all_barcodes/${replication}_${folder_name}_all_barcodes.csv
# example of running - ./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/clipped_rep3_XEN.fastq rep3 100