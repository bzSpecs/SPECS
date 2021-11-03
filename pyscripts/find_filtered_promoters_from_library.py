# find the promoters that don't appear in csv that have `promoter` column

import pandas as pd
import ipdb
import sys
import os

promoters_results_file = sys.argv[1]
library_d7_file = sys.argv[2]
output_file = sys.argv[3]

promoters_df = pd.read_csv(promoters_results_file)
lib_df = pd.read_csv(library_d7_file)

lib_df['promoter'] = lib_df['id'] + ';' + lib_df['motif']
df = lib_df.merge(promoters_df, on='promoter', how='left', indicator=True).query('_merge == "left_only"').drop('_merge', 1).reset_index(drop=True)
df = df['promoter']

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)