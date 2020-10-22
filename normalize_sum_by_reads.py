import pandas as pd
import ipdb
import sys
import os

tech_results_files = sys.argv[1]
tech_results_files = tech_results_files.split(",")

results_file_to_normalized_by = tech_results_files[0]

output_files = sys.argv[2]
output_files = output_files.split(",")

should_create_new_columns = sys.argv[3] == "True"

# results dataframes
dfs = []
for f in tech_results_files:
    dfs.append(pd.read_csv(f))

# the main experiment reads to normalized by
normalized_by_df = pd.read_csv(results_file_to_normalized_by)
normalized_number = normalized_by_df['count'].sum()

# ipdb.set_trace()
for i in range(len(dfs)):
    df = dfs[i]
    reads_number = df['count'].sum()

    experiment_normalized_number = normalized_number / reads_number

    if should_create_new_columns:
        df["strength"] = df["count"] / reads_number
        df["normalized_count"] = df["count"] * experiment_normalized_number
    else:
        df["count"] = df["count"] * experiment_normalized_number


    output_file = output_files[i]

    # create the folder if not exists yet
    if not os.path.exists(os.path.dirname(output_file)):
        os.makedirs(os.path.dirname(output_file))

    df.to_csv(output_file, index=False)

# python3 normalize_sum_by_reads.py results_2/HEK293T/bio_2/unique/tech_1/all/by_promoter/unique_HEK293T_bio_2_tech_1_all.csv,results_2/HEK293T/bio_2/unique/tech_2/all/by_promoter/unique_HEK293T_bio_2_tech_2_all.csv,results_2/HEK293T/bio_2/unique/tech_3/all/by_promoter/unique_HEK293T_bio_2_tech_3_all.csv,results_2/HEK293T/bio_3/unique/tech_1/all/by_promoter/unique_HEK293T_bio_3_tech_1_all.csv,results_2/HEK293T/bio_2/unique/tech_1/all/by_promoter/unique_HEK293T_bio_2_tech_1_all.csv,results_2/HEK293T/bio_3/unique/tech_3/all/by_promoter/unique_HEK293T_bio_3_tech_3_all.csv,results_2/MEF/bio_2/unique/tech_1/all/by_promoter/unique_MEF_bio_2_tech_1_all.csv,results_2/MEF/bio_2/unique/tech_2/all/by_promoter/unique_MEF_bio_2_tech_2_all.csv,results_2/MEF/bio_2/unique/tech_3/all/by_promoter/unique_MEF_bio_2_tech_3_all.csv,results_2/MEF/bio_3/unique/tech_1/all/by_promoter/unique_MEF_bio_3_tech_1_all.csv,results_2/MEF/bio_2/unique/tech_1/all/by_promoter/unique_MEF_bio_2_tech_1_all.csv,results_2/MEF/bio_3/unique/tech_3/all/by_promoter/unique_MEF_bio_3_tech_3_all.csv,results_2/ESC/bio_2/unique/tech_1/all/by_promoter/unique_ESC_bio_2_tech_1_all.csv,results_2/ESC/bio_2/unique/tech_2/all/by_promoter/unique_ESC_bio_2_tech_2_all.csv,results_2/ESC/bio_2/unique/tech_3/all/by_promoter/unique_ESC_bio_2_tech_3_all.csv,results_2/ESC/bio_3/unique/tech_1/all/by_promoter/unique_ESC_bio_3_tech_1_all.csv,results_2/ESC/bio_2/unique/tech_1/all/by_promoter/unique_ESC_bio_2_tech_1_all.csv,results_2/ESC/bio_3/unique/tech_3/all/by_promoter/unique_ESC_bio_3_tech_3_all.csv,results_2/XEN/bio_2/unique/tech_1/all/by_promoter/unique_XEN_bio_2_tech_1_all.csv,results_2/XEN/bio_2/unique/tech_2/all/by_promoter/unique_XEN_bio_2_tech_2_all.csv,results_2/XEN/bio_2/unique/tech_3/all/by_promoter/unique_XEN_bio_2_tech_3_all.csv,results_2/XEN/bio_3/unique/tech_1/all/by_promoter/unique_XEN_bio_3_tech_1_all.csv,results_2/XEN/bio_2/unique/tech_1/all/by_promoter/unique_XEN_bio_2_tech_1_all.csv,results_2/XEN/bio_3/unique/tech_3/all/by_promoter/unique_XEN_bio_3_tech_3_all.csv results_2/normalized_all_cell_lines_tech_results/HEK293T/HEK293T_bio_2_tech_1_normalized.csv,results_2/normalized_all_cell_lines_tech_results/HEK293T/HEK293T_bio_2_tech_2_normalized.csv,results_2/normalized_all_cell_lines_tech_results/HEK293T/HEK293T_bio_2_tech_3_normalized.csv,results_2/normalized_all_cell_lines_tech_results/HEK293T/HEK293T_bio_3_tech_1_normalized.csv,results_2/normalized_all_cell_lines_tech_results/HEK293T/HEK293T_bio_3_tech_2_normalized.csv,results_2/normalized_all_cell_lines_tech_results/HEK293T/HEK293T_bio_3_tech_3_normalized.csv,results_2/normalized_all_cell_lines_tech_results/MEF/MEF_bio_2_tech_1_normalized.csv,results_2/normalized_all_cell_lines_tech_results/MEF/MEF_bio_2_tech_2_normalized.csv,results_2/normalized_all_cell_lines_tech_results/MEF/MEF_bio_2_tech_3_normalized.csv,results_2/normalized_all_cell_lines_tech_results/MEF/MEF_bio_3_tech_1_normalized.csv,results_2/normalized_all_cell_lines_tech_results/MEF/MEF_bio_3_tech_2_normalized.csv,results_2/normalized_all_cell_lines_tech_results/MEF/MEF_bio_3_tech_3_normalized.csv,results_2/normalized_all_cell_lines_tech_results/ESC/ESC_bio_2_tech_1_normalized.csv,results_2/normalized_all_cell_lines_tech_results/ESC/ESC_bio_2_tech_2_normalized.csv,results_2/normalized_all_cell_lines_tech_results/ESC/ESC_bio_2_tech_3_normalized.csv,results_2/normalized_all_cell_lines_tech_results/ESC/ESC_bio_3_tech_1_normalized.csv,results_2/normalized_all_cell_lines_tech_results/ESC/ESC_bio_3_tech_2_normalized.csv,results_2/normalized_all_cell_lines_tech_results/ESC/ESC_bio_3_tech_3_normalized.csv,results_2/normalized_all_cell_lines_tech_results/XEN/XEN_bio_2_tech_1_normalized.csv,results_2/normalized_all_cell_lines_tech_results/XEN/XEN_bio_2_tech_2_normalized.csv,results_2/normalized_all_cell_lines_tech_results/XEN/XEN_bio_2_tech_3_normalized.csv,results_2/normalized_all_cell_lines_tech_results/XEN/XEN_bio_3_tech_1_normalized.csv,results_2/normalized_all_cell_lines_tech_results/XEN/XEN_bio_3_tech_2_normalized.csv,results_2/normalized_all_cell_lines_tech_results/XEN/XEN_bio_3_tech_3_normalized.csv True