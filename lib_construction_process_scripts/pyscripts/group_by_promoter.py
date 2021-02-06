import pandas as pd
import sys
import os
import ipdb

promoter_list_file = sys.argv[1]
output_file = sys.argv[2]

df = pd.read_csv(promoter_list_file)

df = df.groupby(by=['promoter']).size().reset_index().rename(
    columns={0: 'count'}).sort_values(by=['count'], ascending=False)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
