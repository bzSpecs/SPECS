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
merged["barcode"] = []
merged["count"] = []

for i in range(len(dfs)):
    df = dfs[i]

    merged = (
        merged.set_index("barcode")
        .join(df.set_index("barcode"), rsuffix="_df", how="outer")
        .reset_index()
    )
    merged = merged.fillna(0)
    merged["count"] = merged["count"] + merged["count_df"]
    merged.drop(columns=["count_df"], inplace=True)

merged = merged.sort_values(by="count", ascending=False)

merged.to_csv(output_file, index=False)

# python3 sum_barcodes_counts_results.py results_2/HEK293T/bio_2/unique/tech_1/all/by_barcode/unique_HEK293T_bio_2_tech_1_all.csv,results_2/HEK293T/bio_2/unique/tech_2/all/by_barcode/unique_HEK293T_bio_2_tech_2_all.csv,results_2/HEK293T/bio_2/unique/tech_3/all/by_barcode/unique_HEK293T_bio_2_tech_3_all.csv,results_2/HEK293T/bio_3/unique/tech_1/all/by_barcode/unique_HEK293T_bio_3_tech_1_all.csv,results_2/HEK293T/bio_3/unique/tech_2/all/by_barcode/unique_HEK293T_bio_3_tech_2_all.csv,results_2/HEK293T/bio_3/unique/tech_3/all/by_barcode/unique_HEK293T_bio_3_tech_3_all.csv HEK293T_barcode_sum.csv
# python3 sum_barcodes_counts_results.py results_2/XEN/bio_2/unique/tech_1/all/by_barcode/unique_XEN_bio_2_tech_1_all.csv,results_2/XEN/bio_2/unique/tech_2/all/by_barcode/unique_XEN_bio_2_tech_2_all.csv,results_2/XEN/bio_2/unique/tech_3/all/by_barcode/unique_XEN_bio_2_tech_3_all.csv,results_2/XEN/bio_3/unique/tech_1/all/by_barcode/unique_XEN_bio_3_tech_1_all.csv,results_2/XEN/bio_3/unique/tech_2/all/by_barcode/unique_XEN_bio_3_tech_2_all.csv,results_2/XEN/bio_3/unique/tech_3/all/by_barcode/unique_XEN_bio_3_tech_3_all.csv XEN_barcode_sum.csv
# python3 sum_barcodes_counts_results.py results_2/MEF/bio_2/unique/tech_1/all/by_barcode/unique_MEF_bio_2_tech_1_all.csv,results_2/MEF/bio_2/unique/tech_2/all/by_barcode/unique_MEF_bio_2_tech_2_all.csv,results_2/MEF/bio_2/unique/tech_3/all/by_barcode/unique_MEF_bio_2_tech_3_all.csv,results_2/MEF/bio_3/unique/tech_1/all/by_barcode/unique_MEF_bio_3_tech_1_all.csv,results_2/MEF/bio_3/unique/tech_2/all/by_barcode/unique_MEF_bio_3_tech_2_all.csv,results_2/MEF/bio_3/unique/tech_3/all/by_barcode/unique_MEF_bio_3_tech_3_all.csv MEF_barcode_sum.csv