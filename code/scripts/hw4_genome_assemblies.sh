#!/usr/bin/env bash
conda activate ee282

#summarizing partitions of a genome
#partitioning
bioawk -c fastx ' length($seq) <= 100000 { print ">" $name "\n" $seq } ' dmel-all-chromosome-r6.36.fasta > dmel_less_eq.fa
bioawk -c fastx ' length($seq) > 100000 { print ">" $name "\n" $seq } ' dmel-all-chromosome-r6.36.fasta > dmel_greater.fa

#getting summaries
faSize dmel_less_eq.fa
faSize dmel_greater.fa

#sequence distributions
bioawk -c fastx ' { print length($seq) } ' dmel_less_eq.fa | sort -k1,1rn > dmel_less_eq_len.txt
bioawk -c fastx ' { print gc($seq) } ' dmel_less_eq.fa | sort -k1,1rn > dmel_less_eq_gc.txt
bioawk -c fastx ' { print length($seq) } ' dmel_greater.fa | sort -k1,1rn > dmel_greater_len.txt
bioawk -c fastx ' { print gc($seq) } ' dmel_greater.fa | sort -k1,1rn > dmel_greater_gc.txt

plotCDF <(cut -f 1 dmel_less_eq_lengc.txt) dmel_less_eq_lengc.png

#MinION

#download files
wget https://hpc.oit.uci.edu/~solarese/ee282/iso1_onp_a2_1kb.fastq.gz

#map
minimap -t 32 -Sw5 -L100 -m0 iso1_onp_a2_1kb.fastq{,} > iso1_onp_a2_1kb.paf

#assemble
miniasm -f iso1_onp_a2_1kb.fastq iso1_onp_a2_1kb.paf > iso1_onp_a2_1kb.gfa

#process into FASTA
awk ' $0 ~/^S/ { print ">" $2" \n" $3 } ' iso1_onp_a2_1kb.gfa \
| tee >(n50 /dev/stdin > n50.txt) \
| fold -w 60 \
> unitigs.fa

#n50
n50 () {
  bioawk -c fastx ' { print length($seq); n=n+length($seq); } END { print n; } ' $1 \
  | sort -rn \
  | gawk ' NR == 1 { n = $1 }; NR > 1 { ni = $1 + ni; } ni/n > 0.5 { print $1; exit; } '
}

#Assemblies for comparison
r6url="https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/215/GCA_000001215.4_Release_6_plus_ISO1_MT/GCA_000001215.4_Release_6_plus_ISO1_MT_genomic.fna.gz"

trusequrl="https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/705/575/GCA_000705575.1_D._melanogaster_TruSeq_synthetic_long-read_assembly/GCA_000705575.1_D._melanogaster_TruSeq_synthetic_long-read_assembly_genomic.fna.gz"

wget -O - -q $r6url \
| tee >( \
  bioawk -c fastx ' { print length($seq) } ' \
  | sort -rn \
  | awk ' BEGIN { print "Assembly\tLength\nFB_Scaff\t0" } { print "FB_Scaff\t" $1 } ' \
  > r6scaff_l.txt & ) \
| faSplitByN /dev/stdin /dev/stdout 10 \
| bioawk -c fastx ' { print length($seq) } ' \
| sort -rn \
| awk ' BEGIN { print "Assembly\tLength\nFB_Ctg\t0" } { print "FB_Ctg\t" $1 } ' \
> r6ctg_l.txt &

cat ~/dmel_all/hw4/unitigs.fa \
| bioawk -c fastx ' { print length($seq) } ' \
| sort -rn \
| awk ' BEGIN { print "Assembly\tLength\nminion\t0" } { print "minion\t" $1 } ' \
> minion_l.txt &

plotCDF2 *_l.txt assemblies_CDF2.png 

#BUSCO
busco -c 32 -i unitigs.fa -l diptera_odb10 -o minion_busco -m genome
busco -c 32 -i ISO1.r6.scaff.fa -l diptera_odb10 -o scaff_busco -m genome
busco -c 32 -i ISO1.truseq.ctg.fa -l diptera_odb10 -o contig_busco -m genome
