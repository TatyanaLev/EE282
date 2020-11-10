#!/bin/bash

#This script downloads and summarizes a genome assembly file

wget ftp://ftp.flybase.net/releases/FB2020_05/dmel_r6.36/fasta/dmel-all-chromosome-r6.36.fasta.gz
wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/current/fasta/md5sum.txt

#verify file integrity
md5sum -c md5sum.txt

#summarize 
faSize dmel-all-chromosome-r6.36.fasta
