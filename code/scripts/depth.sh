# a depthFile.txt is generated from running bioinfokit (python) on raw FASTQ files
# resulting depths.txt will be one column with as many depth entries as supplied FASTQ files and in the same order

gawk '{print $6}' depthsFile.txt > depths.txt
