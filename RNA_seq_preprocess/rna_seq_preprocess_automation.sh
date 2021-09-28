#!/bin/bash

# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A101_S63_R1_001.fastq A101 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A103_S64_R1_001.fastq A103 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A105_S65_R1_001.fastq A105 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A107_S66_R1_001.fastq A107 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A115_S67_R1_001.fastq A115 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A117_S68_R1_001.fastq A117 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A119_S69_R1_001.fastq A119 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A43_S1_R1_001.fastq A43 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A44_S2_R1_001.fastq A44 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A46_S3_R1_001.fastq A46 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A47_S4_R1_001.fastq A47 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A49_S5_R1_001.fastq A49 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A50_S6_R1_001.fastq A50 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A52_S7_R1_001.fastq A52 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A53_S8_R1_001.fastq A53 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A55_S9_R1_001.fastq A55 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A56_S10_R1_001.fastq A56 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A68_S31_R1_001.fastq A68 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A69_S32_R1_001.fastq A69 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A71_S33_R1_001.fastq A71 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A72_S34_R1_001.fastq A72 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A77_S35_R1_001.fastq A77 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A78_S36_R1_001.fastq A78 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A80_S37_R1_001.fastq A80 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A81_S38_R1_001.fastq A81 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A85_S55_R1_001.fastq A85 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A87_S56_R1_001.fastq A87 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A89_S57_R1_001.fastq A89 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A91_S58_R1_001.fastq A91 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A93_S59_R1_001.fastq A93 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A95_S60_R1_001.fastq A95 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A97_S61_R1_001.fastq A97 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_A99_S62_R1_001.fastq A99 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B101_S78_R1_001.fastq B101 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B103_S79_R1_001.fastq B103 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B105_S80_R1_001.fastq B105 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B107_S81_R1_001.fastq B107 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B115_S82_R1_001.fastq B115 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B117_S83_R1_001.fastq B117 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B119_S84_R1_001.fastq B119 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B43_S11_R1_001.fastq B43 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B44_S12_R1_001.fastq B44 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B46_S13_R1_001.fastq B46 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B47_S14_R1_001.fastq B47 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B49_S15_R1_001.fastq B49 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B50_S16_R1_001.fastq B50 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B52_S17_R1_001.fastq B52 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B53_S18_R1_001.fastq B53 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B55_S19_R1_001.fastq B55 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B56_S20_R1_001.fastq B56 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B68_S39_R1_001.fastq B68 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B69_S40_R1_001.fastq B69 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B71_S41_R1_001.fastq B71 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B72_S42_R1_001.fastq B72 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B77_S43_R1_001.fastq B77 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B78_S44_R1_001.fastq B78 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B80_S45_R1_001.fastq B80 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B81_S46_R1_001.fastq B81 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B85_S70_R1_001.fastq B85 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B87_S71_R1_001.fastq B87 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B89_S72_R1_001.fastq B89 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B91_S73_R1_001.fastq B91 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B93_S74_R1_001.fastq B93 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B95_S75_R1_001.fastq B95 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B97_S76_R1_001.fastq B97 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_B99_S77_R1_001.fastq B99 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C101_S93_R1_001.fastq C101 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C103_S94_R1_001.fastq C103 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C105_S95_R1_001.fastq C105 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C107_S96_R1_001.fastq C107 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C115_S97_R1_001.fastq C115 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C117_S98_R1_001.fastq C117 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C119_S99_R1_001.fastq C119 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C43_S21_R1_001.fastq C43 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C44_S22_R1_001.fastq C44 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C46_S23_R1_001.fastq C46 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C47_S24_R1_001.fastq C47 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C49_S25_R1_001.fastq C49 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C50_S26_R1_001.fastq C50 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C52_S27_R1_001.fastq C52 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C53_S28_R1_001.fastq C53 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C55_S29_R1_001.fastq C55 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C56_S30_R1_001.fastq C56 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C68_S47_R1_001.fastq C68 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C69_S48_R1_001.fastq C69 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C71_S49_R1_001.fastq C71 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C72_S50_R1_001.fastq C72 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C77_S51_R1_001.fastq C77 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C78_S52_R1_001.fastq C78 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C80_S53_R1_001.fastq C80 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C81_S54_R1_001.fastq C81 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C85_S85_R1_001.fastq C85 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C87_S86_R1_001.fastq C87 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C89_S87_R1_001.fastq C89 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C91_S88_R1_001.fastq C91 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C93_S89_R1_001.fastq C93 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C95_S90_R1_001.fastq C95 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C97_S91_R1_001.fastq C97 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh ../resources/Lior99_run732/Lior_C99_S92_R1_001.fastq C99 Nir_brest TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25


# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_a4_S7_R1_001.fastq XEN_1_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_b4_S8_R1_001.fastq XEN_1_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_c4_S9_R1_001.fastq XEN_1_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/La11_S1_R1_001.fastq XEN_2_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lb11_S10_R1_001.fastq XEN_2_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lc11_S19_R1_001.fastq XEN_2_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/La23_S6_R1_001.fastq XEN_3_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lb23_S15_R1_001.fastq XEN_3_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lc23_S24_R1_001.fastq XEN_3_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_a5_S10_R1_001.fastq MEF_1_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_b5_S11_R1_001.fastq MEF_1_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_c5_S12_R1_001.fastq MEF_1_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/La13_S3_R1_001.fastq MEF_2_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lb13_S12_R1_001.fastq MEF_2_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lc13_S21_R1_001.fastq MEF_2_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/La26_S9_R1_001.fastq MEF_3_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lb26_S18_R1_001.fastq MEF_3_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lc26_S27_R1_001.fastq MEF_3_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_a6_S13_R1_001.fastq HEK293T_1_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_b6_S14_R1_001.fastq HEK293T_1_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_c6_S15_R1_001.fastq HEK293T_1_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/La14_S4_R1_001.fastq HEK293T_2_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lb14_S13_R1_001.fastq HEK293T_2_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lc14_S22_R1_001.fastq HEK293T_2_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/La25_S8_R1_001.fastq HEK293T_3_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lb25_S17_R1_001.fastq HEK293T_3_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lc25_S26_R1_001.fastq HEK293T_3_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_a2_S1_R1_001.fastq ESC_1_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_b2_S2_R1_001.fastq ESC_1_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_c2_S3_R1_001.fastq ESC_1_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/La15_S5_R1_001.fastq ESC_2_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lb15_S14_R1_001.fastq ESC_2_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lc15_S23_R1_001.fastq ESC_2_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/La24_S7_R1_001.fastq ESC_3_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lb24_S16_R1_001.fastq ESC_3_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run568/Lc24_S25_R1_001.fastq ESC_3_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25

# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_a3_S4_R1_001.fastq TSC_1_1 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_b3_S5_R1_001.fastq TSC_1_2 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
# ./rna_seq_preprocess.sh /Users/bzaruk/Documents/Projects/bzaruk/SPECS/resources/Lior_run539/Haya_c3_S6_R1_001.fastq TSC_1_3 stem_cells TGCGATCTAAGTAAGCTTGGCATTCCGGTACTGTTGGTAAACCAGCTCGGATCC 20 25
