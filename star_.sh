STAR runMode genomeGenerate  --genomeFastaFiles genome.fna --sjdbGTFfile annotation.gtf --runThreadN 20 --outFileNamePrefix genome_index

STAR --genomeDir /home/goutham/Pd_Fs/GenomeDir/ --readFilesIn C-4-R1A_1.fq,C-4-R2A_1.fq,C-4-R3A_1.fq,Fs-4-R1A_1.fq,Fs-4-R2A_1.fq,Fs-4-R3A_1.fq,C-8-R1A_1.fq,C-8-R2A_1.fq,C-8-R3A_1.fq,Fs-8-R1A_1.fq,Fs-8-R2A_1.fq,Fs-8-R3A_1.fq,C-16-R1A_1.fq,C-16-R2A_1.fq,C-16-R3A_1.fq,Fs-16-R1A_1.fq,Fs-16-R2A_1.fq,Fs-16-R3A_1.fq C-4-R1A_2.fq,C-4-R2A_2.fq,C-4-R3A_2.fq,Fs-4-R1A_2.fq,Fs-4-R2A_2.fq,Fs-4-R3A_2.fq,C-8-R1A_2.fq,C-8-R2A_2.fq,C-8-R3A_2.fq,Fs-8-R1A_2.fq,Fs-8-R2A_2.fq,Fs-8-R3A_2.fq,C-16-R1A_2.fq,C-16-R2A_2.fq,C-16-R3A_2.fq,Fs-16-R1A_2.fq,Fs-16-R2A_2.fq,Fs-16-R3A_2.fq --outFileNamePrefix mapped  --outSAMtype BAM Unsorted --runThreadN 40

samtools sort mappedAligned.out.bam -o Aligned.sortedByCoord.out.bam

awk '$7 == "+" || $7 == "-" || $7 == "." { print }' annotation.gtf > output.gtf

htseq-count -s no -r pos -t exon -i gene_id -f bam Aligned.sortedByCoord.out.bam output.gtf > output_basename.counts


