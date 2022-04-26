# The Script: find counts for each promoter.

# Import Librarys
import pandas as pd
import sys
import os
import ipdb

unique_17_and_bc_csv_file = sys.argv[1]
output_file = sys.argv[2]

unique_17_and_bc_df = pd.read_csv(unique_17_and_bc_csv_file)

unique_17_counts_result = (
    unique_17_and_bc_df["unique_17"]
    .value_counts(sort=True)
    .rename_axis("unique_17")
    .reset_index(name="count")
)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

# Write DataFrame to csv file
unique_17_counts_result.to_csv(output_file, index=False)
