for DAY in 4 8 16; do
    for TREATMENT in C Fs; do
        for REPLICATE in 1 2 3; do
            BAM_OUTPUT="/media/goutham/B/Pd_fs_root/${TREATMENT}-${DAY}-R${REPLICATE}A.sorted.bam"
            samtools index $BAM_OUTPUT
        done
    done
done

