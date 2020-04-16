salloc -A g2020008 -p core -n 2 -t 01:00:00

module load bioinfo-tools
module load mummer
module load samtools

nucmer -maxmatch -nosimplify LeptospirillumT.contigs.fasta LeptospirillumT.contigs.fasta

show-coords -lrcTH out.delta > overlapping_coords.out

samtools faidx largest_contig.fasta tig00000001:1-2546870 > largest_contig_after_trimming.fasta
