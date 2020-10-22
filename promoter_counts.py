# The Script: find counts for each promoter.

# Import Librarys
import pandas as pd
import sys
import os

barcode_counts = sys.argv[1]
unique_pairs_csv = sys.argv[2]
output_promoters_count = sys.argv[3]

# Read the inputs file
barcode_counts_df = pd.read_csv(barcode_counts)
unique_pairs_df = pd.read_csv(unique_pairs_csv)

# Merge DataFrames
merged = (
    barcode_counts_df.set_index("barcode")
    .join(unique_pairs_df.set_index("barcode"))
    .reset_index()
)

# Combining the counts of the promoters
promoter_counts_result = (
    merged.groupby(["promoter"]).sum().reset_index().rename(columns={0: "count"})
)

# sort the values
promoter_counts_result = promoter_counts_result.sort_values(by="count", ascending=False)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_promoters_count)):
    os.makedirs(os.path.dirname(output_promoters_count))

# Write DataFrame to csv file
promoter_counts_result.to_csv(output_promoters_count, index=False)

# python3 promoter_counts.py ./output_barcodes_file.csv ./results_2/unique_paired.csv ./output_promoter_counts.csv
