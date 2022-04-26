import pandas as pd
import ipdb
import sys
import os

main_file = sys.argv[1]

column_names = sys.argv[2]
column_names = column_names.split(",")

column_values = sys.argv[3]
column_values = column_values.split(",")

output_file = sys.argv[4]


df = pd.read_csv(main_file)

# rename the columns to the wanted names
for i in range(len(column_names)):
    column_name = column_names[i]
    column_value = column_values[i]

    df = df[df[column_name]==column_value]

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)