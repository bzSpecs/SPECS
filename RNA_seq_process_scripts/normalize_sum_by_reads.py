import pandas as pd
import ipdb
import sys
import os

promoter_results_file = sys.argv[1]
barcode_reads_file = sys.argv[2]
multiplier = int(sys.argv[3])

output_file = sys.argv[4]

results_df = pd.read_csv(promoter_results_file)
reads_df = pd.read_csv(barcode_reads_file)

results_df["count"] = (results_df["count"] / len(reads_df)) * multiplier

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

results_df.to_csv(output_file, index=False)