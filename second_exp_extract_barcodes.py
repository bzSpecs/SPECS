import os
import sys

table = str.maketrans("ACTG", "TGAC")

clipped_results_fastq_path = sys.argv[1]
output_barcode_csv_path = sys.argv[2]

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_barcode_csv_path)):
    os.makedirs(os.path.dirname(output_barcode_csv_path))

with open(output_barcode_csv_path,'w') as out:
    out.write('barcode\n')

with open(clipped_results_fastq_path, 'rt') as fastq:
    with open(output_barcode_csv_path,'a+') as out:
        lines=[]
        for line in fastq:
            lines.append(line)
            if len(lines)==4:
                barcode = lines[1].strip()[:20]
                barcode = barcode.translate(table)[::-1]
                out.write(barcode+'\n')
                lines=[]
