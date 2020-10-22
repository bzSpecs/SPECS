# The Script: find counts for each barcode.

# Import Librarys
import pandas as pd
import sys
import os

# Receiving Arguments
rna_seq_barcodes = sys.argv[1]
output_file_csv = sys.argv[2]

# Read the input file into dataframe
df = pd.read_csv(rna_seq_barcodes)

# Combining the counts of the barcodes
barcodes_counts_result = (
    df.groupby(["barcode"]).size().reset_index().rename(columns={0: "count"})
)
barcodes_counts_result = barcodes_counts_result.sort_values(by="count", ascending=False)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file_csv)):
    os.makedirs(os.path.dirname(output_file_csv))

# Write DataFrame to csv file
barcodes_counts_result.to_csv(output_file_csv, index=False)

# The code line:
# python3 .\barcodes_counts.py .\XEN_bio_2_tech_1_rna_seq_barcodes.csv ./output_barcodes_file.csv

# OUTPUT:
# barcode,count
# AAAAAAAAAAAACCCGCTCA,1
# AAAAAAACAGGAGCCCGGTT,7
