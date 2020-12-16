#!/usr/bin/env bash

# this script takes in a list of sample names in the s1_list.txt 
# and a list of VCFs generated with GATK's DiagnoseTargets

wkdir='/dfs4/som/tzhuravl/NavinRepr/'
brd='Breadth/'
Npass='Npasses.txt'

#this file contains aligned BAMs
f=/dfs4/som/tzhuravl/NavinRepr/s1_list.txt

while IFS="" read -r f || [ -n "$f" ]
do
	for i in $f; 
		do
	tail -n +474 $wkdir$brd$i$textext | awk '{print $7}' | grep "PASS" | wc -l >> $wkdir$brd$Npass
		done
done < /dfs4/som/tzhuravl/NavinRepr/s1_list.txt

cat intervals.list | wc -l > totalIntervals.txt

#then in R, do (Npass/totalIntervals)*100
