import matplotlib.pyplot as plt
import matplotlib as mpl
import pandas as pd
import sys
import ipdb

barcodes_csv_1 = sys.argv[1]
x_label = sys.argv[2]
barcodes_csv_2 = sys.argv[3]
y_label = sys.argv[4]
title_label = sys.argv[5]
by_which_parameter = sys.argv[6]

by_promoter = by_which_parameter == "promoter"

barcodes_df_1 = pd.read_csv(barcodes_csv_1)
barcodes_df_2 = pd.read_csv(barcodes_csv_2)

if by_promoter:
    merged_df = barcodes_df_1.merge(
        barcodes_df_2, on="promoter", how="inner")
else:
    merged_df = barcodes_df_1.merge(
        barcodes_df_2, on="barcode", how="inner")


fig, ax = plt.subplots()
sc = plt.scatter(merged_df["count_x"], merged_df["count_y"], s=60)

fig.set_size_inches(800/fig.dpi, 800/fig.dpi,forward=True)

plt.xscale('log')
plt.yscale('log')


all_values_from_the_two_columns = merged_df['count_x'].append(merged_df['count_y']).reset_index(drop=True)
max_value = all_values_from_the_two_columns.max()

plt.xlim(1,max_value + 1000)
plt.ylim(1,max_value + 1000)

plt.xlabel(x_label, fontfamily='Arial', fontsize=36, fontweight="bold")
plt.ylabel(y_label, fontfamily='Arial', fontsize=36, fontweight="bold")
plt.xticks(fontsize=36)
plt.yticks(fontsize=36)
plt.title(title_label, fontfamily='Arial', fontsize=42, fontweight="bold")

annot = ax.annotate("", xy=(0, 0), xytext=(
    0, 10), textcoords="offset points", bbox=dict(boxstyle="round", fc="w"), ha='center')
annot.set_visible(False)


def update_annot(ind):
    index = ind["ind"][0]
    pos = sc.get_offsets()[ind["ind"][0]]
    annot.xy = pos
    if by_promoter:
        text = "prmtr: {}".format(
            merged_df.iloc[index]["promoter"])
    else:
        text = "bc: {}, prmtr: {}".format(
            merged_df.iloc[index]["barcode"], merged_df.iloc[index]["promoter_x"])
    annot.set_text(text)


def hover(event):
    vis = annot.get_visible()
    if event.inaxes == ax:
        cont, ind = sc.contains(event)
        if cont:
            update_annot(ind)
            annot.set_visible(True)
            fig.canvas.draw_idle()
        else:
            if vis:
                annot.set_visible(False)
                fig.canvas.draw_idle()


fig.canvas.mpl_connect("motion_notify_event", hover)
plt.tight_layout()
plt.savefig('sampleFileName.png')
plt.show()