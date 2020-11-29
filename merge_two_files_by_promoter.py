# Import Librarys
import pandas as pd
import sys
import os

# Receiving Arguments
first_file = sys.argv[1]
second_file = sys.argv[2]
first_suffix = sys.argv[3]
second_suffix = sys.argv[4]
sort_by = sys.argv[5]
ascending = sys.argv[6] == "True"
output_file_csv = sys.argv[7]


# Read the input file into dataframe
first_df = pd.read_csv(first_file)
second_df = pd.read_csv(second_file)

merged = (
    first_df.set_index("promoter")
    .join(
        second_df.set_index("promoter"),
        lsuffix="_" + first_suffix,
        rsuffix="_" + second_suffix,
    )
    .dropna()
    .reset_index()
    .sort_values(by=[sort_by], ascending=[ascending])
)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file_csv)):
    os.makedirs(os.path.dirname(output_file_csv))

# Write DataFrame to csv file
merged.to_csv(output_file_csv, index=False)