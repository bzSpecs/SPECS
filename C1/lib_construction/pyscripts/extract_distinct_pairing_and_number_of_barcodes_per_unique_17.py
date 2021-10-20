import pandas as pd
import os
import sys

paired_file = sys.argv[1]
distinct_paired_output_csv_path = sys.argv[2]
grouped_unique_17_output_csv_path = sys.argv[3]

df = pd.read_csv(paired_file)

# drop the id_ columns
df.drop(columns=['id_'], inplace=True)

# removed empty rows with unique_17 or barcode
df.dropna(axis=0, subset=['unique_17', 'barcode'], inplace=True)
print("Number of rows without empty cells is: {}".format(len(df)))

# drop duplicate rows of the set of unique_17 and barcode
df.drop_duplicates(subset=['unique_17', 'barcode'], inplace=True)
print("Number of rows without duplicated rows (set of unique_17 and barcode) is: {}".format(len(df)))

df.reset_index(inplace=True, drop=True)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(distinct_paired_output_csv_path)):
    os.makedirs(os.path.dirname(distinct_paired_output_csv_path))

# save to csv
df.to_csv(distinct_paired_output_csv_path, index=False)

grouped_unique_17_df = df.groupby(["unique_17"]).size().reset_index().rename(columns={0: "count"}).sort_values(by="count", ascending=False)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(grouped_unique_17_output_csv_path)):
    os.makedirs(os.path.dirname(grouped_unique_17_output_csv_path))

# save to csv
grouped_unique_17_df.to_csv(grouped_unique_17_output_csv_path, index=False)