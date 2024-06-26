import pandas as pd
import ipdb
import sys
import os
from sklearn.preprocessing import MinMaxScaler

results_file = sys.argv[1]
factor = int(sys.argv[2])
column_names = sys.argv[3]
column_names = column_names.split(",")
# range_min = int(sys.argv[4])
# range_max = int(sys.argv[5])
multiplier = int(sys.argv[4])


output_file = sys.argv[5]

# scaler = MinMaxScaler(feature_range=(range_min, range_max))

results_df = pd.read_csv(results_file)

for i in range(len(column_names)):
    column_name = column_names[i]
    results_df[column_name] = (results_df[column_name] / factor) * multiplier
    # results_df[[column_name]] = scaler.fit_transform(results_df[[column_name]])


# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

results_df.to_csv(output_file, index=False)
