import numpy as np
import pandas as pd
import sys
from sklearn.metrics import r2_score

df_1_csv_file = sys.argv[1]
df_1_index_column = sys.argv[2]
df_1_column_name = sys.argv[3]
df_2_csv_file = sys.argv[4]
df_2_index_column = sys.argv[5]
df_2_column_name = sys.argv[6]
output_file = sys.argv[7]

df_1 = pd.read_csv(df_1_csv_file)
df_2 = pd.read_csv(df_2_csv_file)

joined_df = df_1.set_index(df_1_index_column).add_suffix('_1').join(df_2.set_index(df_2_index_column).add_suffix('_2'), how="outer").reset_index()
joined_df.fillna(0, inplace=True)

# r_squared = r2_score(joined_df[f"{df_1_column_name}_1"], joined_df[f"{df_2_column_name}_2"])

df_1_count_col = joined_df[f"{df_1_column_name}_1"].to_numpy() 
df_2_count_col = joined_df[f"{df_2_column_name}_2"].to_numpy()

correlation_matrix = np.corrcoef(df_1_count_col, df_2_count_col)
correlation_xy = correlation_matrix[0,1]
r_squared = correlation_xy**2

with open(output_file, "w") as file1:
    file1.write(str(r_squared))