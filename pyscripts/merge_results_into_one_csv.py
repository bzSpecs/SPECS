import pandas as pd
import ipdb
import sys
import os

# reading the results files for each cell-line
files = sys.argv[1]
files = files.split(",")

# get the cell line names for the columns names
cells_names = sys.argv[2]
cells_names = cells_names.split(",")

# get the paired barcode-promoter csv file to set up all of the existing promoters
paired_csv_file = sys.argv[3]

# cell-line to sort by
cell_to_sort_by = sys.argv[4]

# the output file
output_file = sys.argv[5]

# results dataframes
dfs = []
for f in files:
    dfs.append(pd.read_csv(f))

# set up all the promoters the exist in a df
summarized_df = pd.read_csv(paired_csv_file)
summarized_df.drop_duplicates(subset=['promoter'], inplace=True)
summarized_df.drop(columns=["barcode"], inplace=True)

count_columns_names = []

# join the count results to the promoter for each cell-line result dataframe
for i in range(len(dfs)):
    df = dfs[i]
    cell_line_name = cells_names[i]
    column_name = "count_" + cell_line_name
    count_columns_names.append(column_name)

    summarized_df = summarized_df.set_index("promoter").join(
        df.set_index("promoter"), how="outer").reset_index()
    summarized_df.rename(columns={"count": column_name}, inplace=True)

# sort the summarized dataframe to a the chosen cell-line
column_to_sort_by = "count_" + cell_to_sort_by
summarized_df = summarized_df.sort_values(
    by=[column_to_sort_by], ascending=False)

summarized_df = summarized_df.dropna(subset=count_columns_names, how='all')
summarized_df = summarized_df.fillna(0)
ipdb.set_trace()

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

summarized_df.to_csv(output_file, index=False)

# python3 merge_results_into_one_csv.py results_2/normalized_all_cell_lines_tech_results/XEN/XEN_sum.csv,results_2/normalized_all_cell_lines_tech_results/HEK293T/HEK293T_sum.csv,results_2/normalized_all_cell_lines_tech_results/MEF/MEF_sum.csv,results_2/normalized_all_cell_lines_tech_results/ESC/ESC_sum.csv XEN,HEK293T,MEF,ESC results_2/unique_PAIRED.csv XEN results_2/normalized_all_cell_lines_tech_results/all_cell_lines_promoters_results.csv