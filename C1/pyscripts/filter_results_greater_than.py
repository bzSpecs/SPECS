import pandas as pd
import sys
import os
import ipdb

results_file = sys.argv[1]
greater_than_value = float(sys.argv[2])
output_file = sys.argv[3]

df = pd.read_csv(results_file)
df = df[df['count'] >= greater_than_value]

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
