#!/bin/bash

# Convert to FASTQ 
# Use fasterq-dump instaed of fastq-dump on accession
# Much faster, multi-threaded, Optimized, split into _1 and _2 automatically
while read sra; do
    echo "Converting $sra to FASTQ..."
    fasterq-dump  data/raw_fastq/$sra/$sra -O data/raw_fastq --split-files --threads 4 
    rm -rf data/raw_fastq/$sra  # Remove SRA file to save space
done < sra_list.txt


#gzip fastq files
mkdir -p data/fastq
for f in data/raw_fastq/*_*.fastq; do pigz -p 4 "$f"; done
# move gz files to data/fastq
mv data/raw_fastq/*.fastq.gz data/fastq/
