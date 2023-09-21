#!/bin/bash

output_dir="/media/goutham/B/Root/normalized_gtf"
gtf_file="/media/goutham/B/Root/output_file.gff"

# Control samples (C)
samples_c=("C-4-R1A" "C-4-R2A" "C-4-R3A" "C-8-R1A" "C-8-R2A" "C-8-R3A" "C-16-R1A" "C-16-R2A" "C-16-R3A")

# Treatment samples (Fs)
samples_fs=("Fs-4-R1A" "Fs-4-R2A" "Fs-4-R3A" "Fs-8-R1A" "Fs-8-R2A" "Fs-8-R3A" "Fs-16-R1A" "Fs-16-R2A" "Fs-16-R3A")

# Loop through control samples
for sample in "${samples_c[@]}"; do
    sorted_bam="${output_dir}/${sample}.sorted.bam"
    output_gtf="${output_dir}/${sample}.gtf"
    
    stringtie "${sorted_bam}" -G "${gtf_file}" --normalize_reads -o "${output_gtf}"
done

# Loop through treatment samples
for sample in "${samples_fs[@]}"; do
    sorted_bam="${output_dir}/${sample}.sorted.bam"
    output_gtf="${output_dir}/${sample}.gtf"
    
    stringtie "${sorted_bam}" -G "${gtf_file}" --normalize_reads -o "${output_gtf}"
done

