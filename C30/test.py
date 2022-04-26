import sys

with open(sys.argv[1], 'rt') as fastq:
    with open(sys.argv[2],'w') as out:
        lines=[]
        for line in fastq:
            lines.append(line)
            # Append lines until there are 4 (corresponding to 1 read)
            # output just the first-two column-wise
            if len(lines)==4:
                out.write(lines[0][1:].split(" ")[0]+"\t"+lines[1][:16].strip()+'\n')
                lines=[]
