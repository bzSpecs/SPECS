# %%
import sys
import pandas as pd

mapped_file = sys.argv[1]
barcode_path = sys.argv[2]
out_file = sys.argv[3]

#%%
df_r1 = pd.read_csv(mapped_file, sep="\t", header=None, names=["id_",'unique_17'], index_col=0)
df_r2 = pd.read_csv(barcode_path, sep="\t", header=None, names=["id_",'barcode'], index_col=0)

#%%
df_out = pd.merge(df_r1, df_r2,how="outer", left_index=True, right_index=True)

# %%
print("No barcode: {}, No unique_17: {}".format(df_out['barcode'].isna().sum(),
                                               df_out['unique_17'].isna().sum()))

#%%
df_out.to_csv(out_file)
