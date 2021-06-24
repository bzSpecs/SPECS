import ipdb
import pandas as pd
import sys
import os

file_to_find_uniques_for = sys.argv[1]

files_to_compare_to = sys.argv[2]
files_to_compare_to = files_to_compare_to.split(",")

cell_names = sys.argv[3]
cell_names = cell_names.split(",")

fold_number = int(sys.argv[4])

output_file = sys.argv[5]

df = pd.read_csv(file_to_find_uniques_for)

dfs_to_compare = []
for f in files_to_compare_to:
    dfs_to_compare.append(pd.read_csv(f))

for i in range(len(dfs_to_compare)):
    cell_name = cell_names[i]
    compare_df = dfs_to_compare[i]

    df = (
        df.set_index("unique_17")
        .join(compare_df.set_index("unique_17"), rsuffix=f'_{cell_name}')
        .sort_values(by=["count"], ascending=False)
    )

    df = df[
        (df[f'count_{cell_name}'].isnull())
        | (df[f'count_{cell_name}'] / df["count"] <= 1 / fold_number)
    ]

    df[f'ratio_{cell_name}'] = df["count"] / df[f'count_{cell_name}']
    df[f'ratio_{cell_name}'] = df[f'ratio_{cell_name}'].fillna('Totaly Unique')
    df = df.reset_index()

df = df.fillna(0)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
