salloc -A g2020008 -p core -n 2 -t 01:00:00

module load bioinfo-tools
module load prokka

prokka --prefix lferr --force --addgenes --genus Leptospirillum --species ferriphilum --strain DSM_14647 --gram neg --usegenus --proteins Leptospirillum --cpus 0 --rfam largest_contig_after_trimming.fasta
