import sys

samp = sys.argv[1]
fastq = sys.argv[2]

output=dict(
        pre="library_preparation/05_stats/fastqc_pre.txt",
        post="library_preparation/05_stats/fastqc_post.txt"
        )
out={}
x="pre"
out[x] = open(output[x],'a')
with open("library_preparation/01_Fastqc_pre/%s/%s_fastqc/fastqc_data.txt"%(samp, fastq), "r") as f:
    for line in f:
        if "Total Sequences" in line:
            tmp = line.split("Total Sequences")[1]
            out['pre'].write("{}{}".format(samp,tmp))
x="post"
out[x] = open(output[x],'a')
with open("library_preparation/03_Fastqc_post/clipped_{sample}/clipped_{sample}_fastqc/fastqc_data.txt".format(sample=samp), "r") as f:
    for line in f:
         if "Total Sequences" in line:
             tmp = line.split("Total Sequences")[1]
             out['post'].write("{}{}".format(samp,tmp))
    [out[x].close() for x in ['pre','post']]
