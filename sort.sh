#!/bin/bash

# Sort alignment file for Col_NaCl_1 sample
samtools sort -@ 40 -o Col_NaCl_1_sorted.bam Col_NaCl_1.sam

# Sort alignment file for Col_WW_1 sample
samtools sort -@ 40 -o Col_WW_1_sorted.bam Col_WW_1.sam

# Sort alignment file for D26_NaCl sample
samtools sort -@ 40 -o D26_NaCl_sorted.bam D26_NaCl.sam

# Sort alignment file for D26_NS sample
samtools sort -@ 40 -o D26_NS_sorted.bam D26_NS.sam
