#!/bin/bash

########################################################################### HEK293T ##########################################################################################

./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/HEK293T/clipped_HEK293T_bio_1_tech_1.fastq results HEK293T 1 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/HEK293T/clipped_HEK293T_bio_1_tech_2.fastq results HEK293T 1 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/HEK293T/clipped_HEK293T_bio_1_tech_3.fastq results HEK293T 1 3 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/HEK293T/clipped_HEK293T_bio_2_tech_1.fastq results HEK293T 2 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/HEK293T/clipped_HEK293T_bio_2_tech_2.fastq results HEK293T 2 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/HEK293T/clipped_HEK293T_bio_2_tech_3.fastq results HEK293T 2 3 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/HEK293T/clipped_HEK293T_bio_3_tech_1.fastq results HEK293T 3 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/HEK293T/clipped_HEK293T_bio_3_tech_2.fastq results HEK293T 3 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/HEK293T/clipped_HEK293T_bio_3_tech_3.fastq results HEK293T 3 3 100 3

# normalize
python3 normalize_sum_by_reads.py results/HEK293T/bio_1/unique/tech_1/all/by_promoter/unique_HEK293T_bio_1_tech_1_all.csv results/HEK293T/bio_1/unique/tech_1/HEK293T_bio_1_tech_1_rna_seq_barcodes.csv results/HEK293T/bio_1/unique/tech_1/all/by_promoter/normalized_unique_HEK293T_bio_1_tech_1_all.csv
python3 normalize_sum_by_reads.py results/HEK293T/bio_1/unique/tech_2/all/by_promoter/unique_HEK293T_bio_1_tech_2_all.csv results/HEK293T/bio_1/unique/tech_2/HEK293T_bio_1_tech_2_rna_seq_barcodes.csv results/HEK293T/bio_1/unique/tech_2/all/by_promoter/normalized_unique_HEK293T_bio_1_tech_2_all.csv
python3 normalize_sum_by_reads.py results/HEK293T/bio_1/unique/tech_3/all/by_promoter/unique_HEK293T_bio_1_tech_3_all.csv results/HEK293T/bio_1/unique/tech_3/HEK293T_bio_1_tech_3_rna_seq_barcodes.csv results/HEK293T/bio_1/unique/tech_3/all/by_promoter/normalized_unique_HEK293T_bio_1_tech_3_all.csv
python3 normalize_sum_by_reads.py results/HEK293T/bio_2/unique/tech_1/all/by_promoter/unique_HEK293T_bio_2_tech_1_all.csv results/HEK293T/bio_2/unique/tech_1/HEK293T_bio_2_tech_1_rna_seq_barcodes.csv results/HEK293T/bio_2/unique/tech_1/all/by_promoter/normalized_unique_HEK293T_bio_2_tech_1_all.csv
python3 normalize_sum_by_reads.py results/HEK293T/bio_2/unique/tech_2/all/by_promoter/unique_HEK293T_bio_2_tech_2_all.csv results/HEK293T/bio_2/unique/tech_2/HEK293T_bio_2_tech_2_rna_seq_barcodes.csv results/HEK293T/bio_2/unique/tech_2/all/by_promoter/normalized_unique_HEK293T_bio_2_tech_2_all.csv
python3 normalize_sum_by_reads.py results/HEK293T/bio_2/unique/tech_3/all/by_promoter/unique_HEK293T_bio_2_tech_3_all.csv results/HEK293T/bio_2/unique/tech_3/HEK293T_bio_2_tech_3_rna_seq_barcodes.csv results/HEK293T/bio_2/unique/tech_3/all/by_promoter/normalized_unique_HEK293T_bio_2_tech_3_all.csv
python3 normalize_sum_by_reads.py results/HEK293T/bio_3/unique/tech_1/all/by_promoter/unique_HEK293T_bio_3_tech_1_all.csv results/HEK293T/bio_3/unique/tech_1/HEK293T_bio_3_tech_1_rna_seq_barcodes.csv results/HEK293T/bio_3/unique/tech_1/all/by_promoter/normalized_unique_HEK293T_bio_3_tech_1_all.csv
python3 normalize_sum_by_reads.py results/HEK293T/bio_3/unique/tech_2/all/by_promoter/unique_HEK293T_bio_3_tech_2_all.csv results/HEK293T/bio_3/unique/tech_2/HEK293T_bio_3_tech_2_rna_seq_barcodes.csv results/HEK293T/bio_3/unique/tech_2/all/by_promoter/normalized_unique_HEK293T_bio_3_tech_2_all.csv
python3 normalize_sum_by_reads.py results/HEK293T/bio_3/unique/tech_3/all/by_promoter/unique_HEK293T_bio_3_tech_3_all.csv results/HEK293T/bio_3/unique/tech_3/HEK293T_bio_3_tech_3_rna_seq_barcodes.csv results/HEK293T/bio_3/unique/tech_3/all/by_promoter/normalized_unique_HEK293T_bio_3_tech_3_all.csv

# python3 sum_promoters_counts_results.py results/HEK293T/analys_bio_2_and_bio_3_all_tech/HEK293T_bio_2_tech_1_normalized.csv,results/HEK293T/analys_bio_2_and_bio_3_all_tech/HEK293T_bio_2_tech_2_normalized.csv,results/HEK293T/analys_bio_2_and_bio_3_all_tech/HEK293T_bio_2_tech_3_normalized.csv,results/HEK293T/analys_bio_2_and_bio_3_all_tech/HEK293T_bio_3_tech_1_normalized.csv,results/HEK293T/analys_bio_2_and_bio_3_all_tech/HEK293T_bio_3_tech_2_normalized.csv,results/HEK293T/analys_bio_2_and_bio_3_all_tech/HEK293T_bio_3_tech_3_normalized.csv ./results/HEK293T/analys_bio_2_and_bio_3_all_tech/HEK293T_sum.csv


########################################################################### MEF ##########################################################################################

./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/MEF/clipped_MEF_bio_1_tech_1.fastq results MEF 1 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/MEF/clipped_MEF_bio_1_tech_2.fastq results MEF 1 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/MEF/clipped_MEF_bio_1_tech_3.fastq results MEF 1 3 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/MEF/clipped_MEF_bio_2_tech_1.fastq results MEF 2 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/MEF/clipped_MEF_bio_2_tech_2.fastq results MEF 2 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/MEF/clipped_MEF_bio_2_tech_3.fastq results MEF 2 3 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/MEF/clipped_MEF_bio_3_tech_1.fastq results MEF 3 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/MEF/clipped_MEF_bio_3_tech_2.fastq results MEF 3 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/MEF/clipped_MEF_bio_3_tech_3.fastq results MEF 3 3 100 3

# normalize
python3 normalize_sum_by_reads.py results/MEF/bio_1/unique/tech_1/all/by_promoter/unique_MEF_bio_1_tech_1_all.csv results/MEF/bio_1/unique/tech_1/MEF_bio_1_tech_1_rna_seq_barcodes.csv results/MEF/bio_1/unique/tech_1/all/by_promoter/normalized_unique_MEF_bio_1_tech_1_all.csv
python3 normalize_sum_by_reads.py results/MEF/bio_1/unique/tech_2/all/by_promoter/unique_MEF_bio_1_tech_2_all.csv results/MEF/bio_1/unique/tech_2/MEF_bio_1_tech_2_rna_seq_barcodes.csv results/MEF/bio_1/unique/tech_2/all/by_promoter/normalized_unique_MEF_bio_1_tech_2_all.csv
python3 normalize_sum_by_reads.py results/MEF/bio_1/unique/tech_3/all/by_promoter/unique_MEF_bio_1_tech_3_all.csv results/MEF/bio_1/unique/tech_3/MEF_bio_1_tech_3_rna_seq_barcodes.csv results/MEF/bio_1/unique/tech_3/all/by_promoter/normalized_unique_MEF_bio_1_tech_3_all.csv
python3 normalize_sum_by_reads.py results/MEF/bio_2/unique/tech_1/all/by_promoter/unique_MEF_bio_2_tech_1_all.csv results/MEF/bio_2/unique/tech_1/MEF_bio_2_tech_1_rna_seq_barcodes.csv results/MEF/bio_2/unique/tech_1/all/by_promoter/normalized_unique_MEF_bio_2_tech_1_all.csv
python3 normalize_sum_by_reads.py results/MEF/bio_2/unique/tech_2/all/by_promoter/unique_MEF_bio_2_tech_2_all.csv results/MEF/bio_2/unique/tech_2/MEF_bio_2_tech_2_rna_seq_barcodes.csv results/MEF/bio_2/unique/tech_2/all/by_promoter/normalized_unique_MEF_bio_2_tech_2_all.csv
python3 normalize_sum_by_reads.py results/MEF/bio_2/unique/tech_3/all/by_promoter/unique_MEF_bio_2_tech_3_all.csv results/MEF/bio_2/unique/tech_3/MEF_bio_2_tech_3_rna_seq_barcodes.csv results/MEF/bio_2/unique/tech_3/all/by_promoter/normalized_unique_MEF_bio_2_tech_3_all.csv
python3 normalize_sum_by_reads.py results/MEF/bio_3/unique/tech_1/all/by_promoter/unique_MEF_bio_3_tech_1_all.csv results/MEF/bio_3/unique/tech_1/MEF_bio_3_tech_1_rna_seq_barcodes.csv results/MEF/bio_3/unique/tech_1/all/by_promoter/normalized_unique_MEF_bio_3_tech_1_all.csv
python3 normalize_sum_by_reads.py results/MEF/bio_3/unique/tech_2/all/by_promoter/unique_MEF_bio_3_tech_2_all.csv results/MEF/bio_3/unique/tech_2/MEF_bio_3_tech_2_rna_seq_barcodes.csv results/MEF/bio_3/unique/tech_2/all/by_promoter/normalized_unique_MEF_bio_3_tech_2_all.csv
python3 normalize_sum_by_reads.py results/MEF/bio_3/unique/tech_3/all/by_promoter/unique_MEF_bio_3_tech_3_all.csv results/MEF/bio_3/unique/tech_3/MEF_bio_3_tech_3_rna_seq_barcodes.csv results/MEF/bio_3/unique/tech_3/all/by_promoter/normalized_unique_MEF_bio_3_tech_3_all.csv

# python3 sum_promoters_counts_results.py results/MEF/analys_bio_2_and_bio_3_all_tech/MEF_bio_2_tech_1_normalized.csv,results/MEF/analys_bio_2_and_bio_3_all_tech/MEF_bio_2_tech_2_normalized.csv,results/MEF/analys_bio_2_and_bio_3_all_tech/MEF_bio_2_tech_3_normalized.csv,results/MEF/analys_bio_2_and_bio_3_all_tech/MEF_bio_3_tech_1_normalized.csv,results/MEF/analys_bio_2_and_bio_3_all_tech/MEF_bio_3_tech_2_normalized.csv,results/MEF/analys_bio_2_and_bio_3_all_tech/MEF_bio_3_tech_3_normalized.csv ./results/MEF/analys_bio_2_and_bio_3_all_tech/MEF_sum.csv

########################################################################### ESC ##########################################################################################

./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/ESC/clipped_ESC_bio_1_tech_1.fastq results ESC 1 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/ESC/clipped_ESC_bio_1_tech_2.fastq results ESC 1 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/ESC/clipped_ESC_bio_1_tech_3.fastq results ESC 1 3 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/ESC/clipped_ESC_bio_2_tech_1.fastq results ESC 2 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/ESC/clipped_ESC_bio_2_tech_2.fastq results ESC 2 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/ESC/clipped_ESC_bio_2_tech_3.fastq results ESC 2 3 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/ESC/clipped_ESC_bio_3_tech_1.fastq results ESC 3 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/ESC/clipped_ESC_bio_3_tech_2.fastq results ESC 3 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/ESC/clipped_ESC_bio_3_tech_3.fastq results ESC 3 3 100 3

# normalize
python3 normalize_sum_by_reads.py results/ESC/bio_1/unique/tech_1/all/by_promoter/unique_ESC_bio_1_tech_1_all.csv results/ESC/bio_1/unique/tech_1/ESC_bio_1_tech_1_rna_seq_barcodes.csv results/ESC/bio_1/unique/tech_1/all/by_promoter/normalized_unique_ESC_bio_1_tech_1_all.csv
python3 normalize_sum_by_reads.py results/ESC/bio_1/unique/tech_2/all/by_promoter/unique_ESC_bio_1_tech_2_all.csv results/ESC/bio_1/unique/tech_2/ESC_bio_1_tech_2_rna_seq_barcodes.csv results/ESC/bio_1/unique/tech_2/all/by_promoter/normalized_unique_ESC_bio_1_tech_2_all.csv
python3 normalize_sum_by_reads.py results/ESC/bio_1/unique/tech_3/all/by_promoter/unique_ESC_bio_1_tech_3_all.csv results/ESC/bio_1/unique/tech_3/ESC_bio_1_tech_3_rna_seq_barcodes.csv results/ESC/bio_1/unique/tech_3/all/by_promoter/normalized_unique_ESC_bio_1_tech_3_all.csv
python3 normalize_sum_by_reads.py results/ESC/bio_2/unique/tech_1/all/by_promoter/unique_ESC_bio_2_tech_1_all.csv results/ESC/bio_2/unique/tech_1/ESC_bio_2_tech_1_rna_seq_barcodes.csv results/ESC/bio_2/unique/tech_1/all/by_promoter/normalized_unique_ESC_bio_2_tech_1_all.csv
python3 normalize_sum_by_reads.py results/ESC/bio_2/unique/tech_2/all/by_promoter/unique_ESC_bio_2_tech_2_all.csv results/ESC/bio_2/unique/tech_2/ESC_bio_2_tech_2_rna_seq_barcodes.csv results/ESC/bio_2/unique/tech_2/all/by_promoter/normalized_unique_ESC_bio_2_tech_2_all.csv
python3 normalize_sum_by_reads.py results/ESC/bio_2/unique/tech_3/all/by_promoter/unique_ESC_bio_2_tech_3_all.csv results/ESC/bio_2/unique/tech_3/ESC_bio_2_tech_3_rna_seq_barcodes.csv results/ESC/bio_2/unique/tech_3/all/by_promoter/normalized_unique_ESC_bio_2_tech_3_all.csv
python3 normalize_sum_by_reads.py results/ESC/bio_3/unique/tech_1/all/by_promoter/unique_ESC_bio_3_tech_1_all.csv results/ESC/bio_3/unique/tech_1/ESC_bio_3_tech_1_rna_seq_barcodes.csv results/ESC/bio_3/unique/tech_1/all/by_promoter/normalized_unique_ESC_bio_3_tech_1_all.csv
python3 normalize_sum_by_reads.py results/ESC/bio_3/unique/tech_2/all/by_promoter/unique_ESC_bio_3_tech_2_all.csv results/ESC/bio_3/unique/tech_2/ESC_bio_3_tech_2_rna_seq_barcodes.csv results/ESC/bio_3/unique/tech_2/all/by_promoter/normalized_unique_ESC_bio_3_tech_2_all.csv
python3 normalize_sum_by_reads.py results/ESC/bio_3/unique/tech_3/all/by_promoter/unique_ESC_bio_3_tech_3_all.csv results/ESC/bio_3/unique/tech_3/ESC_bio_3_tech_3_rna_seq_barcodes.csv results/ESC/bio_3/unique/tech_3/all/by_promoter/normalized_unique_ESC_bio_3_tech_3_all.csv

# python3 sum_promoters_counts_results.py results/ESC/analys_bio_2_and_bio_3_all_tech/ESC_bio_2_tech_1_normalized.csv,results/ESC/analys_bio_2_and_bio_3_all_tech/ESC_bio_2_tech_2_normalized.csv,results/ESC/analys_bio_2_and_bio_3_all_tech/ESC_bio_2_tech_3_normalized.csv,results/ESC/analys_bio_2_and_bio_3_all_tech/ESC_bio_3_tech_1_normalized.csv,results/ESC/analys_bio_2_and_bio_3_all_tech/ESC_bio_3_tech_2_normalized.csv,results/ESC/analys_bio_2_and_bio_3_all_tech/ESC_bio_3_tech_3_normalized.csv ./results/ESC/analys_bio_2_and_bio_3_all_tech/ESC_sum.csv

########################################################################### XEN ##########################################################################################

./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/XEN/clipped_XEN_bio_1_tech_1.fastq results XEN 1 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/XEN/clipped_XEN_bio_1_tech_2.fastq results XEN 1 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/XEN/clipped_XEN_bio_1_tech_3.fastq results XEN 1 3 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/XEN/clipped_XEN_bio_2_tech_1.fastq results XEN 2 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/XEN/clipped_XEN_bio_2_tech_2.fastq results XEN 2 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/XEN/clipped_XEN_bio_2_tech_3.fastq results XEN 2 3 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/XEN/clipped_XEN_bio_3_tech_1.fastq results XEN 3 1 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/XEN/clipped_XEN_bio_3_tech_2.fastq results XEN 3 2 100 3
./analys_replica.sh lib_construction_process_scripts/library_preparation/06_barcodes/asdasd_PAIRED.csv RNA_seq_process_scripts/RNA_seq_results/XEN/clipped_XEN_bio_3_tech_3.fastq results XEN 3 3 100 3

# normalize
python3 normalize_sum_by_reads.py results/XEN/bio_1/unique/tech_1/all/by_promoter/unique_XEN_bio_1_tech_1_all.csv results/XEN/bio_1/unique/tech_1/XEN_bio_1_tech_1_rna_seq_barcodes.csv results/XEN/bio_1/unique/tech_1/all/by_promoter/normalized_unique_XEN_bio_1_tech_1_all.csv
python3 normalize_sum_by_reads.py results/XEN/bio_1/unique/tech_2/all/by_promoter/unique_XEN_bio_1_tech_2_all.csv results/XEN/bio_1/unique/tech_2/XEN_bio_1_tech_2_rna_seq_barcodes.csv results/XEN/bio_1/unique/tech_2/all/by_promoter/normalized_unique_XEN_bio_1_tech_2_all.csv
python3 normalize_sum_by_reads.py results/XEN/bio_1/unique/tech_3/all/by_promoter/unique_XEN_bio_1_tech_3_all.csv results/XEN/bio_1/unique/tech_3/XEN_bio_1_tech_3_rna_seq_barcodes.csv results/XEN/bio_1/unique/tech_3/all/by_promoter/normalized_unique_XEN_bio_1_tech_3_all.csv
python3 normalize_sum_by_reads.py results/XEN/bio_2/unique/tech_1/all/by_promoter/unique_XEN_bio_2_tech_1_all.csv results/XEN/bio_2/unique/tech_1/XEN_bio_2_tech_1_rna_seq_barcodes.csv results/XEN/bio_2/unique/tech_1/all/by_promoter/normalized_unique_XEN_bio_2_tech_1_all.csv
python3 normalize_sum_by_reads.py results/XEN/bio_2/unique/tech_2/all/by_promoter/unique_XEN_bio_2_tech_2_all.csv results/XEN/bio_2/unique/tech_2/XEN_bio_2_tech_2_rna_seq_barcodes.csv results/XEN/bio_2/unique/tech_2/all/by_promoter/normalized_unique_XEN_bio_2_tech_2_all.csv
python3 normalize_sum_by_reads.py results/XEN/bio_2/unique/tech_3/all/by_promoter/unique_XEN_bio_2_tech_3_all.csv results/XEN/bio_2/unique/tech_3/XEN_bio_2_tech_3_rna_seq_barcodes.csv results/XEN/bio_2/unique/tech_3/all/by_promoter/normalized_unique_XEN_bio_2_tech_3_all.csv
python3 normalize_sum_by_reads.py results/XEN/bio_3/unique/tech_1/all/by_promoter/unique_XEN_bio_3_tech_1_all.csv results/XEN/bio_3/unique/tech_1/XEN_bio_3_tech_1_rna_seq_barcodes.csv results/XEN/bio_3/unique/tech_1/all/by_promoter/normalized_unique_XEN_bio_3_tech_1_all.csv
python3 normalize_sum_by_reads.py results/XEN/bio_3/unique/tech_2/all/by_promoter/unique_XEN_bio_3_tech_2_all.csv results/XEN/bio_3/unique/tech_2/XEN_bio_3_tech_2_rna_seq_barcodes.csv results/XEN/bio_3/unique/tech_2/all/by_promoter/normalized_unique_XEN_bio_3_tech_2_all.csv
python3 normalize_sum_by_reads.py results/XEN/bio_3/unique/tech_3/all/by_promoter/unique_XEN_bio_3_tech_3_all.csv results/XEN/bio_3/unique/tech_3/XEN_bio_3_tech_3_rna_seq_barcodes.csv results/XEN/bio_3/unique/tech_3/all/by_promoter/normalized_unique_XEN_bio_3_tech_3_all.csv

# python3 sum_promoters_counts_results.py results/XEN/analys_bio_2_and_bio_3_all_tech/XEN_bio_2_tech_1_normalized.csv,results/XEN/analys_bio_2_and_bio_3_all_tech/XEN_bio_2_tech_2_normalized.csv,results/XEN/analys_bio_2_and_bio_3_all_tech/XEN_bio_2_tech_3_normalized.csv,results/XEN/analys_bio_2_and_bio_3_all_tech/XEN_bio_3_tech_1_normalized.csv,results/XEN/analys_bio_2_and_bio_3_all_tech/XEN_bio_3_tech_2_normalized.csv,results/XEN/analys_bio_2_and_bio_3_all_tech/XEN_bio_3_tech_3_normalized.csv ./results/XEN/analys_bio_2_and_bio_3_all_tech/XEN_sum.csv