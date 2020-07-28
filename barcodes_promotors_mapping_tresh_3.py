import pandas as pd
import ipdb
import sys

#
barcode_promoter_paired_list_path = sys.argv[1]
output_csv_path = sys.argv[2]

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
tresh_3_df = df.groupby(by=['barcode']).size().reset_index().rename(columns={0: 'count_reads'}).sort_values(
    by=['count_reads'], ascending=False)

tresh_3_df = tresh_3_df[~(tresh_3_df['count_reads'] > 3)]
tresh_3_df.drop(columns=['count_reads'], inplace=True)
tresh_3_df.reset_index(drop=True, inplace=True)
tresh_3_df = tresh_3_df.set_index('barcode').join(
    df.set_index('barcode')).reset_index()

# save to csv
tresh_3_df.to_csv(output_csv_path, index=False)
