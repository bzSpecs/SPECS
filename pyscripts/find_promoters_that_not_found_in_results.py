import pandas as pd
import ipdb
import sys
import os

# reading the results files for each cell-line
files = sys.argv[1]
files = files.split(",")

# get the paired barcode-promoter csv file to set up all of the existing promoters
paired_csv_file = sys.argv[2]

# the output file
output_file = sys.argv[3]

# results dataframes
dfs = []
for f in files:
    dfs.append(pd.read_csv(f))

# set up all the promoters the exist in a df
summarized_df = pd.read_csv(paired_csv_file)
summarized_df.drop_duplicates(subset=['promoter'], inplace=True)
summarized_df.drop(columns=["barcode"], inplace=True)

# join the count results to the promoter for each cell-line result dataframe
for i in range(len(dfs)):
    df = dfs[i]
    
    summarized_df = summarized_df.set_index('promoter').join(df.set_index('promoter'), how='outer').reset_index()
    summarized_df = summarized_df[summarized_df['count'].isnull()]
    summarized_df = summarized_df.drop(columns=["count"])


# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

summarized_df.to_csv(output_file, index=False)
