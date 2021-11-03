import pandas as pd
import sys
import os
import ipdb

files = sys.argv[1]
files = files.split(",")

columns = sys.argv[2]
columns = columns.split(",")

sort_by = sys.argv[3]
ascending = sys.argv[4] == "True"

output_file = sys.argv[5]

dfs = []
for f in files:
    dfs.append(pd.read_csv(f))

merged = dfs[0]

for i in range(1, len(dfs)):
    df = dfs[i]

    merged = (
        merged.set_index("unique_17")
        .join(df.set_index("unique_17"), rsuffix="_df", how="outer")
        .reset_index()
    )
    merged = merged.fillna(0)
    for c in columns:
        merged[c] = merged[c] + merged[f'{c}_df']
        merged.drop(columns=[f'{c}_df'], inplace=True)
        
    merged = merged[["unique_17"] + columns]
merged = merged.sort_values(by=sort_by, ascending=ascending)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

merged.to_csv(output_file, index=False)

