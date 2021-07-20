import matplotlib.pyplot as plt
import matplotlib as mpl
import pandas as pd
import sys
import ipdb

results_csv_1 = sys.argv[1]
results_1_label = sys.argv[2]
columns_to_merge_by_results_1 = sys.argv[3]
columns_to_merge_by_results_1 = columns_to_merge_by_results_1.split(",")
scatter_col_1 = sys.argv[4]

results_csv_2 = sys.argv[5]
results_2_label = sys.argv[6]
columns_to_merge_by_results_2 = sys.argv[7]
columns_to_merge_by_results_2 = columns_to_merge_by_results_2.split(",")
scatter_col_2 = sys.argv[8]

title_label = sys.argv[9]
output_file = sys.argv[10]

results_df_1 = pd.read_csv(results_csv_1)
results_df_2 = pd.read_csv(results_csv_2)

merged_df = pd.merge(results_df_1, results_df_2,  how='left',
                     left_on=columns_to_merge_by_results_1, right_on=columns_to_merge_by_results_2)

fig, ax = plt.subplots()
sc = plt.scatter(merged_df[f"{scatter_col_1}_x"], merged_df[f"{scatter_col_2}_y"], s=60)

fig.set_size_inches(800/fig.dpi, 800/fig.dpi, forward=True)

plt.xscale('log')
plt.yscale('log')


all_values_from_the_two_columns = merged_df[f"{scatter_col_1}_x"].append(
    merged_df[f"{scatter_col_1}_y"]).reset_index(drop=True)
max_value = all_values_from_the_two_columns.max()

plt.xlim(1, max_value + 1000)
plt.ylim(1, max_value + 1000)

plt.xlabel(results_1_label, fontfamily='Arial', fontsize=36, fontweight="bold")
plt.ylabel(results_2_label, fontfamily='Arial', fontsize=36, fontweight="bold")
plt.xticks(fontsize=36)
plt.yticks(fontsize=36)
plt.title(title_label, fontfamily='Arial', fontsize=42, fontweight="bold")

annot = ax.annotate("", xy=(0, 0), xytext=(
    0, 10), textcoords="offset points", bbox=dict(boxstyle="round", fc="w"), ha='center')
annot.set_visible(False)


# def update_annot(ind):
#     index = ind["ind"][0]
#     pos = sc.get_offsets()[ind["ind"][0]]
#     annot.xy = pos
#     if by_unique_17:
#         text = "prmtr: {}".format(
#             merged_df.iloc[index]["unique_17"])
#     else:
#         text = "bc: {}, prmtr: {}".format(
#             merged_df.iloc[index]["barcode"], merged_df.iloc[index]["unique_17_x"])
#     annot.set_text(text)


def hover(event):
    vis = annot.get_visible()
    if event.inaxes == ax:
        cont, ind = sc.contains(event)
        if cont:
            # update_annot(ind)
            annot.set_visible(True)
            fig.canvas.draw_idle()
        else:
            if vis:
                annot.set_visible(False)
                fig.canvas.draw_idle()


fig.canvas.mpl_connect("motion_notify_event", hover)
plt.tight_layout()
plt.savefig(output_file)
plt.show()
