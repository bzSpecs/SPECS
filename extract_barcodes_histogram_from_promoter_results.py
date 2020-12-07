# for now it supports only tech replicates results

import pandas as pd
import ipdb
import sys
import os
import matplotlib
import matplotlib.pyplot as plt

results_by_promoter_csv_file = sys.argv[1]
results_by_barcode_csv_file = sys.argv[2]
paired_mapping_path = sys.argv[3]
output_folder = sys.argv[4]


def create_and_save_histogram(barcodes_distribution, file):
    s = pd.Series(barcodes_distribution)
    ax = s.hist()  # s is an instance of Series
    fig = ax.get_figure()
    plt.draw()
    fig.savefig(file)
    plt.close()


results_by_promoter_df = pd.read_csv(results_by_promoter_csv_file)
results_by_barcode_df = pd.read_csv(results_by_barcode_csv_file)
paired_df = pd.read_csv(paired_mapping_path)

barcodes_df_with_promoters = results_by_barcode_df.set_index(
    "barcode").join(paired_df.set_index("barcode")).dropna().reset_index()

promoters_with_barcodes_count_df = results_by_promoter_df.set_index("promoter").join(barcodes_df_with_promoters.set_index(
    "promoter"), lsuffix="_by_promoter", rsuffix="_by_barcode", ).sort_values(by=["count_by_barcode"], ascending=False).reset_index()

promoters_with_barcodes_count_df = promoters_with_barcodes_count_df.groupby(
    ["promoter", "count_by_promoter"])["count_by_barcode"].apply(list).reset_index().sort_values(by=["count_by_promoter"], ascending=False).reset_index(drop=True)


# create the folder if not exists yet
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

for index, row in promoters_with_barcodes_count_df.iterrows():
    create_and_save_histogram(row['count_by_barcode'],
                              f'{output_folder}/{row["promoter"]}_hist.pdf')
