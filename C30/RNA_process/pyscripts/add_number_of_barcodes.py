import pandas as pd
import sys
import os
import ipdb

paired_file = sys.argv[1]
output_file = sys.argv[2]

df = pd.read_csv(paired_file)
df = df.drop_duplicates(subset=["unique_17", "barcode"])

df = df["unique_17"].value_counts(sort=True).rename_axis("unique_17").reset_index(name="number_of_barcodes")


# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
