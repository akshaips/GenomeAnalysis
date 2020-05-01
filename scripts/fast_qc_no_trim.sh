#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J fastqc_notrim
#SBATCH --mail-type=ALL
#SBATCH --mail-user akshaips@gmail.com

# Load modules
module load bioinfo-tools
module load FastQC/0.11.8

# Your commands
fastqc -o results_no_trim -f fastq -t 4 /domus/h1/akshaips/genome_analysis/raw_data/RNA/*
