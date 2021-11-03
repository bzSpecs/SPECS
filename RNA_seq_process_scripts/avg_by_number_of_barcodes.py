import pandas as pd
import ipdb
import sys
import os

promoter_results_file = sys.argv[1]
library_csv = sys.argv[2]
multipler = int(sys.argv[3])
output_file = sys.argv[4]

results_df = pd.read_csv(promoter_results_file)
library_df = pd.read_csv(library_csv)

number_of_bc_per_promoter = library_df.groupby(['promoter']).size().reset_index().rename(columns={0: "number_of_barcodes"}).sort_values(by='number_of_barcodes', ascending=False)

df = results_df.set_index('promoter').join(number_of_bc_per_promoter.set_index('promoter')).reset_index()

df['count'] = (df['count']/df['number_of_barcodes'])*multipler

df = df.sort_values(by='count', ascending=False)

df = df[['promoter', 'count']]

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
