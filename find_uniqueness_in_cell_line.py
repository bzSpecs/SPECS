import ipdb
import pandas as pd
import sys
import os

file_to_find_uniques_for = sys.argv[1]

files_to_compare_to = sys.argv[2]
files_to_compare_to = files_to_compare_to.split(",")

fold_number = int(sys.argv[3])

output_file = sys.argv[4]


df = pd.read_csv(file_to_find_uniques_for)

dfs_to_compare = []
for f in files_to_compare_to:
    dfs_to_compare.append(pd.read_csv(f))

for compare_df in dfs_to_compare:
    df = (
        df.set_index("promoter")
        .join(compare_df.set_index("promoter"), rsuffix="_compare")
        .sort_values(by=["count"], ascending=False)
    )
    df = df[
        (df["count_compare"].isnull())
        | (df["count_compare"] / df["count"] <= 1 / fold_number)
    ]
    df["ratio"] = df["count"] / df["count_compare"]
    df = df.reset_index()

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)

# python find_uniqueness_in_cell_line.py results_2/sum_all_replicate/ESC/ESC_sum_normalized_above_400.csv results_2/sum_all_replicate/XEN/XEN_sum_normalized_above_100.csv,results_2/sum_all_replicate/MEF/MEF_sum_normalized_above_100.csv,results_2/sum_all_replicate/HEK293T/HEK293T_sum_normalized_above_100.csv 50 ./out.csv

# python find_uniqueness_in_cell_line.py results_leukemia/HIGH/bio_A/unique/tech_3/all/by_promoter/normalized_unique_HIGH_bio_A_tech_3_all.csv results_leukemia/LOW/bio_A/unique/tech_3/all/by_promoter/normalized_unique_LOW_bio_A_tech_3_all.csv 5 results_leukemia/HIGH/bio_A/unique/tech_3/all/by_promoter/unique_compared_to_LOW_A_3.csv