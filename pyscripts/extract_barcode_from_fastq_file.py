import os
import sys

barcode_fastq_file = sys.argv[1]
output_barcode_csv_path = sys.argv[2]

# create the folder if not exists yet
if not os.path.exists(os.path.dirname(output_barcode_csv_path)):
    os.makedirs(os.path.dirname(output_barcode_csv_path))

with open(output_barcode_csv_path, 'w') as out:
    out.write('barcode\n')

with open(barcode_fastq_file, 'rt') as fastq:
    with open(output_barcode_csv_path, 'a+') as out:
        lines = []
        for line in fastq:
            lines.append(line)
            if len(lines) == 4:
                barcode = lines[1]
                out.write(barcode)
                lines = []
