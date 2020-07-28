import pandas as pd
import ipdb
import sys
import os

tresh_3_paired_csv_path = sys.argv[1]
top_barcodes_promoters_replica_csv_path = sys.argv[2]
output_csv_path = sys.argv[3]

tresh_3_df = pd.read_csv(tresh_3_paired_csv_path)
top_df = pd.read_csv(top_barcodes_promoters_replica_csv_path)


merged = top_df.set_index('promoter').join(
    tresh_3_df.set_index('promoter'), lsuffix='_top', rsuffix='_tresh').reset_index()
merged.drop(columns=['barcode_top', 'count', 'promoter'], inplace=True)
merged.rename(columns={"barcode_tresh": "barcode"}, inplace=True)
# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_csv_path)):
    os.makedirs(os.path.dirname(output_csv_path))

merged.to_csv(output_csv_path, index=False)
