salloc -A g2020008 -p core -n 2 -t 01:00:00

module load bioinfo-tools
module load prokka

prokka --prefix lferr --addgenes --genus Leptospirillum --species ferriphilum --strain DSM_14647 --gram neg --usegenus --proteins Leptospirillum --rfam largest_contig_after_trimming.fasta --force --cpus 0
