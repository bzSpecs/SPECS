import pandas as pd
import ipdb
import sys
import os

main_file = sys.argv[1]

second_file = sys.argv[2]

main_based_which_column = sys.argv[3]

second_based_which_column = sys.argv[4]

columns_to_merge = sys.argv[5] if sys.argv[5] != '' else None
if columns_to_merge:
    columns_to_merge = columns_to_merge.split(",")

insert_indexes = sys.argv[6] if sys.argv[6] != '' else None
if insert_indexes:
    insert_indexes = insert_indexes.split(",")
    insert_indexes = [int(insert_index) for insert_index in insert_indexes]

columns_to_merge_new_name = sys.argv[7] if sys.argv[7] != '' else None
if columns_to_merge_new_name:
    columns_to_merge_new_name = columns_to_merge_new_name.split(",")

join_type = sys.argv[8] if sys.argv[8] != '' else 'left'

lsuffix = sys.argv[9] if sys.argv[9] != '' else None
rsuffix = sys.argv[10] if sys.argv[10] != '' else None

sort_by = sys.argv[11]
ascending = sys.argv[12] == "True"

output_file = sys.argv[13]


main_df = pd.read_csv(main_file)
second_df = pd.read_csv(second_file)

# take only the wanted columns from the second df
if columns_to_merge:
    second_df = second_df[[second_based_which_column] + columns_to_merge]

# rename the columns to the wanted names
if columns_to_merge and columns_to_merge_new_name:
    for i in range(len(columns_to_merge_new_name)):
        old_name = columns_to_merge[i]
        new_name = columns_to_merge_new_name[i]

        second_df = second_df.rename(columns={old_name: new_name})

# join
df = (
    main_df.set_index(main_based_which_column)
    .join(second_df.set_index(second_based_which_column), how=join_type, lsuffix=lsuffix, rsuffix=rsuffix)
)
df = df.reset_index().rename(columns={"index":main_based_which_column})

if sort_by != "":
    df = df.sort_values(by=[sort_by], ascending=[ascending])

# move new columns to their needed position (via insert_indexes arg)
if insert_indexes:
    for i in range(len(columns_to_merge_new_name)):
        insert_index = insert_indexes[i]
        column_name = columns_to_merge_new_name[i]

        column_to_move = df.pop(column_name)

        df.insert(insert_index, column_name, column_to_move)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

df.to_csv(output_file, index=False)
