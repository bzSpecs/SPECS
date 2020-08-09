import pandas as pd
import ipdb
import os
import sys

#
barcode_promoter_paired_list_path = sys.argv[1]
threshold_number = int(sys.argv[2])
output_csv_path = sys.argv[3]

df = pd.read_csv(barcode_promoter_paired_list_path)

# drop the id_ columns
df.drop(columns=['id_'], inplace=True)

# removed empty rows with promoter or barcode
df.dropna(axis=0, subset=['promoter', 'barcode'], inplace=True)
print("Number of rows without empty cells is: {}".format(len(df)))

# drop duplicate rows of the set of promoter and barcode
df.drop_duplicates(subset=['promoter', 'barcode'], inplace=True)
print("Number of rows without duplicated rows (set of promoter and barcode) is: {}".format(len(df)))

# Keep only the barcodes that have less or equals to 3 representations
threshold_df = df.groupby(by=['barcode']).size().reset_index().rename(columns={0: 'count_reads'}).sort_values(
    by=['count_reads'], ascending=False)

threshold_df = threshold_df[~(threshold_df['count_reads'] > threshold_number)]
threshold_df.drop(columns=['count_reads'], inplace=True)
threshold_df.reset_index(drop=True, inplace=True)
threshold_df = threshold_df.set_index('barcode').join(
    df.set_index('barcode')).reset_index()

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_csv_path)):
    os.makedirs(os.path.dirname(output_csv_path))

# save to csv
threshold_df.to_csv(output_csv_path, index=False)
