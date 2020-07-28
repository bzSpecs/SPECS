import pandas as pd
import ipdb
import sys
import os

top_tresh_3_barcodes_csv_path = sys.argv[1]
raw_data_csv = sys.argv[2]
output_csv_path = sys.argv[3]

top_tresh_3_barcodes_df = pd.read_csv(top_tresh_3_barcodes_csv_path)
raw_data_df = pd.read_csv(raw_data_csv)

merged = top_tresh_3_barcodes_df.set_index('barcode').join(
    raw_data_df.set_index('barcode')).reset_index()

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_csv_path)):
    os.makedirs(os.path.dirname(output_csv_path))

merged.to_csv(output_csv_path, index=False)
