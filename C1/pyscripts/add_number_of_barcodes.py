import pandas as pd
import sys
import os
import ipdb

paired_file = sys.argv[1]
output_file = sys.argv[2]

df = pd.read_csv(paired_file)
df = df.drop_duplicates(subset=['unique_17', 'barcode'])

df = df.groupby(['unique_17']).size().reset_index().rename(columns={0: "number_of_barcodes"}).sort_values(by='number_of_barcodes', ascending=False)


# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
