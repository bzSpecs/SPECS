import pandas as pd
import ipdb
import sys
import os

main_file = sys.argv[1]

columns_to_rename = sys.argv[2]
columns_to_rename = columns_to_rename.split(",")

columns_new_names = sys.argv[3]
columns_new_names = columns_new_names.split(",")

output_file = sys.argv[4]


df = pd.read_csv(main_file)

# rename the columns to the wanted names
for i in range(len(columns_new_names)):
    old_name = columns_to_rename[i]
    new_name = columns_new_names[i]

    df = df.rename(columns={old_name: new_name})

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)