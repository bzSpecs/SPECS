#!/bin/bash

file=$1
sample_name=$2
sample_results_folder=$3
sample_logs_folder=$4
upstream_adapter=$5
downstream_adapter=$6

clipping_results_folder=$sample_results_folder/02_promoter_clipping
clipping_logs_folder=$sample_logs_folder/02_promoter_clipping

# files:
# clipped_$sample_name - the reads that successfuly was able to clip over the parameters
# unclipped_$sample_name - the reads that failed to clip over the parameters
# pre-clipped: GATATCGCGGCCGCCCTGCAGGCGTTGCTAGGCAACCATCCGTTGCTAGGCAACCGCTCGTTGCTAGGCAACCTGACGTTGCTAGGCAACCCAGCGTTGCTAGGCAACCATGCGTTGCTAGGCAACCCGTCGTTGCTAGGCAACCGGCGC
# post-clipped: CGTTGCTAGGCAACCATCCGTTGCTAGGCAACCGCTCGTTGCTAGGCAACCTGACGTTGCTAGGCAACCCAGCGTTGCTAGGCAACCATGCGTTGCTAGGCAACCCGTCGTTGCTAGGCAACC
# N.B. repeat:  CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC   CGTTGCTAGGCAACC
# + linkers:                   ^^^               ^^^               ^^^...

## clipping
echo " --- Clipping promoter reads --- "
mkdir -p $clipping_results_folder
mkdir -p $clipping_logs_folder

if [ -z "$downstream_adapter" ]
then
    $cutadapt -g $upstream_adapter \
                -O 3 -n 2 \
                -o $clipping_results_folder/clipped_$sample_name.fastq -m 30 \
                --untrimmed-output $clipping_results_folder/unclipped_$sample_name.fastq  \
            --too-short-output $clipping_results_folder/too_short_$sample_name.fastq  \
            --too-long-output  $clipping_results_folder/too_long_$sample_name.fastq  $file \
                1>>$clipping_logs_folder/$sample_name.log 2>&1
else
    $cutadapt -g $upstream_adapter \
                -a $downstream_adapter \
                -O 3 -n 2 \
                -o $clipping_results_folder/clipped_$sample_name.fastq -m 30 \
                --untrimmed-output $clipping_results_folder/unclipped_$sample_name.fastq  \
            --too-short-output $clipping_results_folder/too_short_$sample_name.fastq  \
            --too-long-output  $clipping_results_folder/too_long_$sample_name.fastq  $file \
                1>>$clipping_logs_folder/$sample_name.log 2>&1
fi
#----------------------
# From word doc:
# trim the CGGCCGCCCTGCAGG and additional upstream sequences
# trim the GGCGCGCCAGACGCT and additional downstream sequences
# cutadapt Args:
#         -g CGGCCGCCCTGCAGG \
          # ^ Define the adapter ligated to the 5' end. The adapter and any preceding bases are trimmed
#         -a GGCGCGCCAGACGCT \
          # ^ Define the adapter ligated to the 3' end. The adapter and subsequent bases are trimmed
#         -O 3 -n 2 \
          # ^ minimum overlap between read and adapter for an adapter to be found
#         -o $clipping_results_folder/clipped_$sample_name.fastq -m 30 \
#         --untrimmed-output $clipping_results_folder/unclipped_$sample_name.fastq \
          # ^ output reads that do not contain any adapter here
#         ${read_promoter} \
#         1>>$clipping_logs_folder/$sample_name.log 2>&1
#----------------------