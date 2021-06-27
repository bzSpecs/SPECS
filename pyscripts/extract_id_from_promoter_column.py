import pandas as pd
import sys
import os

df_csv_file = sys.argv[1]
output_path = sys.argv[2]

df = pd.read_csv(df_csv_file)

df["id"] = df["promoter"].str.split(";", expand=True)[0]
# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_path)):
    os.makedirs(os.path.dirname(output_path))

df.to_csv(output_path, index=False)
