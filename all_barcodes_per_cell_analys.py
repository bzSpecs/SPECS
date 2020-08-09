import pandas as pd
import ipdb
import sys
import os

barcodes_results_csv_path = sys.argv[1]
paired_mapping_path = sys.argv[2]
output_barcodes_path = sys.argv[3]
output_promoters_path = sys.argv[4]

barcodes_results_df = pd.read_csv(barcodes_results_csv_path)
barcodes_results_df_grouped = barcodes_results_df.groupby(
    ['barcode']).size().reset_index().rename(columns={0: 'count'})
barcodes_results_df_grouped.sort_values(
    by=['count'], ascending=False, inplace=True)

# promoter-barcode paired
paired_df = pd.read_csv(paired_mapping_path)

# help us map the promoters back
merged_by_barcode = barcodes_results_df_grouped.set_index(
    'barcode').join(paired_df.set_index('barcode'))
merged_by_barcode.dropna(axis=0, subset=['promoter'], inplace=True)
merged_by_barcode.sort_values(by=['count'], ascending=False, inplace=True)
merged_by_barcode.reset_index(inplace=True)

merged_by_promoter = merged_by_barcode.groupby(
    ['promoter']).sum().reset_index().sort_values(by=['count'], ascending=False)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_barcodes_path)):
    os.makedirs(os.path.dirname(output_barcodes_path))

merged_by_barcode.to_csv(output_barcodes_path, index=False)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_promoters_path)):
    os.makedirs(os.path.dirname(output_promoters_path))

merged_by_promoter.to_csv(output_promoters_path, index=False)