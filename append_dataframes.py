# Import Librarys
import pandas as pd
import sys
import os

# Receiving Arguments
files = sys.argv[1]
files = files.split(",")

output_file_csv = sys.argv[2]

dfs = []
for f in files:
    dfs.append(pd.read_csv(f))

summarized_df = dfs[0].copy()

for i in range(1, len(dfs)):
    summarized_df = summarized_df.append(dfs[i], ignore_index=True)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file_csv)):
    os.makedirs(os.path.dirname(output_file_csv))

# Write DataFrame to csv file
summarized_df.to_csv(output_file_csv, index=False)