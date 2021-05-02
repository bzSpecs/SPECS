import pandas as pd
import sys
import os
import ipdb

results_file = sys.argv[1]

first_column = sys.argv[2]

second_column = sys.argv[3]

new_column_name = sys.argv[4]
new_column_index = int(sys.argv[5])

output_file = sys.argv[6]

df = pd.read_csv(results_file)

new_column = df[first_column] / df[second_column]

df.insert(new_column_index, new_column_name, new_column)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)