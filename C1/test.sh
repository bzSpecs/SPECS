#!/bin/bash

./analyse_replicate.sh analysis_results LUNG_CANCER LET-1 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LET-1/bio_1/tech_1/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER LET-1 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LET-1/bio_1/tech_2/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER LET-1 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LET-1/bio_1/tech_3/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER LET-1 bio_1 tech_4 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LET-1/bio_1/tech_4/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/LUNG_CANCER/LET-1/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/LET-1/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/LET-1/bio_1/tech_3/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/LET-1/bio_1/tech_4/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/LUNG_CANCER/LET-1/bio_1/summarized_info_of_unique_17_count.csv

./analyse_replicate.sh analysis_results LUNG_CANCER LLC bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LLC/bio_1/tech_1/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER LLC bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LLC/bio_1/tech_2/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER LLC bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LLC/bio_1/tech_3/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER LLC bio_1 tech_4 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LLC/bio_1/tech_4/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/LUNG_CANCER/LLC/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/LLC/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/LLC/bio_1/tech_3/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/LLC/bio_1/tech_4/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/LUNG_CANCER/LLC/bio_1/summarized_info_of_unique_17_count.csv

./analyse_replicate.sh analysis_results LUNG_CANCER LLC_2 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LLC_2/bio_1/tech_1/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER LLC_2 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LLC_2/bio_1/tech_2/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER LLC_2 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/LLC_2/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/LUNG_CANCER/LLC_2/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/LLC_2/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/LLC_2/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/LUNG_CANCER/LLC_2/bio_1/summarized_info_of_unique_17_count.csv

./analyse_replicate.sh analysis_results LUNG_CANCER nMuMG bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/nMuMG/bio_1/tech_1/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER nMuMG bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/nMuMG/bio_1/tech_2/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER nMuMG bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/nMuMG/bio_1/tech_3/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER nMuMG bio_1 tech_4 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/nMuMG/bio_1/tech_4/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/LUNG_CANCER/nMuMG/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/nMuMG/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/nMuMG/bio_1/tech_3/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/nMuMG/bio_1/tech_4/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/LUNG_CANCER/nMuMG/bio_1/summarized_info_of_unique_17_count.csv

./analyse_replicate.sh analysis_results LUNG_CANCER MEF bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/MEF/bio_1/tech_1/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER MEF bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/MEF/bio_1/tech_2/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER MEF bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/MEF/bio_1/tech_3/paired.csv ./pyscripts
./analyse_replicate.sh analysis_results LUNG_CANCER MEF bio_1 tech_4 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/LUNG_CANCER/MEF/bio_1/tech_4/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/LUNG_CANCER/MEF/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/MEF/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/MEF/bio_1/tech_3/summarized_info_of_unique_17_count.csv,analysis_results/LUNG_CANCER/MEF/bio_1/tech_4/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/LUNG_CANCER/MEF/bio_1/summarized_info_of_unique_17_count.csv







# ./analyse_replicate.sh analysis_results NIR_748 MDA231 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MDA231/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MDA231 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MDA231/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MDA231 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MDA231/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/MDA231/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MDA231/bio_1/tech_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/MDA231/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 MDA231 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MDA231/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MDA231 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MDA231/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MDA231 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MDA231/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/MDA231/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MDA231/bio_2/tech_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/MDA231/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/MDA231/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MDA231/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/MDA231/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 BT474 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/BT474/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 BT474 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/BT474/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 BT474 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/BT474/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/BT474/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/BT474/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/BT474/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/BT474/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 BT474 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/BT474/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 BT474 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/BT474/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 BT474 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/BT474/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/BT474/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/BT474/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/BT474/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/BT474/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/BT474/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/BT474/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/BT474/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 CCD841 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/CCD841/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 CCD841 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/CCD841/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 CCD841 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/CCD841/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/CCD841/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/CCD841/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/CCD841/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/CCD841/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 CCD841 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/CCD841/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 CCD841 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/CCD841/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 CCD841 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/CCD841/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/CCD841/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/CCD841/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/CCD841/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/CCD841/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/CCD841/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/CCD841/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/CCD841/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 Colo320DM bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/Colo320DM/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 Colo320DM bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/Colo320DM/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 Colo320DM bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/Colo320DM/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/Colo320DM/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/Colo320DM/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/Colo320DM/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/Colo320DM/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 Colo320DM bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/Colo320DM/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 Colo320DM bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/Colo320DM/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 Colo320DM bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/Colo320DM/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/Colo320DM/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/Colo320DM/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/Colo320DM/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/Colo320DM/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/Colo320DM/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/Colo320DM/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/Colo320DM/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HCT116 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HCT116/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HCT116 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HCT116/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HCT116 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HCT116/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HCT116/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HCT116/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HCT116/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HCT116/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HCT116 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HCT116/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HCT116 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HCT116/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HCT116 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HCT116/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HCT116/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HCT116/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HCT116/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HCT116/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HCT116/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HCT116/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HCT116/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HDFa bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HDFa/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HDFa bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HDFa/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HDFa bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HDFa/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HDFa/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HDFa/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HDFa/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HDFa/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HDFa bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HDFa/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HDFa bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HDFa/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HDFa bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HDFa/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HDFa/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HDFa/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HDFa/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HDFa/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HDFa/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HDFa/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HDFa/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HEK bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HEK/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HEK bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HEK/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HEK bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HEK/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HEK/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HEK/bio_1/tech_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HEK/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HEK bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HEK/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HEK bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HEK/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HEK bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HEK/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HEK/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HEK/bio_2/tech_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HEK/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HEK/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HEK/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HEK/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HS-578T bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HS-578T/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HS-578T bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HS-578T/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HS-578T bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HS-578T/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HS-578T/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HS-578T/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HS-578T/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HS-578T/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HS-578T bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HS-578T/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HS-578T bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HS-578T/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HS-578T bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HS-578T/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HS-578T/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HS-578T/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HS-578T/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HS-578T/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HS-578T/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HS-578T/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HS-578T/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HT29 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HT29/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HT29 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HT29/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HT29 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HT29/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HT29/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HT29/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HT29/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HT29/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 HT29 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HT29/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HT29 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HT29/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 HT29 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/HT29/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HT29/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HT29/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HT29/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HT29/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/HT29/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/HT29/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/HT29/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 MCF7 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF7/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MCF7 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF7/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MCF7 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF7/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/MCF7/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF7/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF7/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/MCF7/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 MCF7 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF7/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MCF7 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF7/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MCF7 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF7/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/MCF7/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF7/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF7/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/MCF7/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/MCF7/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF7/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/MCF7/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 MCF10 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF10/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MCF10 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF10/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MCF10 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF10/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/MCF10/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF10/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF10/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/MCF10/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 MCF10 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF10/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MCF10 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF10/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 MCF10 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/MCF10/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/MCF10/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF10/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF10/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/MCF10/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/MCF10/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/MCF10/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/MCF10/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 NL20 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/NL20/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 NL20 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/NL20/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 NL20 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/NL20/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/NL20/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/NL20/bio_1/tech_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/NL20/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 NL20 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/NL20/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 NL20 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/NL20/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 NL20 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/NL20/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/NL20/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/NL20/bio_2/tech_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/NL20/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/NL20/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/NL20/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/NL20/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 SW480 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW480/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 SW480 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW480/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 SW480 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW480/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/SW480/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/SW480/bio_1/tech_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/SW480/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 SW480 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW480/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 SW480 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW480/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 SW480 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW480/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/SW480/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/SW480/bio_2/tech_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/SW480/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/SW480/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/SW480/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/SW480/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 SW620 bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW620/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 SW620 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW620/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 SW620 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW620/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/SW620/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/SW620/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/SW620/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/SW620/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 SW620 bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW620/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 SW620 bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW620/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 SW620 bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/SW620/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/SW620/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/SW620/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/SW620/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/SW620/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/SW620/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/SW620/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/SW620/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 T47D bio_1 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/T47D/bio_1/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 T47D bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/T47D/bio_1/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 T47D bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/T47D/bio_1/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/T47D/bio_1/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/T47D/bio_1/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/T47D/bio_1/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/T47D/bio_1/summarized_info_of_unique_17_count.csv

# ./analyse_replicate.sh analysis_results NIR_748 T47D bio_2 tech_1 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/T47D/bio_2/tech_1/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 T47D bio_2 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/T47D/bio_2/tech_2/paired.csv ./pyscripts
# ./analyse_replicate.sh analysis_results NIR_748 T47D bio_2 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/C1/lib_construction/output/NIR_748/T47D/bio_2/tech_3/paired.csv ./pyscripts
# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/T47D/bio_2/tech_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/T47D/bio_2/tech_2/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/T47D/bio_2/tech_3/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/T47D/bio_2/summarized_info_of_unique_17_count.csv

# python pyscripts/sum_unique_17_columns.py analysis_results/NIR_748/T47D/bio_1/summarized_info_of_unique_17_count.csv,analysis_results/NIR_748/T47D/bio_2/summarized_info_of_unique_17_count.csv count,avg_count_per_number_of_barcodes,unnormalized_count count False analysis_results/NIR_748/T47D/summarized_info_of_unique_17_count.csv
