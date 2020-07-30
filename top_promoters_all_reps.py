import pandas as pd
import ipdb
import sys
import os

rep1_results_csv_path = sys.argv[1]
rep2_results_csv_path = sys.argv[2]
rep3_results_csv_path = sys.argv[3]
num_of_rows = int(sys.argv[4])
output_csv_path = sys.argv[5]

rep1_df = pd.read_csv(rep1_results_csv_path)
rep2_df = pd.read_csv(rep2_results_csv_path)
rep3_df = pd.read_csv(rep3_results_csv_path)

merged = rep1_df.set_index('promoter').join(rep2_df.set_index('promoter'), lsuffix='_rep1', rsuffix='_rep2').join(
    rep3_df.set_index('promoter')).rename(columns={"count": "count_rep3"})
merged = merged.fillna(0)
merged = merged.astype({'count_rep2': 'int64', 'count_rep3': 'int64'})

merged['total'] = merged['count_rep1'] + \
    merged['count_rep2'] + merged['count_rep3']

merged.drop(labels=['count_rep1', 'count_rep2',
                    'count_rep3'], axis=1, inplace=True)
merged.sort_values(by=['total'], ascending=False, inplace=True)

top = merged.head(num_of_rows)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_csv_path)):
    os.makedirs(os.path.dirname(output_csv_path))

top.to_csv(output_csv_path)
