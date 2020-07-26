import pandas as pd
import ipdb
import matplotlib.pyplot as plt
import sys
import os

second_exp_barcode_results_csv_path = sys.argv[1]
distinct_paired_mapping_path = sys.argv[2]
output_highlighted_barcodes_promoter_path = sys.argv[3]

df_sec_exp_results = pd.read_csv(second_exp_barcode_results_csv_path)
df_grouped = df_sec_exp_results.groupby(
    ['barcode']).size().reset_index().rename(columns={0: 'count'})
df_grouped.sort_values(by=['count'], ascending=False, inplace=True)

# first experiment distincts
df_paired = pd.read_csv(distinct_paired_mapping_path)

ipdb.set_trace()

# join
merged = df_grouped.set_index('barcode').join(df_paired.set_index('barcode'))
merged.sort_values(by=['count'], ascending=False, inplace=True)
merged.reset_index(inplace=True)

ipdb.set_trace()

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_highlighted_barcodes_promoter_path)):
    os.makedirs(os.path.dirname(output_highlighted_barcodes_promoter_path))

merged.to_csv(output_highlighted_barcodes_promoter_path, index=False)
