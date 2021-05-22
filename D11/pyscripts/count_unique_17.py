# The Script: find counts for each promoter.

# Import Librarys
import pandas as pd
import sys
import os
import ipdb

unique_17_and_bc_csv_file = sys.argv[1]
output_file = sys.argv[2]

unique_17_and_bc_df = pd.read_csv(unique_17_and_bc_csv_file)

# Combining the counts of the promoters
unique_17_counts_result = (
    unique_17_and_bc_df.groupby(["unique_17"]).size().reset_index().rename(columns={0: "count"})
)

# sort the values
unique_17_counts_result = unique_17_counts_result.sort_values(by="count", ascending=False)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

# Write DataFrame to csv file
unique_17_counts_result.to_csv(output_file, index=False)

