#!/bin/bash

stringtie Col_NaCl_1_sorted.bam -G /media/goutham/B/D26/genes.gtf -o Col_NaCl_1.gtf -p 40

stringtie Col_WW_1_sorted.bam -G /media/goutham/B/D26/genes.gtf -o Col_WW_1.gtf -p 40

stringtie D26_NaCl_sorted.bam -G /media/goutham/B/D26/genes.gtf -o D26_NaCl.gtf -p 40

stringtie D26_NS_sorted.bam -G /media/goutham/B/D26/genes.gtf -o D26_NS.gtf -p 40

