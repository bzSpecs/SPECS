import pandas as pd
import ipdb
import sys
import os

main_file = sys.argv[1]

columns_to_move = sys.argv[2]
columns_to_move = columns_to_move.split(",")

insert_indexes = sys.argv[3]
insert_indexes = insert_indexes.split(",")
insert_indexes = [int(insert_index) for insert_index in insert_indexes]

output_file = sys.argv[4]


df = pd.read_csv(main_file)

# move new columns to their needed position (via insert_indexes arg)
for i in range(len(columns_to_move)):
    insert_index = insert_indexes[i]
    column_name = columns_to_move[i]

    column_to_move = df.pop(column_name)

    df.insert(insert_index, column_name, column_to_move)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
