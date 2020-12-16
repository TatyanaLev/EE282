#!/usr/bin/env bash

# average Phred quality is extracted from a stats file which is generated with samtools stats while aligning FASTQs into BAM
# resulting quals.txt consists of one column with as many quality entries as supplied stats files and in the same order

grep "average quality" [ahn]*/dup*h.all_stat.txt | gawk '{print $4}' > quals.txt
