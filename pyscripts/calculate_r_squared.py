import numpy as np
import scipy
import pandas as pd
import sys

df_1_csv_file = sys.argv[1]
df_2_csv_file = sys.argv[2]

df_1 = pd.read_csv(df_1_csv_file)
df_2 = pd.read_csv(df_2_csv_file)

joined_df = df_1.set_index("promoter").join(df_2.set_index('promoter'), lsuffix="_1", rsuffix="_2", how="outer").reset_index()
joined_df.fillna(0, inplace=True)

df_1_count_col = joined_df["count_1"].to_numpy() 
df_2_count_col = joined_df["count_2"].to_numpy() 

r_squared, p_val = scipy.stats.pearsonr(df_1_count_col, df_2_count_col)

print(r_squared, p_val)