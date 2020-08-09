import pandas as pd
import ipdb
import os
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

# drop all the barcode that are not unique
df.drop_duplicates(subset='barcode', keep=False, inplace=True)
print("Number of rows without duplicates barcodes is: {}".format(len(df)))

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_csv_path)):
    os.makedirs(os.path.dirname(output_csv_path))

# save to csv
df.to_csv(output_csv_path, index=False)
