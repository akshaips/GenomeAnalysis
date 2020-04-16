salloc -A g2020008 -p core -n 2 -t 01:00:00
module load bioinfo-tools
module load quast
quast.py LeptospirillumT.contigs.fasta -R OBMB01.fasta -t 4
