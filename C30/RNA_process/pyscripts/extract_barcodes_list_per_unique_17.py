import pandas as pd
import sys
import os
import ipdb
import matplotlib.pyplot as plt

paired_file = sys.argv[1]
output_file = sys.argv[2]

df = pd.read_csv(paired_file)
unique_17_and_number_of_bc = df.drop_duplicates(subset=["unique_17", "barcode"])
unique_17_and_number_of_bc = unique_17_and_number_of_bc["unique_17"].value_counts(sort=True).rename_axis("unique_17").reset_index(name="number_of_barcodes")

unique_17_and_bc_counts_result = (
    df.value_counts(sort=True)
    .rename_axis(["unique_17", "barcode"])
    .reset_index(name="count")
)
unique_17_with_barcodes_list = unique_17_and_bc_counts_result.groupby("unique_17")["count"].apply(list).reset_index(name="barcode_counts")
unique_17_with_barcodes_list = unique_17_with_barcodes_list.merge(unique_17_and_number_of_bc, on="unique_17").sort_values(by="number_of_barcodes", ascending=False).reset_index(drop=True)
unique_17_with_barcodes_list = unique_17_with_barcodes_list.drop(columns=["number_of_barcodes"])

# asd = unique_17_with_barcodes_list.iloc[0]["barcode_counts"]
# plt.hist(asd)
# plt.show()
ipdb.set_trace()

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

# Write DataFrame to csv file
unique_17_with_barcodes_list.to_csv(output_file, index=False)
