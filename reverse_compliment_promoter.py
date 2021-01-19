# py script for finding the existance of the reverse compliment promoter in the same csv

import pandas as pd
import ipdb
import sys
import os

results_by_promoter_csv_file = sys.argv[1]
output_file = sys.argv[2]

table = str.maketrans("ACTG", "TGAC")

promoter_count_df = pd.read_csv(results_by_promoter_csv_file)

promoter_count_df['promoter_without_id'] = pd.DataFrame(
    [x.split(';')[1] for x in promoter_count_df['promoter']])
promoter_count_df['reverse_promoter_without_id'] = pd.DataFrame(
    [x.translate(table)[::-1] for x in promoter_count_df['promoter_without_id']])

merged_df = pd.merge(left=promoter_count_df, right=promoter_count_df,
                     left_on='promoter_without_id', right_on='reverse_promoter_without_id', how='left', suffixes=('', '_reverse'))
merged_df = merged_df[['promoter', 'promoter_reverse']]

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

# save to csv
merged_df.to_csv(output_file, index=False)
