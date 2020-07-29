import matplotlib.pyplot as plt
import pandas as pd
import sys
import ipdb

barcodes_csv_1 = sys.argv[1]
x_label = sys.argv[2]
barcodes_csv_2 = sys.argv[3]
y_label = sys.argv[4]
by_which_parameter = sys.argv[5]

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
sc = plt.scatter(merged_df["count_x"], merged_df["count_y"])

plt.xscale('log')
plt.yscale('log')

plt.xlabel(x_label)
plt.ylabel(y_label)

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

plt.show()

ipdb.set_trace()
