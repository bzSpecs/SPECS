# The Script: find counts for each promoter.

# Import Librarys
import pandas as pd
import sys
import os
import ipdb

unique_17_and_bc_csv_file = sys.argv[1]
output_file = sys.argv[2]

# Read the inputs file
unique_17_and_bc_df = pd.read_csv(unique_17_and_bc_csv_file)

# drop the id_ columns
unique_17_and_bc_df.drop(columns=['id_'], inplace=True)

# removed empty rows with unique_17 or barcode
unique_17_and_bc_df.dropna(axis=0, subset=['unique_17', 'barcode'], inplace=True)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

# Write DataFrame to csv file
unique_17_and_bc_df.to_csv(output_file, index=False)

