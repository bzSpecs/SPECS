#!/bin/bash

# first library
./barcode_promoter_pairing_driver_script.sh ../resources/Library_Construction/lib_constuction_promoters.fastq ../resources/Library_Construction/lib_constuction_barcodes.fastq first_library CGGCCGCCCTGCAGG GGCGCGCCAGACGCT GACACCATGGTGGC GGATCCGAGCTGGTT 20 20

# coverage LIOR_672
./promotor_sample_coverage.sh ../resources/Lior36_run672/SPES_11112_1_S1_R1_001.fastq 11112_1 lib_672 GCGGCCGCCCTGCAGG ""