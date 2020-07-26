import pandas as pd
import ipdb
import matplotlib.pyplot as plt
import sys
import os

second_exp_barcode_results_csv_path = sys.argv[1]
distinct_paired_mapping_path = sys.argv[2]
output_highlighted_barcodes_promoter_path = sys.argv[3]
highlight_minimum_value = int(sys.argv[4])

df_sec_exp_results = pd.read_csv(second_exp_barcode_results_csv_path)
df_grouped = df_sec_exp_results.groupby(
    ['barcode']).size().reset_index().rename(columns={0: 'count'})
df_grouped.sort_values(by=['count'], ascending=False, inplace=True)

# first experiment distincts
df_paired = pd.read_csv(distinct_paired_mapping_path)

# join
merged = df_paired.set_index('barcode').join(df_grouped.set_index('barcode'))
merged.sort_values(by=['count'], ascending=False, inplace=True)
merged.dropna(axis=0, subset=['count'], inplace=True)
merged.reset_index(inplace=True)
merged = merged.astype({'count': 'int64'})
merged = merged.head(10)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_highlighted_barcodes_promoter_path)):
    os.makedirs(os.path.dirname(output_highlighted_barcodes_promoter_path))

merged.to_csv(output_highlighted_barcodes_promoter_path, index=False)
