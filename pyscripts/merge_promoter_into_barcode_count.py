# Import Librarys
import pandas as pd
import sys
import os

# Receiving Arguments
barcode_count_csv_file = sys.argv[1]
promoter_barcode_paired_file = sys.argv[2]
output_file_csv = sys.argv[3]


# Read the input file into dataframe
barcode_count_df = pd.read_csv(barcode_count_csv_file)
promoter_barcode_paired_df = pd.read_csv(promoter_barcode_paired_file)

merged = (
    barcode_count_df.set_index("barcode")
    .join(promoter_barcode_paired_df.set_index("barcode"))
    .dropna()
    .reset_index()
    .sort_values(by=["promoter", "count"], ascending=[True, False])
)


# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file_csv)):
    os.makedirs(os.path.dirname(output_file_csv))

# Write DataFrame to csv file
merged.to_csv(output_file_csv, index=False)