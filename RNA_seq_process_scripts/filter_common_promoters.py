import pandas as pd
import sys
import os
import ipdb

promoter_results_1 = sys.argv[1]
promoter_results_to_work_against = sys.argv[2]

output_file = sys.argv[3]

df = pd.read_csv(promoter_results_1)
df_to_work_against = pd.read_csv(promoter_results_to_work_against)

promoters_to_filter_on = df_to_work_against['promoter'].tolist()

df = df[df['promoter'].isin(promoters_to_filter_on)].reset_index(drop=True)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)

# python filter_common_promoters.py results_2/sum_all_replicate/ESC/ESC_sum_normalized.csv results_2/sum_all_replicate/ESC/ESC_sum_above_400.csv results_2/sum_all_replicate/ESC/ESC_sum_normalized_above_400.csv
