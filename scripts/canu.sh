#!/bin/bash -l
#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 18:00:00
#SBATCH -J canu_akshai
#SBATCH --mail-type=ALL
#SBATCH --mail-user akshaips@gmail.com

# Load modules
module load bioinfo-tools
module load canu

# Your commands
canu  -p LeptospirillumT -d LT-mix  \
maxThreads=4 \
stopOnReadQuality=false​ \
genomeSize=2.5m \
-pacbio-raw /home/akshaips/genome_analysis/raw_data/DNA/ERR2028???.fastq.gz 
