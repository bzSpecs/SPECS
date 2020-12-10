import pandas as pd
import ipdb
import sys
import os

results_by_promoter_csv_file = sys.argv[1]
raw_paired_mapping_path = sys.argv[2]
new_reversed_paired_output_file = sys.argv[3]

table = str.maketrans("ACTG", "TGAC")

promoter_count_df = pd.read_csv(results_by_promoter_csv_file)
paired = pd.read_csv(raw_paired_mapping_path)

# removed empty rows with promoter or barcode
# drop duplicate rows of the set of promoter and barcode
paired.dropna(axis=0, subset=['promoter', 'barcode'], inplace=True)
paired.drop_duplicates(subset=['promoter', 'barcode'], inplace=True)
paired.drop_duplicates(subset='barcode', keep=False, inplace=True)
paired = paired.reset_index(drop=True)


paired['promoter_without_id'] = pd.DataFrame(
    [x.split(';')[1] for x in paired['promoter']])
promoter_count_df['reverse_promoter_without_id'] = pd.DataFrame(
    [x.split(';')[1].translate(table)[::-1] for x in promoter_count_df['promoter']])

reversed_paired = promoter_count_df.set_index(
    'reverse_promoter_without_id').join(paired.set_index('promoter_without_id'), lsuffix="_results", rsuffix="_paired").reset_index()
reversed_paired = pd.DataFrame(
    {'id_': reversed_paired['id_'], 'promoter': reversed_paired['promoter_paired'], 'barcode': reversed_paired['barcode']})

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(new_reversed_paired_output_file)):
    os.makedirs(os.path.dirname(new_reversed_paired_output_file))

# save to csv
reversed_paired.to_csv(new_reversed_paired_output_file, index=False)
