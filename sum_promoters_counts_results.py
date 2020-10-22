import pandas as pd
import sys
import ipdb

files = sys.argv[1]
files = files.split(",")

output_file = sys.argv[2]

dfs = []
for f in files:
    dfs.append(pd.read_csv(f))

merged = pd.DataFrame()
merged["promoter"] = []
merged["count"] = []

for i in range(len(dfs)):
    df = dfs[i]

    merged = (
        merged.set_index("promoter")
        .join(df.set_index("promoter"), rsuffix="_df", how="outer")
        .reset_index()
    )
    merged = merged.fillna(0)
    merged["count"] = merged["count"] + merged["count_df"]
    merged.drop(columns=["count_df"], inplace=True)

merged = merged.sort_values(by="count", ascending=False)

merged.to_csv(output_file, index=False)

# python3 sum_promoters_counts_results.py results/HEK293T/bio_2/unique/tech_1/all/by_promoter/unique_HEK293T_bio_2_tech_1_all.csv,results/HEK293T/bio_2/unique/tech_2/all/by_promoter/unique_HEK293T_bio_2_tech_2_all.csv,results/HEK293T/bio_2/unique/tech_3/all/by_promoter/unique_HEK293T_bio_2_tech_3_all.csv,results/HEK293T/bio_3/unique/tech_1/all/by_promoter/unique_HEK293T_bio_3_tech_1_all.csv,results/HEK293T/bio_3/unique/tech_2/all/by_promoter/unique_HEK293T_bio_3_tech_2_all.csv,results/HEK293T/bio_3/unique/tech_3/all/by_promoter/unique_HEK293T_bio_3_tech_3_all.csv HEK293T_out.csv