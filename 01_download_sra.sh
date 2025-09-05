#!/bin/bash

# Data stored here
mkdir -p data/raw_fastq 

# Download SRA files
while read sra; do
    echo "Downloading $sra..."
    prefetch $sra -O data/raw_fastq/$sra
done < sra_list.txt

