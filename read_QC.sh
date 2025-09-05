#!/bin/bash

# Run FastQC on all fastq files and aggregate:

mkdir -p results/fastqc
fastqc -t 4 -o results/fastqc data/fastq/*_*.fastq.gz
multiqc -o results/fastqc results/fastqc
