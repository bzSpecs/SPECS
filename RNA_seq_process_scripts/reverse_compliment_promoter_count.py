import pandas as pd
import ipdb
import sys
import os

# promoter_count_df:
#     promoter,count,promoter_without_id
#     DM_1111;AAT,3,AAT
#     ..
#     ..
#     ..
#     DM_2345;TTA,5,TTA

# second_promoter_count_df:
#     promoter,count,reverse_promoter_without_id
#     DM_1111;AAT,3,TTA
#     ..
#     ..
#     ..
#     DM_2345;TTA,5,AAT

# merged:
#     promoter,count,count_reverse,forward_reverse_ratio
#     DM_1111;AAT,3,5,0.6
#     ..
#     ..
#     ..
#     DM_2345;TTA,5,3,1.3

results_by_promoter_csv_file = sys.argv[1]
second_results_by_promoter_csv_file = sys.argv[2]
output_file = sys.argv[3]

table = str.maketrans("ACTG", "TGAC")

promoter_count_df = pd.read_csv(results_by_promoter_csv_file)
second_promoter_count_df = pd.read_csv(second_results_by_promoter_csv_file)

promoter_count_df['promoter_without_id'] = pd.DataFrame(
    [x.split(';')[1] for x in promoter_count_df['promoter']])

second_promoter_count_df['reverse_promoter_without_id'] = pd.DataFrame(
    [x.split(';')[1].translate(table)[::-1] for x in second_promoter_count_df['promoter']])

merged_df = pd.merge(left=promoter_count_df, right=second_promoter_count_df,
                     left_on='promoter_without_id', right_on='reverse_promoter_without_id', how='left', suffixes=('', '_reverse'))

merged_df = merged_df.drop(['promoter_reverse', 'promoter_without_id', 'reverse_promoter_without_id'], axis=1)

merged_df['forward_reverse_ratio'] = merged_df['count'] / \
    merged_df['count_reverse']

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

# save to csv
merged_df.to_csv(output_file, index=False)
