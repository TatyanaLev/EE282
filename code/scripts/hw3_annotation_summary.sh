#!/bin/bash

#This script downloads and summarizes a genome annotation file

wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/gff/dmel-all-r6.36.gff.gz
wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/gff/md5sum.txt

#verify file integrity
md5sum -c md5sum.txt

#count unique features in descending abundance order 
gawk '{print $3}' dmel-all-r6.36.gff | sort | uniq -c | sort -k1,1rn

#cound number of genes on each chromosome arm
gawk '$3 == "gene" {print $1}' dmel-all-r6.36.gff | gawk 'length <= 2'| grep -E '[XYLR4]$' | sort | uniq -c
