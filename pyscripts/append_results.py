import pandas as pd
import ipdb
import sys
import os

# reading the results files for each cell-line
files = sys.argv[1]
files = files.split(",")

# the output file
output_file = sys.argv[2]

# results dataframes
dfs = []
for f in files:
    dfs.append(pd.read_csv(f))

summarized_df = dfs[0]

for i in range(1, len(dfs)):
    df = dfs[i]
    summarized_df = summarized_df.append(df)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

summarized_df.to_csv(output_file, index=False)
