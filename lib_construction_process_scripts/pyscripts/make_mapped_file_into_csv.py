import pandas as pd
import sys
import os
import ipdb

mapped_txt_file = sys.argv[1]
output_file = sys.argv[2]

promoters_content = []
with open(mapped_txt_file, "r") as f:
    promoters_content = f.readlines()

promoters_content.insert(0, 'promoter\n')

with open(output_file, "w") as f:
    f.writelines(promoters_content)