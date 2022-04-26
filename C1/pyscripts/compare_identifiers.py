import pandas as pd
import ipdb
import sys
import os

files = sys.argv[1]
files = files.split(",")

file_names = sys.argv[2]
file_names = file_names.split(",")

output_file = sys.argv[3]

# results dataframes
dfs = []
for f in files:
    dfs.append(pd.read_csv(f))

out_df = dfs[0]
first_file_name = file_names[0]
out_df.rename(columns={"count": f'count_{first_file_name}'}, inplace=True)

for i in range(1, len(dfs)):
    df = dfs[i]
    name = file_names[i]

    out_df = out_df.merge(df, on=["unique_17", "barcode"], how="outer")
    out_df.rename(columns={"count": f'count_{name}'}, inplace=True)

for i in range(0, len(file_names)):
    name_1 = file_names[i]
    for j in range(i+1, len(file_names)):
        if i == j:
            continue
        
        name_2 = file_names[j]
        out_df[f'{name_1}_{name_2}_ratio'] = out_df[f'count_{name_1}']/out_df[f'count_{name_2}']


# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

out_df.to_csv(output_file, index=False)