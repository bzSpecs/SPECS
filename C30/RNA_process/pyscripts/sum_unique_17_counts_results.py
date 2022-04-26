import pandas as pd
import sys
import os
import ipdb

files = sys.argv[1]
files = files.split(",")

output_file = sys.argv[2]

dfs = []
for f in files:
    dfs.append(pd.read_csv(f))

merged = pd.DataFrame()
merged["unique_17"] = []
merged["count"] = []

for i in range(len(dfs)):
    df = dfs[i]

    merged = (
        merged.set_index("unique_17")
        .join(df.set_index("unique_17"), rsuffix="_df", how="outer")
        .reset_index()
    )
    merged = merged.fillna(0)
    merged["count"] = merged["count"] + merged["count_df"]
    merged.drop(columns=["count_df"], inplace=True)

merged = merged.sort_values(by="count", ascending=False)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

merged.to_csv(output_file, index=False)

