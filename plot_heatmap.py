import pandas as pd
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.colors as colors
import ipdb
import sys

cell_lines_promoters_count_result_csv = sys.argv[1]

df = pd.read_csv(cell_lines_promoters_count_result_csv)

df.fillna(0, inplace=True)
df.set_index("promoter", inplace=True)

columns = df.columns.tolist()
columns = [c[len("count_") :] for c in columns]
# indexes = df.index.tolist()

values = df.values
plt.subplots_adjust(left=0.1, bottom=0.15, right=0.99, top=0.95)
plt.imshow(values, cmap="jet", norm=colors.LogNorm(), interpolation="nearest", aspect="auto")
plt.xticks(range(len(columns)), columns, va="top", ha="center")

ax = plt.gca()
ax.axes.yaxis.set_visible(False)

plt.colorbar()
plt.show()

# python3 plot_heatmap.py results_2/normalized_all_cell_lines_tech_results/all_cell_lines_promoters_results.csv 