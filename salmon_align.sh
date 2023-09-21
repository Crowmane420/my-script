# Define the Salmon index location
index="salmon_index"

# Define the GTF file location
gtf_file="/media/goutham/B/Salmon/sequence.gff3"

# Define the list of conditions and days
conditions=("C" "Fs")
days=("4" "8" "16")

# Loop through each condition, day, and replicate to run Salmon
for cond in "${conditions[@]}"; do
    for day in "${days[@]}"; do
        for rep in {1..3}; do
            fwd_file="/media/goutham/B/Salmon/${cond}-${day}-R${rep}A_1.fq"
            rev_file="/media/goutham/B/Salmon/${cond}-${day}-R${rep}A_2.fq"
            output_dir="/media/goutham/B/Salmon/${cond}-${day}-R${rep}A_salmon_output"
            
            salmon quant -i $index -l A -1 $fwd_file -2 $rev_file -o $output_dir --geneMap $gtf_file
        done
    done
done

