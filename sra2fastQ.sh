#!/bin/bash

# Convert to FASTQ 
# Use fasterq-dump instaed of fastq-dump on accession
# Much faster, multi-threaded, Optimized, split into _1 and _2 automatically
while read sra; do
    echo "Converting $sra to FASTQ..."
    fasterq-dump  data/raw_fastq/$sra/$sra -O data/raw_fastq --split-files --threads 4 
    rm -rf data/raw_fastq/$sra  # Remove SRA file to save space
done < sra_list.txt
