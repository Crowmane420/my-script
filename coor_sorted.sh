
# Create a directory for sorted BAMs
mkdir sorted_bams

# Sort and index each BAM file
for bam in *Aligned.out.bam; do
    # Sort the BAM file
    samtools sort -@ 40 -o sorted_bams/${bam%.bam}.sorted.bam $bam
    
    # Index the sorted BAM file
    samtools index sorted_bams/${bam%.bam}.sorted.bam
done

