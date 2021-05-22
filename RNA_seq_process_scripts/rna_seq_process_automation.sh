#!/bin/bash

# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/CRYE1/results/clipped_CRYE1.fastq SHARON CRYE 1 1 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/CRYE2/results/clipped_CRYE2.fastq SHARON CRYE 1 2 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/CRYE3/results/clipped_CRYE3.fastq SHARON CRYE 1 3 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/CTL1/results/clipped_CTL1.fastq SHARON CTL 1 1 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/CTL2/results/clipped_CTL2.fastq SHARON CTL 1 2 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/CTL3/results/clipped_CTL3.fastq SHARON CTL 1 3 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/LOW_O1/results/clipped_LOW_O1.fastq SHARON LOW 1 1 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/LOW_O2/results/clipped_LOW_O2.fastq SHARON LOW 1 2 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/LOW_O3/results/clipped_LOW_O3.fastq SHARON LOW 1 3 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/ST110_1/results/clipped_ST110_1.fastq SHARON ST110 1 1 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/ST110_2/results/clipped_ST110_2.fastq SHARON ST110 1 2 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/ST110_3/results/clipped_ST110_3.fastq SHARON ST110 1 3 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/ST11_1/results/clipped_ST11_1.fastq SHARON ST11 1 1 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/ST11_2/results/clipped_ST11_2.fastq SHARON ST11 1 2 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/ST11_3/results/clipped_ST11_3.fastq SHARON ST11 1 3 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/STARV1/results/clipped_STARV1.fastq SHARON STARV 1 1 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/STARV2/results/clipped_STARV2.fastq SHARON STARV 1 2 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/STARV3/results/clipped_STARV3.fastq SHARON STARV 1 3 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/TOXIC1/results/clipped_TOXIC1.fastq SHARON TOXIC 1 1 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/TOXIC2/results/clipped_TOXIC2.fastq SHARON TOXIC 1 2 100 3
# ./analyse_replicate.sh ../lib_construction_process_scripts/barcode_promoter_pairing_output/first_library/results/first_library_PAIRED.csv ../RNA_seq_preprocess/output/SHARON/TOXIC3/results/clipped_TOXIC3.fastq SHARON TOXIC 1 3 100 3



./D11_lib_construction.sh LUNG_CANCER sample_2 ../resources/Lior_Lung_Cancer/LIOR_2_S2_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_3 ../resources/Lior_Lung_Cancer/LIOR_3_S3_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_4 ../resources/Lior_Lung_Cancer/LIOR_4_S4_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_5 ../resources/Lior_Lung_Cancer/LIOR_5_S5_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_6 ../resources/Lior_Lung_Cancer/LIOR_6_S6_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_7 ../resources/Lior_Lung_Cancer/LIOR_7_S7_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_8 ../resources/Lior_Lung_Cancer/LIOR_8_S8_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_9 ../resources/Lior_Lung_Cancer/LIOR_9_S9_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_10 ../resources/Lior_Lung_Cancer/LIOR_10_S10_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_11 ../resources/Lior_Lung_Cancer/LIOR_11_S11_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_12 ../resources/Lior_Lung_Cancer/LIOR_12_S12_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_13 ../resources/Lior_Lung_Cancer/LIOR_13_S13_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_14 ../resources/Lior_Lung_Cancer/LIOR_14_S14_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_15 ../resources/Lior_Lung_Cancer/LIOR_15_S15_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_16 ../resources/Lior_Lung_Cancer/LIOR_16_S16_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_17 ../resources/Lior_Lung_Cancer/LIOR_17_S17_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_18 ../resources/Lior_Lung_Cancer/LIOR_18_S18_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11
./D11_lib_construction.sh LUNG_CANCER sample_19 ../resources/Lior_Lung_Cancer/LIOR_19_S19_R1_001.fastq ../pyscripts ../lib_construction_process_scripts/bowtie2_lib_D11/D11