import pandas as pd
import ipdb
import sys
import os
import matplotlib
import matplotlib.pyplot as plt

# results in barcode,count format
results_by_barcode_csv_file = sys.argv[1]

output_file = sys.argv[2]

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))


def create_and_save_histogram(barcodes_distribution, file):
    s = pd.Series(barcodes_distribution)
    ax = s.hist()  # s is an instance of Series
    fig = ax.get_figure()
    plt.draw()
    fig.savefig(file)
    plt.close()


results_by_barcode_df = pd.read_csv(results_by_barcode_csv_file)

create_and_save_histogram(
    results_by_barcode_df['count'], output_file)
