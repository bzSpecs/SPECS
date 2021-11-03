# The Script: find counts for each promoter.

# Import Librarys
import pandas as pd
import sys
import os

csv_file = sys.argv[1]
sort_by = sys.argv[2]
ascending = sys.argv[3] == "True"

output_file = sys.argv[4]

df = pd.read_csv(csv_file)

# sort the values
df = df.sort_values(by=sort_by, ascending=ascending)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

# Write DataFrame to csv file
df.to_csv(output_file, index=False)

