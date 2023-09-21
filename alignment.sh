#!/bin/bash

hisat2 -x /media/goutham/B/D26/genome_index -1 /media/goutham/B/D26/Col_NaCl_1_1_paired.fq -2 /media/goutham/B/D26/Col_NaCl_1_2_paired.fq -S Col_NaCl_1.sam -p 40

hisat2 -x /media/goutham/B/D26/genome_index -1 /media/goutham/B/D26/Col_WW_1_1_paired.fq -2 /media/goutham/B/D26/Col_WW_1_2_paired.fq -S Col_WW_1.sam -p 40

hisat2 -x /media/goutham/B/D26/genome_index -1 /media/goutham/B/D26/D26_NaCl_1_paired.fq -2 /media/goutham/B/D26/D26_NaCl_2_paired.fq -S D26_NaCl.sam -p 40

hisat2 -x /media/goutham/B/D26/genome_index -1 /media/goutham/B/D26/D26_NS_1_paired.fq -2 /media/goutham/B/D26/D26_NS_2_paired.fq -S D26_NS.sam -p 40

