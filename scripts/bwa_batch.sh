#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 16:00:00
#SBATCH -J BWA_samtools_htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user akshaips@gmail.com

# Load modules
module load bioinfo-tools
module load bwa
module load samtools
module load htseq

# Your commands
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036629_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036629_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2036629.txt
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036630_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036630_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2036630.txt
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036631_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036631_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2036631.txt
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036632_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036632_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2036632.txt
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036633_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2036633_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2036633.txt
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117288_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117288_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2117288.txt
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117289_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117289_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2117289.txt
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117290_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117290_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2117290.txt
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117291_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117291_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2117291.txt
bwa mem -t 8 ../index_file.fasta /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117292_P1.trim.fastq.gz /domus/h1/akshaips/genome_analysis/raw_data/RNA_trimmed_reads/ERR2117292_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_prokka_gff.gff > output_2117292.txt
