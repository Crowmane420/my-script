#!/bin/bash
#SBATCH --job-name=alignment
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --time=24:00:00
#SBATCH --output=%j.out
#SBATCH --error=%j.err

module load STAR

GENOME_DIR="/path/to/genome_index"
GENOME_FASTA="/path/to/genome.fa"
GENOME_GTF="/path/to/annotations.gtf"

# build STAR index
mkdir -p ${GENOME_DIR}
STAR --runMode genomeGenerate \
     --genomeDir ${GENOME_DIR} \
     --genomeFastaFiles ${GENOME_FASTA} \
     --sjdbGTFfile ${GENOME_GTF} \
     --sjdbOverhang 100 \
     --runThreadN 4

# Set input/output directories
indir="/media/goutham/B/TAIR_test/trimmed"
outdir="/media/goutham/B/TAIR_test/aligned"

# Set path to genome index files
genomeDir="/media/goutham/B/TAIR_test/genome_index"

# Align the reads to the genome using STAR
for file in ${indir}/*.fq
do
    # Extract the sample name from the file path
    sample=$(basename ${file} _1_paired.fq)
    
    # Align the paired-end reads using STAR
    STAR --runThreadN 4 \
         --genomeDir ${genomeDir} \
         --readFilesIn ${file} \
                      ${indir}/${sample}_2_paired.fq \
         --outFileNamePrefix ${outdir}/${sample}_ \
         --outSAMtype BAM SortedByCoordinate \
         --outSAMunmapped Within \
         --outSAMattributes Standard
done

