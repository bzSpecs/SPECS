import pandas as pd
import sys
import os
import ipdb

mapped_txt_file = sys.argv[1]
output_file = sys.argv[2]

mapped_df = pd.read_csv(mapped_txt_file, sep="\t", header=None, names=["id_",'promoter'], index_col=0)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

mapped_df.to_csv(output_file, index=False)