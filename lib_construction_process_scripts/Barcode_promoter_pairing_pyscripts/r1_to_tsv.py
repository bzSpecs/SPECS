import gzip
import sys
import os

os.popen('mkdir -p '+sys.argv[2])
# os.makedirs(sys.argv[2], exist_ok=True)
with open(sys.argv[1], 'rt') as fastq:
    with open(sys.argv[2]+"/read_barcode.tsv",'w') as out:
        lines=[]
        for line in fastq:
            lines.append(line)
            # Append lines until there are 4 (corresponding to 1 read)
            # output just the first-two column-wise
            if len(lines)==4:
                out.write(lines[0][1:].split(" ")[0]+"\t"+lines[1].strip()+'\n')
                lines=[]
