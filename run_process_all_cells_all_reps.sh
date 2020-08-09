#!/bin/bash

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/TSC/clipped_rep1_TSC.fastq results TSC rep1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/TSC/clipped_rep2_TSC.fastq results TSC rep2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/TSC/clipped_rep3_TSC.fastq results TSC rep3 100 3
python3 top_promoters_all_reps.py results/TSC/threshold_3/rep1/all/by_promoter/threshold_3_TSC_rep1_all.csv results/TSC/threshold_3/rep2/all/by_promoter/threshold_3_TSC_rep2_all.csv results/TSC/threshold_3/rep3/all/by_promoter/threshold_3_TSC_rep3_all.csv 15 results/TSC/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/TSC/threshold_3/rep1/all/by_promoter/threshold_3_TSC_rep1_all.csv 'Technical Repeat 1' results/TSC/threshold_3/rep2/all/by_promoter/threshold_3_TSC_rep2_all.csv 'Technical Repeat 2' 'TSC cells' promoter

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/clipped_rep1_ESC.fastq results ESC rep1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/clipped_rep2_ESC.fastq results ESC rep2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/ESC/clipped_rep3_ESC.fastq results ESC rep3 100 3
python3 top_promoters_all_reps.py results/ESC/threshold_3/rep1/all/by_promoter/threshold_3_ESC_rep1_all.csv results/ESC/threshold_3/rep2/all/by_promoter/threshold_3_ESC_rep2_all.csv results/ESC/threshold_3/rep3/all/by_promoter/threshold_3_ESC_rep3_all.csv 15 results/ESC/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/ESC/threshold_3/rep1/all/by_promoter/threshold_3_ESC_rep1_all.csv 'Technical Repeat 1' results/ESC/threshold_3/rep2/all/by_promoter/threshold_3_ESC_rep2_all.csv 'Technical Repeat 2' 'ESC cells' promoter

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/clipped_rep1_MEFs.fastq results MEFs rep1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/clipped_rep2_MEFs.fastq results MEFs rep2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/MEFs/clipped_rep3_MEFs.fastq results MEFs rep3 100 3
python3 top_promoters_all_reps.py results/MEFs/threshold_3/rep1/all/by_promoter/threshold_3_MEFs_rep1_all.csv results/MEFs/threshold_3/rep2/all/by_promoter/threshold_3_MEFs_rep2_all.csv results/MEFs/threshold_3/rep3/all/by_promoter/threshold_3_MEFs_rep3_all.csv 15 results/MEFs/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/MEFs/threshold_3/rep1/all/by_promoter/threshold_3_MEFs_rep1_all.csv 'Technical Repeat 1' results/MEFs/threshold_3/rep2/all/by_promoter/threshold_3_MEFs_rep2_all.csv 'Technical Repeat 2' 'MEFs cells' promoter

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/clipped_rep1_XEN.fastq results XEN rep1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/clipped_rep2_XEN.fastq results XEN rep2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/XEN/clipped_rep3_XEN.fastq results XEN rep3 100 3
python3 top_promoters_all_reps.py results/XEN/threshold_3/rep1/all/by_promoter/threshold_3_XEN_rep1_all.csv results/XEN/threshold_3/rep2/all/by_promoter/threshold_3_XEN_rep2_all.csv results/XEN/threshold_3/rep3/all/by_promoter/threshold_3_XEN_rep3_all.csv 15 results/XEN/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/XEN/threshold_3/rep1/all/by_promoter/threshold_3_XEN_rep1_all.csv 'Technical Repeat 1' results/XEN/threshold_3/rep2/all/by_promoter/threshold_3_XEN_rep2_all.csv 'Technical Repeat 2' 'XEN cells' promoter

./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/clipped_rep1_HEK293T.fastq results HEK293T rep1 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/clipped_rep2_HEK293T.fastq results HEK293T rep2 100 3
./analys_replica.sh ../scripts/library_preparation/barcodes/asdasd_PAIRED.csv ../RNA-seq/HEK293T/clipped_rep3_HEK293T.fastq results HEK293T rep3 100 3
python3 top_promoters_all_reps.py results/HEK293T/threshold_3/rep1/all/by_promoter/threshold_3_HEK293T_rep1_all.csv results/HEK293T/threshold_3/rep2/all/by_promoter/threshold_3_HEK293T_rep2_all.csv results/HEK293T/threshold_3/rep3/all/by_promoter/threshold_3_HEK293T_rep3_all.csv 15 results/HEK293T/all_cell_threshold_3_promoters.csv
# python3 plot_relation.py results/HEK293T/threshold_3/rep1/all/by_promoter/threshold_3_HEK293T_rep1_all.csv 'Technical Repeat 1' results/HEK293T/threshold_3/rep2/all/by_promoter/threshold_3_HEK293T_rep2_all.csv 'Technical Repeat 2' 'HEK293T cells' promoter
