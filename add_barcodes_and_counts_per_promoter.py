# for now it supports only tech replicates results

import pandas as pd
import ipdb
import sys
import os

results_by_promoter_csv_file = sys.argv[1]
results_by_barcode_csv_file = sys.argv[2]
paired_mapping_path = sys.argv[3]
output_csv = sys.argv[4]

results_by_promoter_df = pd.read_csv(results_by_promoter_csv_file)
results_by_barcode_df = pd.read_csv(results_by_barcode_csv_file)
paired_df = pd.read_csv(paired_mapping_path)

barcodes_df_with_promoters = results_by_barcode_df.set_index(
    "barcode").join(paired_df.set_index("barcode")).dropna().reset_index()

promoters_with_barcodes_count_df = results_by_promoter_df.set_index("promoter").join(barcodes_df_with_promoters.set_index(
    "promoter"), lsuffix="_by_promoter", rsuffix="_by_barcode", ).sort_values(by=["count_by_barcode"], ascending=False).reset_index()

promoters_with_barcodes_count_df["barcode_and_count"] = promoters_with_barcodes_count_df["barcode"] + \
    "-" + promoters_with_barcodes_count_df["count_by_barcode"].astype(str)

promoters_with_barcodes_count_df = promoters_with_barcodes_count_df.drop(
    columns=["count_by_barcode"]).rename(columns={"count_by_promoter": "count"}).reset_index()

promoters_with_barcodes_count_df = promoters_with_barcodes_count_df.groupby(["promoter", "count"])["barcode_and_count"].apply(
    ", ".join).reset_index().rename(columns={"barcode_and_count": "barcodes_and_count"}).sort_values(by=["count"], ascending=False).reset_index(drop=True)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_csv)):
    os.makedirs(os.path.dirname(output_csv))

promoters_with_barcodes_count_df.to_csv(output_csv, index=False)
