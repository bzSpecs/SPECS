import ipdb
import pandas as pd
import sys
import os

files = sys.argv[1]
files = files.split(",")

output_paths = sys.argv[2]
output_paths = output_paths.split(",")

kmer_mapping_csv_path = sys.argv[3]
kmer_df = pd.read_csv(kmer_mapping_csv_path)

fold_number = int(sys.argv[4])

dfs = []

for f in files:
    dfs.append(pd.read_csv(f))

for i in range(len(output_paths)):
    output_csv_path = output_paths[i]
    df = dfs[i].copy()
    for j in range(len(dfs)):
        if j == i:
            continue

        compare_df = dfs[j]

        df = (
            df.set_index("promoter")
            .join(compare_df.set_index("promoter"), rsuffix="_compare")
            .sort_values(by=["count"], ascending=False)
        )
        df = df[
            (df["count_compare"].isnull())
            | (df["count_compare"] / df["count"] <= 1 / fold_number)
        ]
        df.drop(columns=["count_compare"], inplace=True)
        df = df.reset_index()

    df["id"] = df["promoter"].str.split(";", expand=True)[0]
    df = df.set_index("id").join(kmer_df.set_index("id"))

    # create the folder if not exists yet
    if not os.path.exists(os.path.dirname(output_csv_path)):
        os.makedirs(os.path.dirname(output_csv_path))

    df.to_csv(output_csv_path, index=False)