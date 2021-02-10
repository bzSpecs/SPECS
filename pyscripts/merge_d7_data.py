import ipdb
import pandas as pd
import sys
import os

df_csv_file = sys.argv[1]
kmer_mapping_csv_path = sys.argv[2]
output_path = sys.argv[3]

kmer_df = pd.read_csv(kmer_mapping_csv_path)


df = pd.read_csv(df_csv_file)

df["id"] = df["promoter"].str.split(";", expand=True)[0]
df = df.set_index("id").join(kmer_df.set_index("id")).reset_index()

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_path)):
    os.makedirs(os.path.dirname(output_path))

df.to_csv(output_path, index=False)

# python3 merge_d7_data.py results_2/normalized_all_cell_lines_tech_results/all_cell_lines_promoters_results.csv ../For\ Alex\ -\ resources/libray_D7_details_v2.csv ./out.csv