#!/bin/bash

output_dir="/media/goutham/B/Root"

# Control samples (C)
samples_c=("C-4-R1A" "C-4-R2A" "C-4-R3A" "C-8-R1A" "C-8-R2A" "C-8-R3A" "C-16-R1A" "C-16-R2A" "C-16-R3A")

# Treatment samples (Fs)
samples_fs=("Fs-4-R1A" "Fs-4-R2A" "Fs-4-R3A" "Fs-8-R1A" "Fs-8-R2A" "Fs-8-R3A" "Fs-16-R1A" "Fs-16-R2A" "Fs-16-R3A")

# Loop through control samples
for sample in "${samples_c[@]}"; do
    sam="${output_dir}/${sample}.sam"
    sorted_bam="${output_dir}/${sample}.sorted.bam"
    
    samtools sort -@ 40 -o "${sorted_bam}" "${sam}"
done

# Loop through treatment samples
for sample in "${samples_fs[@]}"; do
    sam="${output_dir}/${sample}.sam"
    sorted_bam="${output_dir}/${sample}.sorted.bam"
    
    samtools sort -@ 40 -o "${sorted_bam}" "${sam}"
done

