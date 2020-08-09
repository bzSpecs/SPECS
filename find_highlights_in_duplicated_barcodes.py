import pandas as pd
import ipdb
import sys
import os

tresh_3_paired_csv_path = sys.argv[1]
top_barcodes_promoters_replica_csv_path = sys.argv[2]
output_csv_path = sys.argv[3]

tresh_3_df = pd.read_csv(tresh_3_paired_csv_path)
top_df = pd.read_csv(top_barcodes_promoters_replica_csv_path)
top_df.drop(columns=['count'], inplace=True)

merged = top_df.set_index('promoter').join(
    tresh_3_df.set_index('promoter')).reset_index()

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_csv_path)):
    os.makedirs(os.path.dirname(output_csv_path))

merged.to_csv(output_csv_path, index=False)
