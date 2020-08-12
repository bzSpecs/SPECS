#!/bin/bash

############################ TSC ############################


################## TSC_1 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/TSC/TSC_1/clipped_TSC_1_rep1.fastq results TSC 1 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/TSC/TSC_1/clipped_TSC_1_rep2.fastq results TSC 1 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/TSC/TSC_1/clipped_TSC_1_rep3.fastq results TSC 1 3 100 3
python3 top_promoters_all_reps.py results/TSC/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_TSC_bio_1_tech_1_all.csv results/TSC/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_TSC_bio_1_tech_2_all.csv results/TSC/bio_1/threshold_3/tech_3/all/by_promoter/threshold_3_TSC_bio_1_tech_3_all.csv 15 results/TSC/bio_1/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/TSC/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_TSC_bio_1_tech_1_all.csv 'Technical Repeat 1' results/TSC/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_TSC_bio_1_tech_2_all.csv 'Technical Repeat 2' 'TSC_1 cells - all' promoter
# python3 plot_relation.py results/TSC/bio_1/threshold_3/tech_1/threshold_3_TSC_bio_1_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/TSC/bio_1/threshold_3/tech_2/threshold_3_TSC_bio_1_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'TSC_1 cells - top 10' promoter



############################ ESC ############################


################## ESC_1 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/ESC_1/clipped_ESC_1_rep1.fastq results ESC 1 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/ESC_1/clipped_ESC_1_rep2.fastq results ESC 1 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/ESC_1/clipped_ESC_1_rep3.fastq results ESC 1 3 100 3
python3 top_promoters_all_reps.py results/ESC/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_ESC_bio_1_tech_1_all.csv results/ESC/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_ESC_bio_1_tech_2_all.csv results/ESC/bio_1/threshold_3/tech_3/all/by_promoter/threshold_3_ESC_bio_1_tech_3_all.csv 15 results/ESC/bio_1/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/ESC/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_ESC_bio_1_tech_1_all.csv 'Technical Repeat 1' results/ESC/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_ESC_bio_1_tech_2_all.csv 'Technical Repeat 2' 'ESC_1 cells - all' promoter
# python3 plot_relation.py results/ESC/bio_1/threshold_3/tech_1/threshold_3_ESC_bio_1_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/ESC/bio_1/threshold_3/tech_2/threshold_3_ESC_bio_1_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'ESC_1 cells - top 10' promoter


################## ESC_2 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/ESC_2/clipped_ESC_2_rep1.fastq results ESC 2 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/ESC_2/clipped_ESC_2_rep2.fastq results ESC 2 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/ESC_2/clipped_ESC_2_rep3.fastq results ESC 2 3 100 3
python3 top_promoters_all_reps.py results/ESC/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_ESC_bio_2_tech_1_all.csv results/ESC/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_ESC_bio_2_tech_2_all.csv results/ESC/bio_2/threshold_3/tech_3/all/by_promoter/threshold_3_ESC_bio_2_tech_3_all.csv 15 results/ESC/bio_2/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/ESC/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_ESC_bio_2_tech_1_all.csv 'Technical Repeat 1' results/ESC/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_ESC_bio_2_tech_2_all.csv 'Technical Repeat 2' 'ESC_2 cells - all' promoter
# python3 plot_relation.py results/ESC/bio_2/threshold_3/tech_1/threshold_3_ESC_bio_2_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/ESC/bio_2/threshold_3/tech_2/threshold_3_ESC_bio_2_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'ESC_2 cells - top 10' promoter


################## ESC_3 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/ESC_3/clipped_ESC_3_rep1.fastq results ESC 3 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/ESC_3/clipped_ESC_3_rep2.fastq results ESC 3 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/ESC_3/clipped_ESC_3_rep3.fastq results ESC 3 3 100 3
python3 top_promoters_all_reps.py results/ESC/bio_3/threshold_3/tech_1/all/by_promoter/threshold_3_ESC_bio_3_tech_1_all.csv results/ESC/bio_3/threshold_3/tech_2/all/by_promoter/threshold_3_ESC_bio_3_tech_2_all.csv results/ESC/bio_3/threshold_3/tech_3/all/by_promoter/threshold_3_ESC_bio_3_tech_3_all.csv 15 results/ESC/bio_3/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/ESC/bio_3/threshold_3/tech_1/all/by_promoter/threshold_3_ESC_bio_3_tech_1_all.csv 'Technical Repeat 1' results/ESC/bio_3/threshold_3/tech_2/all/by_promoter/threshold_3_ESC_bio_3_tech_2_all.csv 'Technical Repeat 2' 'ESC_3 cells - all' promoter
# python3 plot_relation.py results/ESC/bio_3/threshold_3/tech_1/threshold_3_ESC_bio_3_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/ESC/bio_3/threshold_3/tech_2/threshold_3_ESC_bio_3_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'ESC_3 cells - top 10' promoter



############################ MEFs ############################


################## MEFs_1 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/MEFs_1/clipped_MEFs_1_rep1.fastq results MEFs 1 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/MEFs_1/clipped_MEFs_1_rep2.fastq results MEFs 1 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/MEFs_1/clipped_MEFs_1_rep3.fastq results MEFs 1 3 100 3
python3 top_promoters_all_reps.py results/MEFs/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_MEFs_bio_1_tech_1_all.csv results/MEFs/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_MEFs_bio_1_tech_2_all.csv results/MEFs/bio_1/threshold_3/tech_3/all/by_promoter/threshold_3_MEFs_bio_1_tech_3_all.csv 15 results/MEFs/bio_1/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/MEFs/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_MEFs_bio_1_tech_1_all.csv 'Technical Repeat 1' results/MEFs/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_MEFs_bio_1_tech_2_all.csv 'Technical Repeat 2' 'MEFs_1 cells - all' promoter
# python3 plot_relation.py results/MEFs/bio_1/threshold_3/tech_1/threshold_3_MEFs_bio_1_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/MEFs/bio_1/threshold_3/tech_2/threshold_3_MEFs_bio_1_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'MEFs_1 cells - top 10' promoter


################## MEFs_2 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/MEFs_2/clipped_MEFs_2_rep1.fastq results MEFs 2 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/MEFs_2/clipped_MEFs_2_rep2.fastq results MEFs 2 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/MEFs_2/clipped_MEFs_2_rep3.fastq results MEFs 2 3 100 3
python3 top_promoters_all_reps.py results/MEFs/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_MEFs_bio_2_tech_1_all.csv results/MEFs/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_MEFs_bio_2_tech_2_all.csv results/MEFs/bio_2/threshold_3/tech_3/all/by_promoter/threshold_3_MEFs_bio_2_tech_3_all.csv 15 results/MEFs/bio_2/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/MEFs/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_MEFs_bio_2_tech_1_all.csv 'Technical Repeat 1' results/MEFs/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_MEFs_bio_2_tech_2_all.csv 'Technical Repeat 2' 'MEFs_2 cells - all' promoter
# python3 plot_relation.py results/MEFs/bio_2/threshold_3/tech_1/threshold_3_MEFs_bio_2_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/MEFs/bio_2/threshold_3/tech_2/threshold_3_MEFs_bio_2_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'MEFs_2 cells - top 10' promoter


################## MEFs_3 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/MEFs_3/clipped_MEFs_3_rep1.fastq results MEFs 3 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/MEFs_3/clipped_MEFs_3_rep2.fastq results MEFs 3 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/MEFs_3/clipped_MEFs_3_rep3.fastq results MEFs 3 3 100 3
python3 top_promoters_all_reps.py results/MEFs/bio_3/threshold_3/tech_1/all/by_promoter/threshold_3_MEFs_bio_3_tech_1_all.csv results/MEFs/bio_3/threshold_3/tech_2/all/by_promoter/threshold_3_MEFs_bio_3_tech_2_all.csv results/MEFs/bio_3/threshold_3/tech_3/all/by_promoter/threshold_3_MEFs_bio_3_tech_3_all.csv 15 results/MEFs/bio_3/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/MEFs/bio_3/threshold_3/tech_1/all/by_promoter/threshold_3_MEFs_bio_3_tech_1_all.csv 'Technical Repeat 1' results/MEFs/bio_3/threshold_3/tech_2/all/by_promoter/threshold_3_MEFs_bio_3_tech_2_all.csv 'Technical Repeat 2' 'MEFs_3 cells - all' promoter
# python3 plot_relation.py results/MEFs/bio_3/threshold_3/tech_1/threshold_3_MEFs_bio_3_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/MEFs/bio_3/threshold_3/tech_2/threshold_3_MEFs_bio_3_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'MEFs_3 cells - top 10' promoter



############################ XEN ############################


################## XEN_1 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_1/clipped_XEN_1_rep1.fastq results XEN 1 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_1/clipped_XEN_1_rep2.fastq results XEN 1 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_1/clipped_XEN_1_rep3.fastq results XEN 1 3 100 3
python3 top_promoters_all_reps.py results/XEN/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_XEN_bio_1_tech_1_all.csv results/XEN/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_XEN_bio_1_tech_2_all.csv results/XEN/bio_1/threshold_3/tech_3/all/by_promoter/threshold_3_XEN_bio_1_tech_3_all.csv 15 results/XEN/bio_1/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/XEN/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_XEN_bio_1_tech_1_all.csv 'Technical Repeat 1' results/XEN/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_XEN_bio_1_tech_2_all.csv 'Technical Repeat 2' 'XEN_1 cells - all' promoter
# python3 plot_relation.py results/XEN/bio_1/threshold_3/tech_1/threshold_3_XEN_bio_1_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/XEN/bio_1/threshold_3/tech_2/threshold_3_XEN_bio_1_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'XEN_1 cells - top 10' promoter


################## XEN_2 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_2/clipped_XEN_2_rep1.fastq results XEN 2 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_2/clipped_XEN_2_rep2.fastq results XEN 2 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_2/clipped_XEN_2_rep3.fastq results XEN 2 3 100 3
python3 top_promoters_all_reps.py results/XEN/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_XEN_bio_2_tech_1_all.csv results/XEN/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_XEN_bio_2_tech_2_all.csv results/XEN/bio_2/threshold_3/tech_3/all/by_promoter/threshold_3_XEN_bio_2_tech_3_all.csv 15 results/XEN/bio_2/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/XEN/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_XEN_bio_2_tech_1_all.csv 'Technical Repeat 1' results/XEN/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_XEN_bio_2_tech_2_all.csv 'Technical Repeat 2' 'XEN_2 cells - all' promoter
# python3 plot_relation.py results/XEN/bio_2/threshold_3/tech_1/threshold_3_XEN_bio_2_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/XEN/bio_2/threshold_3/tech_2/threshold_3_XEN_bio_2_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'XEN_2 cells - top 10' promoter


################## XEN_3 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_3/clipped_XEN_3_rep1.fastq results XEN 3 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_3/clipped_XEN_3_rep2.fastq results XEN 3 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_3/clipped_XEN_3_rep3.fastq results XEN 3 3 100 3
python3 top_promoters_all_reps.py results/XEN/bio_3/threshold_3/tech_1/all/by_promoter/threshold_3_XEN_bio_3_tech_1_all.csv results/XEN/bio_3/threshold_3/tech_2/all/by_promoter/threshold_3_XEN_bio_3_tech_2_all.csv results/XEN/bio_3/threshold_3/tech_3/all/by_promoter/threshold_3_XEN_bio_3_tech_3_all.csv 15 results/XEN/bio_3/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/XEN/bio_3/threshold_3/tech_1/all/by_promoter/threshold_3_XEN_bio_3_tech_1_all.csv 'Technical Repeat 1' results/XEN/bio_3/threshold_3/tech_2/all/by_promoter/threshold_3_XEN_bio_3_tech_2_all.csv 'Technical Repeat 2' 'XEN_3 cells - all' promoter
# python3 plot_relation.py results/XEN/bio_3/threshold_3/tech_1/threshold_3_XEN_bio_3_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/XEN/bio_3/threshold_3/tech_2/threshold_3_XEN_bio_3_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'XEN_3 cells - top 10' promoter


################## XEN_Special ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_Special/clipped_XEN_Special_rep1.fastq results XEN s 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_Special/clipped_XEN_Special_rep2.fastq results XEN s 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/XEN_Special/clipped_XEN_Special_rep3.fastq results XEN s 3 100 3
python3 top_promoters_all_reps.py results/XEN/bio_s/threshold_3/tech_1/all/by_promoter/threshold_3_XEN_bio_s_tech_1_all.csv results/XEN/bio_s/threshold_3/tech_2/all/by_promoter/threshold_3_XEN_bio_s_tech_2_all.csv results/XEN/bio_s/threshold_3/tech_3/all/by_promoter/threshold_3_XEN_bio_s_tech_3_all.csv 15 results/XEN/bio_s/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/XEN/bio_s/threshold_3/tech_1/all/by_promoter/threshold_3_XEN_bio_s_tech_1_all.csv 'Technical Repeat 1' results/XEN/bio_s/threshold_3/tech_2/all/by_promoter/threshold_3_XEN_bio_s_tech_2_all.csv 'Technical Repeat 2' 'XEN_s cells - all' promoter
# python3 plot_relation.py results/XEN/bio_s/threshold_3/tech_1/threshold_3_XEN_bio_s_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/XEN/bio_s/threshold_3/tech_2/threshold_3_XEN_bio_s_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'XEN_s cells - top 10' promoter



############################ HEK293T ############################


################## HEK293T_1 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/HEK293T_1/clipped_HEK293T_1_rep1.fastq results HEK293T 1 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/HEK293T_1/clipped_HEK293T_1_rep2.fastq results HEK293T 1 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/HEK293T_1/clipped_HEK293T_1_rep3.fastq results HEK293T 1 3 100 3
python3 top_promoters_all_reps.py results/HEK293T/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_HEK293T_bio_1_tech_1_all.csv results/HEK293T/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_HEK293T_bio_1_tech_2_all.csv results/HEK293T/bio_1/threshold_3/tech_3/all/by_promoter/threshold_3_HEK293T_bio_1_tech_3_all.csv 15 results/HEK293T/bio_1/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/HEK293T/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_HEK293T_bio_1_tech_1_all.csv 'Technical Repeat 1' results/HEK293T/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_HEK293T_bio_1_tech_2_all.csv 'Technical Repeat 2' 'HEK293T_1 cells - all' promoter
# python3 plot_relation.py results/HEK293T/bio_1/threshold_3/tech_1/threshold_3_HEK293T_bio_1_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/HEK293T/bio_1/threshold_3/tech_2/threshold_3_HEK293T_bio_1_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'HEK293T_1 cells - top 10' promoter


################## HEK293T_2 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/HEK293T_2/clipped_HEK293T_2_rep1.fastq results HEK293T 2 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/HEK293T_2/clipped_HEK293T_2_rep2.fastq results HEK293T 2 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/HEK293T_2/clipped_HEK293T_2_rep3.fastq results HEK293T 2 3 100 3
python3 top_promoters_all_reps.py results/HEK293T/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_HEK293T_bio_2_tech_1_all.csv results/HEK293T/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_HEK293T_bio_2_tech_2_all.csv results/HEK293T/bio_2/threshold_3/tech_3/all/by_promoter/threshold_3_HEK293T_bio_2_tech_3_all.csv 15 results/HEK293T/bio_2/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/HEK293T/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_HEK293T_bio_2_tech_1_all.csv 'Technical Repeat 1' results/HEK293T/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_HEK293T_bio_2_tech_2_all.csv 'Technical Repeat 2' 'HEK293T_2 cells - all' promoter
# python3 plot_relation.py results/HEK293T/bio_2/threshold_3/tech_1/threshold_3_HEK293T_bio_2_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/HEK293T/bio_2/threshold_3/tech_2/threshold_3_HEK293T_bio_2_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'HEK293T_2 cells - top 10' promoter


################## HEK293T_3 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/HEK293T_3/clipped_HEK293T_3_rep1.fastq results HEK293T 3 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/HEK293T_3/clipped_HEK293T_3_rep2.fastq results HEK293T 3 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/HEK293T_3/clipped_HEK293T_3_rep3.fastq results HEK293T 3 3 100 3
python3 top_promoters_all_reps.py results/HEK293T/bio_3/threshold_3/tech_1/all/by_promoter/threshold_3_HEK293T_bio_3_tech_1_all.csv results/HEK293T/bio_3/threshold_3/tech_2/all/by_promoter/threshold_3_HEK293T_bio_3_tech_2_all.csv results/HEK293T/bio_3/threshold_3/tech_3/all/by_promoter/threshold_3_HEK293T_bio_3_tech_3_all.csv 15 results/HEK293T/bio_3/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/HEK293T/bio_3/threshold_3/tech_1/all/by_promoter/threshold_3_HEK293T_bio_3_tech_1_all.csv 'Technical Repeat 1' results/HEK293T/bio_3/threshold_3/tech_2/all/by_promoter/threshold_3_HEK293T_bio_3_tech_2_all.csv 'Technical Repeat 2' 'HEK293T_3 cells - all' promoter
# python3 plot_relation.py results/HEK293T/bio_3/threshold_3/tech_1/threshold_3_HEK293T_bio_3_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/HEK293T/bio_3/threshold_3/tech_2/threshold_3_HEK293T_bio_3_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'HEK293T_3 cells - top 10' promoter



############################ Sarcoma ############################


################## Sarcoma_1 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/Sarcoma/Sarcoma_1/clipped_Sarcoma_1_rep1.fastq results Sarcoma 1 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/Sarcoma/Sarcoma_1/clipped_Sarcoma_1_rep2.fastq results Sarcoma 1 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/Sarcoma/Sarcoma_1/clipped_Sarcoma_1_rep3.fastq results Sarcoma 1 3 100 3
python3 top_promoters_all_reps.py results/Sarcoma/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_Sarcoma_bio_1_tech_1_all.csv results/Sarcoma/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_Sarcoma_bio_1_tech_2_all.csv results/Sarcoma/bio_1/threshold_3/tech_3/all/by_promoter/threshold_3_Sarcoma_bio_1_tech_3_all.csv 15 results/Sarcoma/bio_1/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/Sarcoma/bio_1/threshold_3/tech_1/all/by_promoter/threshold_3_Sarcoma_bio_1_tech_1_all.csv 'Technical Repeat 1' results/Sarcoma/bio_1/threshold_3/tech_2/all/by_promoter/threshold_3_Sarcoma_bio_1_tech_2_all.csv 'Technical Repeat 2' 'Sarcoma_1 cells - all' promoter
# python3 plot_relation.py results/Sarcoma/bio_1/threshold_3/tech_1/threshold_3_Sarcoma_bio_1_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/Sarcoma/bio_1/threshold_3/tech_2/threshold_3_Sarcoma_bio_1_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'Sarcoma_1 cells - top 10' promoter


################## Sarcoma_2 ##################

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/Sarcoma/Sarcoma_2/clipped_Sarcoma_2_rep1.fastq results Sarcoma 2 1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/Sarcoma/Sarcoma_2/clipped_Sarcoma_2_rep2.fastq results Sarcoma 2 2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/Sarcoma/Sarcoma_2/clipped_Sarcoma_2_rep3.fastq results Sarcoma 2 3 100 3
python3 top_promoters_all_reps.py results/Sarcoma/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_Sarcoma_bio_2_tech_1_all.csv results/Sarcoma/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_Sarcoma_bio_2_tech_2_all.csv results/Sarcoma/bio_2/threshold_3/tech_3/all/by_promoter/threshold_3_Sarcoma_bio_2_tech_3_all.csv 15 results/Sarcoma/bio_2/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/Sarcoma/bio_2/threshold_3/tech_1/all/by_promoter/threshold_3_Sarcoma_bio_2_tech_1_all.csv 'Technical Repeat 1' results/Sarcoma/bio_2/threshold_3/tech_2/all/by_promoter/threshold_3_Sarcoma_bio_2_tech_2_all.csv 'Technical Repeat 2' 'Sarcoma_2 cells - all' promoter
# python3 plot_relation.py results/Sarcoma/bio_2/threshold_3/tech_1/threshold_3_Sarcoma_bio_2_tech_1_top_10_unique_promoters.csv 'Technical Repeat 1' results/Sarcoma/bio_2/threshold_3/tech_2/threshold_3_Sarcoma_bio_2_tech_2_top_10_unique_promoters.csv 'Technical Repeat 2' 'Sarcoma_2 cells - top 10' promoter