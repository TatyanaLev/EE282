# duplicate reads rate is extracted from a stats file which is generated with samtools stats while aligning FASTQs into BAM
# resulting duplicates.txt consists of one column with as many duplicate entries as supplied stats files and in the same order

gawk 'FNR == 8 {print $7}' [anh]*/dup*.txt > duplicates.txt
