#!/bin/bash

# Set path to the GTF annotation file
GTF="/media/goutham/B/Pd_fs_genome/genome.gtf"

# Loop through all the samples
for DAY in 4 8 16; do
    for TREATMENT in C Fs; do
        for REPLICATE in 1 2 3; do
            BAM_OUTPUT="/media/goutham/B/Pd_fs_root/${TREATMENT}-${DAY}-R${REPLICATE}A.sorted.bam"
            COUNT_OUTPUT="/media/goutham/B/Pd_fs_root/${TREATMENT}-${DAY}-R${REPLICATE}A.counts.txt"
            
            # Quantification (HTSeq-count)
            htseq-count -f bam -s no -r pos $BAM_OUTPUT $GTF > $COUNT_OUTPUT
        done
    done
done

