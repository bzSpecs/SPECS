#!/bin/bash

# ./rna_preprocess.sh ABINTUS_R1 H7 bio_1 tech_1 ../../resources/Lior14_run829/Lior_1_S1_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 RL bio_1 tech_1 ../../resources/Lior14_run829/Lior_2_S2_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 DS bio_1 tech_1 ../../resources/Lior14_run829/Lior_3_S3_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 U2 bio_1 tech_1 ../../resources/Lior14_run829/Lior_4_S4_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 MC_CAR bio_1 tech_1 ../../resources/Lior14_run829/Lior_5_S5_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 NCI bio_1 tech_1 ../../resources/Lior14_run829/Lior_6_S6_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 HT_1080 bio_1 tech_1 ../../resources/Lior14_run829/Lior_7_S7_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 CD4 bio_1 tech_1 ../../resources/Lior14_run829/Lior_8_S8_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 CD8 bio_1 tech_1 ../../resources/Lior14_run829/Lior_9_S9_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 TREGS bio_1 tech_1 ../../resources/Lior14_run829/Lior_10_S10_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 B_CELLS bio_1 tech_1 ../../resources/Lior14_run829/Lior_11_S11_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 MONOCYTES bio_1 tech_1 ../../resources/Lior14_run829/Lior_12_S12_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 JURKAT bio_1 tech_1 ../../resources/Lior14_run829/Lior_13_S13_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 FOURTEEN bio_1 tech_1 ../../resources/Lior14_run829/Lior_14_S14_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 H1 bio_1 tech_1 ../../resources/Lior2_run839_2/Lior_a15_S28_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output

# ./rna_preprocess.sh ABINTUS_R1 H7 bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b1_S1_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 RL bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b2_S2_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 DS bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b3_S3_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 U2 bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b4_S4_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 MC_CAR bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b5_S5_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 NCI bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b6_S6_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 HT_1080 bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b7_S7_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 CD4 bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b8_S8_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 CD8 bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b9_S9_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 TREGS bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b10_S10_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 B_CELLS bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b11_S11_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 MONOCYTES bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b12_S12_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 JURKAT bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b13_S13_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 H1 bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b15_S29_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 FOURTEEN bio_1 tech_2 ../../resources/Lior2_run839_2/Lior_b14_S14_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output

# ./rna_preprocess.sh ABINTUS_R1 H7 bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c1_S15_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 RL bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c2_S16_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 DS bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c3_S17_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 U2 bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c4_S18_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 MC_CAR bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c5_S19_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 NCI bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c6_S20_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 HT_1080 bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c7_S21_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 CD4 bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c8_S22_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 CD8 bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c9_S23_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 TREGS bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c10_S24_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 B_CELLS bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c11_S25_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 MONOCYTES bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c12_S26_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 JURKAT bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c13_S27_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
# ./rna_preprocess.sh ABINTUS_R1 H1 bio_1 tech_3 ../../resources/Lior2_run839_2/Lior_c15_S30_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output

./rna_preprocess.sh ABINTUS_R2 H7 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_1b_S15_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 RL bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_2b_S16_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 DS bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_3b_S17_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 U2 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_4b_S18_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 MC_CAR bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_5b_S19_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 NCI bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_6b_S20_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 HT_1080 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_7b_S21_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 CD4 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_8b_S22_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 CD8 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_9b_S23_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 TREGS bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_10b_S24_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 B_CELLS bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_11b_S25_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 MONOCYTES bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_12b_S26_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 JURKAT bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_13b_S27_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 FOURTEEN bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_14b_S28_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 H1 bio_1 tech_2 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_15b_S43_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output

./rna_preprocess.sh ABINTUS_R2 H7 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_1c_S29_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 RL bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_2c_S30_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 DS bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_3c_S31_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 U2 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_4c_S32_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 MC_CAR bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_5c_S33_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 NCI bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_6c_S34_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 HT_1080 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_7c_S35_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 CD4 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_8c_S36_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 CD8 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_9c_S37_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 TREGS bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_10c_S38_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 B_CELLS bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_11c_S39_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 MONOCYTES bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_12c_S40_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 JURKAT bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_13c_S41_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output
./rna_preprocess.sh ABINTUS_R2 H1 bio_1 tech_3 /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/LN/LN_15c_S44_R1_001.fastq ./pyscripts ./bowtie2_lib_C30/C30 ../../resources/define_local_exec_paths.sh output