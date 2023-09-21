#!/bin/bash

# Activate conda environment
mamba activate STAR

# Build genome index
STAR --runThreadN 40 --runMode genomeGenerate --genomeDir /media/goutham/B/TAIR_test/genome_index --genomeFastaFiles /media/goutham/B/TAIR_test/TAIR10_chr_all.fas --sjdbGTFfile /media/goutham/B/TAIR_test/TAIR10_GFF3_genes.gtf --sjdbOverhang 99

# Run alignment
STAR --genomeDir /media/goutham/B/TAIR_test/genome_index --readFilesIn Col_WW_1_1.fq,Col_NaCl_1_1.fq,D26_NS_1.fq,D26_NaCl_1.fq Col_WW_1_2.fq,Col_NaCl_1_2.fq,D26_NS_2.fq,D26_NaCl_2.fq --outFileNamePrefix mapped --outSAMtype BAM Unsorted --runThreadN 40

# Deactivate conda environment
mamba deactivate

