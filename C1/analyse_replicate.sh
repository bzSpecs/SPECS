#!/bin/bash

root_output_folder=$1
experiment_name=$2
cell_line_name=$3
bio_name=$4
sample_name=$5
paired_csv_file=$6
pyscripts_folder=$7
c1_lib_csv=$8

python -m pip install matplotlib
python -c "import matplotlib"
python -m pip install numpy
python -c "import numpy"
python -m pip install pandas
python -c "import pandas"
python -m pip install ipdb
python -c "import ipdb"


# folder of the sample results
sample_folder=$root_output_folder/$experiment_name/$cell_line_name/$bio_name/$sample_name

# create a cleaned raw paired csv file - remove entities with empty column values
cleaned_raw_paired_csv_file=$sample_folder/cleaned_raw_paired.csv
python $pyscripts_folder/clean_raw_paired_file.py $paired_csv_file $cleaned_raw_paired_csv_file

# simple `unique_17` count
unique_17_count_output_file=$sample_folder/unique_17_count.csv
python $pyscripts_folder/count_unique_17.py $cleaned_raw_paired_csv_file $unique_17_count_output_file

# normalized the count of the `unique_17 - count` by the number of reads
normalized_unique_17_count_output_file=$sample_folder/normalized_unique_17_count.csv
python $pyscripts_folder/normalize_column_by_reads.py $unique_17_count_output_file $cleaned_raw_paired_csv_file count 100000 $normalized_unique_17_count_output_file

# simple `unique_17 - barcode` combination count
unique_17_barcode_count_output_file=$sample_folder/unique_17_barcode_count.csv
python $pyscripts_folder/count_unique_17_barcode.py $cleaned_raw_paired_csv_file $unique_17_barcode_count_output_file

# normalized the count of the `unique_17 - barcode - count` by the number of reads
normalized_unique_17_barcode_count_output_file=$sample_folder/normalized_unique_17_barcode_count.csv
python $pyscripts_folder/normalize_column_by_reads.py $unique_17_barcode_count_output_file $cleaned_raw_paired_csv_file count 100000 $normalized_unique_17_barcode_count_output_file

# create file of unique_17 and the number of barcodes that constructed it
unique_17_and_number_of_barcode_output_file=$sample_folder/unique_17_and_number_of_barcode.csv
python $pyscripts_folder/add_number_of_barcodes.py $cleaned_raw_paired_csv_file $unique_17_and_number_of_barcode_output_file

# avg of the unique_17 count by its number of barcodes
avg_unique_17_count_output_file=$sample_folder/avg_unique_17_count.csv
python $pyscripts_folder/join_specific_columns.py $unique_17_count_output_file $unique_17_and_number_of_barcode_output_file unique_17 unique_17 "" "" "" "" "" "" count False $avg_unique_17_count_output_file
python $pyscripts_folder/calculate_ratio_between_columns.py $avg_unique_17_count_output_file count number_of_barcodes avg_count_per_number_of_barcodes "" 0 1000 $avg_unique_17_count_output_file
python $pyscripts_folder/sort_df_by_column.py $avg_unique_17_count_output_file avg_count_per_number_of_barcodes False $avg_unique_17_count_output_file

# avg of the unique_17 normalized count by its number of barcodes
avg_normalized_unique_17_count_output_file=$sample_folder/avg_normalized_unique_17_count.csv
python $pyscripts_folder/join_specific_columns.py $normalized_unique_17_count_output_file $unique_17_and_number_of_barcode_output_file unique_17 unique_17 "" "" "" "" "" "" count False $avg_normalized_unique_17_count_output_file
python $pyscripts_folder/calculate_ratio_between_columns.py $avg_normalized_unique_17_count_output_file count number_of_barcodes avg_count_per_number_of_barcodes "" 0 1000 $avg_normalized_unique_17_count_output_file
python $pyscripts_folder/sort_df_by_column.py $avg_normalized_unique_17_count_output_file avg_count_per_number_of_barcodes False $avg_normalized_unique_17_count_output_file

# output summarized info file which contains unique_17,normalized_count,number_of_barcodes,avg_count_per_number_of_barcodes,count 
summarized_info_of_unique_17_count_file=$sample_folder/summarized_info_of_unique_17_count.csv
python $pyscripts_folder/rename_columns.py $avg_normalized_unique_17_count_output_file count normalized_count $summarized_info_of_unique_17_count_file
python $pyscripts_folder/join_specific_columns.py $summarized_info_of_unique_17_count_file $unique_17_count_output_file unique_17 unique_17 count "" "" "" "" "" avg_count_per_number_of_barcodes False $summarized_info_of_unique_17_count_file

# forward-reverse report
summarized_info_forward_reverse=$sample_folder/summarized_info_of_unique_17_count_with_forward_reverse.csv
normalized_count_forward_reverse_plot_file=$sample_folder/forward_reverse_by_nomalized_count_plot.png
avg_count_forward_reverse_plot_file=$sample_folder/forward_reverse_by_avg_count_plot.png
normalized_count_forward_reverse_r_squared_file=$sample_folder/forward_reverse_by_nomalized_count_r_squared.txt
avg_count_forward_reverse_r_squared_file=$sample_folder/forward_reverse_by_avg_count_r_squared.txt
python $pyscripts_folder/join_specific_columns.py $summarized_info_of_unique_17_count_file $c1_lib_csv unique_17 "Unique 17bp" Kmer,Direction "" "" left "" "" avg_count_per_number_of_barcodes False $summarized_info_forward_reverse
python $pyscripts_folder/reverse_compliment_promoter_count.py $summarized_info_forward_reverse $summarized_info_forward_reverse $summarized_info_forward_reverse
python $pyscripts_folder/filter_dataframe_by_specific_column_values.py $summarized_info_forward_reverse Direction Forward $summarized_info_forward_reverse
python $pyscripts_folder/calculate_ratio_between_columns.py $summarized_info_forward_reverse normalized_count normalized_count_reverse forward_reverse_normalized_count "" 0 1 $summarized_info_forward_reverse
python $pyscripts_folder/calculate_ratio_between_columns.py $summarized_info_forward_reverse avg_count_per_number_of_barcodes avg_count_per_number_of_barcodes_reverse forward_reverse_avg_count "" 0 1 $summarized_info_forward_reverse
python $pyscripts_folder/plot_relation.py $summarized_info_forward_reverse Forward unique_17 normalized_count $summarized_info_forward_reverse Reverse unique_17 normalized_count_reverse "Forward_Reverse - count" $normalized_count_forward_reverse_plot_file
python $pyscripts_folder/plot_relation.py $summarized_info_forward_reverse Forward unique_17 avg_count_per_number_of_barcodes $summarized_info_forward_reverse Reverse unique_17 avg_count_per_number_of_barcodes_reverse "Forward_Reverse - AVG" $avg_count_forward_reverse_plot_file
python pyscripts/calculate_r_squared.py $summarized_info_forward_reverse unique_17 normalized_count $summarized_info_forward_reverse unique_17 normalized_count_reverse $normalized_count_forward_reverse_r_squared_file
python pyscripts/calculate_r_squared.py $summarized_info_forward_reverse unique_17 avg_count_per_number_of_barcodes $summarized_info_forward_reverse unique_17 avg_count_per_number_of_barcodes_reverse $avg_count_forward_reverse_r_squared_file
