import pandas as pd
import ipdb
import sys
import os

main_file = sys.argv[1]

second_file = sys.argv[2]

main_based_which_column = sys.argv[3]

second_based_which_column = sys.argv[4]

columns_to_merge = sys.argv[5]
columns_to_merge = columns_to_merge.split(",")

insert_indexes = sys.argv[6]
insert_indexes = insert_indexes.split(",")
insert_indexes = [int(insert_index) for insert_index in insert_indexes]

columns_to_merge_new_name = sys.argv[7]
columns_to_merge_new_name = columns_to_merge_new_name.split(",")

join_type = sys.argv[8]

output_file = sys.argv[9]


main_df = pd.read_csv(main_file)
second_df = pd.read_csv(second_file)

# take only the wanted columns from the second df
second_df = second_df[[second_based_which_column] + columns_to_merge]

# rename the columns to the wanted names
for i in range(len(columns_to_merge_new_name)):
    old_name = columns_to_merge[i]
    new_name = columns_to_merge_new_name[i]

    second_df = second_df.rename(columns={old_name: new_name})

# join
df = main_df.set_index(main_based_which_column).join(
    second_df.set_index(second_based_which_column), how=join_type).reset_index()

# move new columns to their needed position (via insert_indexes arg)
for i in range(len(columns_to_merge_new_name)):
    insert_index = insert_indexes[i]
    column_name = columns_to_merge_new_name[i]

    column_to_move = df.pop(column_name)

    df.insert(insert_index, column_name, column_to_move)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
