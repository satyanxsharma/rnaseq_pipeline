#!/bin/bash

mkdir -p results/fastqc_trimmed
for s in SRR8571929 SRR8571930 SRR8571931; do
  fastp \
    -i data/fastq/${s}_1.fastq.gz \
    -I data/fastq/${s}_2.fastq.gz \
    -o results/fastqc_trimmed/${s}_1.trim.fastq.gz \
    -O results/fastqc_trimmed/${s}_2.trim.fastq.gz \
    -h results/fastqc_trimmed/${s}_fastp.html \
    -j results/fastqc_trimmed/${s}_fastp.json \
    -w 4
done

# Quick QC of trimmed reads
fastqc -t 4 -o results/fastqc_trimmed results/trimmed/*trim.fastq.gz
multiqc -o results/fastqc_trimmed results/fastqc_trimmed
