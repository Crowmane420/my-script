#!/bin/bash

# Set paths to required files
GENOME_INDEX="/media/goutham/B/Pd_fs_genome/genome_index"
GTF="/media/goutham/B/Pd_fs_genome/genome.gtf"

# Loop through all the samples
for DAY in 4 8 16; do
    for TREATMENT in C Fs; do
        for REPLICATE in 1 2 3; do
            PREFIX="/media/goutham/B/Test/${TREATMENT}-${DAY}-R${REPLICATE}A"
            R1="${PREFIX}_1.fq"
            R2="${PREFIX}_2.fq"
            SAM_OUTPUT="${TREATMENT}-${DAY}-R${REPLICATE}A.sam"
            BAM_OUTPUT="${TREATMENT}-${DAY}-R${REPLICATE}A.sorted.bam"
            
            # Align with HISAT2
            hisat2 -x $GENOME_INDEX -1 $R1 -2 $R2 -S $SAM_OUTPUT
            
            # Convert SAM to BAM and sort
            samtools view -bS $SAM_OUTPUT | samtools sort -o $BAM_OUTPUT
            
            # Optionally remove SAM file to save space
            rm $SAM_OUTPUT
            
            # Quantification (HTSeq-count)
            COUNT_OUTPUT="${TREATMENT}-${DAY}-R${REPLICATE}A.counts.txt"
            htseq-count -f bam -s no -r pos $BAM_OUTPUT $GTF > $COUNT_OUTPUT
        done
    done
done

