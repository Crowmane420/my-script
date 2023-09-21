# Trimming for all paired-end files
mkdir /media/goutham/B/TAIR_test/trimmed
for file in /media/goutham/B/TAIR_test/*_1.fq
do
    base=$(basename $file _1.fq)
    TrimmomaticPE -threads 4 /media/goutham/B/TAIR_test/${base}_1.fq /media/goutham/B/TAIR_test/${base}_2.fq /media/goutham/B/TAIR_test/trimmed/${base}_1_paired.fq /media/goutham/B/TAIR_test/trimmed/${base}_1_unpaired.fq /media/goutham/B/TAIR_test/trimmed/${base}_2_paired.fq /media/goutham/B/TAIR_test/trimmed/${base}_2_unpaired.fq ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
