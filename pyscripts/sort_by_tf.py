import ipdb
import pandas as pd
import sys
import os

df_csv_file = sys.argv[1]
kmer_mapping_csv_path = sys.argv[2]
output_path = sys.argv[3]

kmer_df = pd.read_csv(kmer_mapping_csv_path)

df = pd.read_csv(df_csv_file)

# merge the library d7 info
df["id"] = df["promoter"].str.split(";", expand=True)[0]
df = df.set_index("id").join(kmer_df.set_index("id")).reset_index()

########### until here this is exactly what we do in "merge_d7_data.py" ###########

df = df.sort_values(by="TFs")
df = pd.DataFrame({"promoter": df["promoter"], "count_ESC": df["count_ESC"], "count_XEN": df["count_XEN"],"count_MEF": df["count_MEF"], "count_HEK293T": df["count_HEK293T"]})

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_path)):
    os.makedirs(os.path.dirname(output_path))

df.to_csv(output_path, index=False)
