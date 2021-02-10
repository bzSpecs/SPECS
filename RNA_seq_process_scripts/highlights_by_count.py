import pandas as pd
import sys
import os

# Read the arguments
results_csv = sys.argv[1]  # promoter-count or barcode-count
output_file_csv = sys.argv[2]  # highlights csv output file
highlight_minimum_value = int(
    sys.argv[3]
)  # highlight promoter/barcode should have counts more than that value

# read the results csv into a DataFrame
df = pd.read_csv(results_csv)

# making sure the df is sort by the "count" column
df = df.sort_values(by="count", ascending=False)

# extracting to highlights promoters
df = df[~(df["count"] <= highlight_minimum_value)]

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file_csv)):
    os.makedirs(os.path.dirname(output_file_csv))

df.to_csv(output_file_csv, index=False)