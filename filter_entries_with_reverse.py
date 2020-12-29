import pandas as pd
import sys
import os
import ipdb

results_file = sys.argv[1]
output_file = sys.argv[2]


table = str.maketrans("ACTG", "TGAC")

df = pd.read_csv(results_file)


df['promoter_without_id'] = pd.DataFrame(
    [x.split(';')[1] for x in df['promoter']])
reverse_promoters = [x.translate(table)[::-1] for x in df['promoter_without_id']]

df = df[df['promoter_without_id'].isin(reverse_promoters)]

df = df.drop(columns=['promoter_without_id'])

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
