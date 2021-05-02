import pandas as pd
import ipdb
import sys
import os
import math
import matplotlib
import matplotlib.pyplot as plt

# results in barcode,count format
results_csv_file = sys.argv[1]
hops = int(sys.argv[2])

output_file = sys.argv[3]

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))


def create_and_save_histogram(distribution, file):
    s = pd.Series(distribution)
    max = s.max()
    bins = [i*hops for i in range(math.ceil(max/hops))]
    ax = s.hist(bins=bins)  # s is an instance of Series
    fig = ax.get_figure()
    plt.draw()
    fig.savefig(file)
    plt.close()


results_df = pd.read_csv(results_csv_file)

create_and_save_histogram(
    results_df['count'], output_file)
