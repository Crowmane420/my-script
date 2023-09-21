#!/bin/bash

# Load required modules
module load STAR

# Set variables for input and output directories/files
genome_dir="/media/goutham/B/TAIR_test/genome_index"
genome_fasta="/media/goutham/B/TAIR_test/genome.fa"
annotations_gtf="/media/goutham/B/TAIR_test/genes.gtf"
trimmed_dir="/media/goutham/B/TAIR_test/trimmed"
aligned_dir="/media/goutham/B/TAIR_test/aligned"

# Align trimmed reads to the genome
for file in "$trimmed_dir"/*_paired.fq
do
    prefix="$(basename $file _paired.fq)"
    STAR --runThreadN 40 --genomeDir "$genome_dir" --readFilesIn "$trimmed_dir"/"${prefix}"_paired.fq --outFileNamePrefix "$aligned_dir"/"$prefix" --outSAMtype BAM SortedByCoordinate --outSAMunmapped Within --outSAMattributes Standard
done

