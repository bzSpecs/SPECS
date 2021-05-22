import pandas as pd
import sys
import os
import ipdb

# reading the results files for each cell-line
files = sys.argv[1]
files = files.split(",")

cell_names = sys.argv[2]
cell_names = cell_names.split(",")

output_file = sys.argv[3]

# results dataframes
dfs = []
for f in files:
    dfs.append(pd.read_csv(f))

shared_promoters_df = dfs[0]

for i in range(1, len(dfs)):
    df = dfs[i]
    cell_name = cell_names[i]

    shared_promoters_df = shared_promoters_df.set_index('promoter').join(
        df.set_index('promoter'), rsuffix=f"_{cell_name}", how="inner").reset_index()

shared_promoters_df = shared_promoters_df.rename(columns={'count': f'count_{cell_names[0]}'})

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

shared_promoters_df.to_csv(output_file, index=False)
