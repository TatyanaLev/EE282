#!/usr/bin/env bash

# a depthFile.txt is generated from running bioinfokit package (python script calculate_depth.py) on raw FASTQ files
# resulting depths.txt will be one column with as many depth entries as supplied FASTQ files and in the same order

python3 calculate_depth.py > depthsFile.txt

gawk '{print $6}' depthsFile.txt > depths.txt
