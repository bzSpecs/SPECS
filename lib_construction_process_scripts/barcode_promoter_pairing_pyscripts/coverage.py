import pandas as pd
import sys
import os
import ipdb

promoter_results_csv = sys.argv[1]
lib_reference_csv = sys.argv[2]
sample_id = sys.argv[3]

output_file = sys.argv[4]

promoter_df = pd.read_csv(promoter_results_csv)
lib_df = pd.read_csv(lib_reference_csv)

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))
    
with open(output_file, 'a+') as out:
    coverage = len(promoter_df)/len(lib_df)
    output_line = f'{sample_id}: {len(promoter_df)} -> {coverage}\n'
    out.write(output_line)
