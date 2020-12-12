### Homework4

##### Summarizing partitions of a genome

##### <= 100kb

1. Total number of nucleotides: 6178042
2. Total number of Ns: 662593
3. Total number of sequences: 1863

##### > 100kb

1. Total number of nucleotides: 137547960
2. Total number of Ns: 490385
3. Total number of sequences: 7

#### Plotting distributions, CDF

##### <= 100kb

1. Sequence length distribution is centered around e^7. The image shows natural-log scale instead of base 10. There is a long tail, with longer sequences than e^7, but these are less abundant.

[lte_len.png](https://github.com/TatyanaLev/EE282/blob/homework4/output/figures/lte_len.png)

2. Sequence GC% distribution is centered around 0.3 to 0.4, so GC content is not high.

[lte_gc.png](https://github.com/TatyanaLev/EE282/blob/homework4/output/figures/lte_gc.png)

3. Cumulative sequence size sorted from largest to smallest sequences. As sequences get smaller, the curve gradually goes up. Because we selected for the smaller than 100kb sequences, we are working with all the small ones, so there is no sharp rise in the curve.

[less_eq_len_CDF.png](https://github.com/TatyanaLev/EE282/blob/homework4/output/figures/less_eq_len_CDF.png)

##### > 100kb

There are only 7 sequences here, histograms look odd at times...

1. Sequence length distribution ranges from 32Mb to 1Mb. Again the plot is on a natural-log scale, but shows that the longer sequences are more abundant.

[gr_len.png](https://github.com/TatyanaLev/EE282/blob/homework4/output/figures/gr_len.png)

2. Sequence GC% distribution. GC content ranges from around 0.3 to 0.4, same as in the short sequences.

[gr_gc.png](https://github.com/TatyanaLev/EE282/blob/homework4/output/figures/gr_gc.png)

3. Cumulative sequence size sorted from largest to smallest sequences. The curve rises sharply, because all the sequences are large.

[greater_len_CDF.png](https://github.com/TatyanaLev/EE282/blob/homework4/output/figures/greater_len_CDF.png)

#### MinION genome assembly

The MinION assembly was made as layed out in the Assembly.html tutorial.

##### Assembly assessment

1. **N50:** The [N50](https://github.com/TatyanaLev/EE282/blob/homework4/output/reports/n50.txt) was calculated with the code provided in Assembly.html tutorial. The N50 for the MinION assembly is 4494246 (~4.5Mb), while the _Drosophila_ community reference N50 is >20Mb for both the scaffold and contig assemblies.
2. **Contiguity:** The contiguity of the MinION assembly is better than the contigs obtained from FlyBase, but worse than the scaffold. The [assemblies_CDF2.png](https://github.com/TatyanaLev/EE282/blob/homework4/output/figures/assemblies_CDF2.png) shows the MinION curve below that of the scaffold, but above the contig. The labels are switched for the flybase curves.  
3. **BUSCO:** Busco scores were calculated against _diptera_odb10_. The MinION assembly was found to have 7 complete, single-copy buscos and 66 fragmented ones.  

[C:0.2%[S:0.2%,D:0.0%],F:2.0%,M:97.8%,n:3285](https://github.com/TatyanaLev/EE282/blob/homework4/output/reports/short_summary.specific.diptera_odb10.minion_busco.txt). These results are not great, compared to the flybase contig assembly below.

The flybase scaffold has 3268 buscos of which 3254 are single-copy. Very few are fragmented. 

[C:99.5%[S:99.1%,D:0.4%],F:0.2%,M:0.3%,n:3285](https://github.com/TatyanaLev/EE282/blob/homework4/output/reports/short_summary.specific.diptera_odb10.scaff_busco.txt)

The TrueSeq Contig assembly has 3255 complete BUSCOs of which 3192 are single-copy, and again few are fragmented.

[C:99.1%[S:97.2%,D:1.9%],F:0.3%,M:0.6%,n:3285](https://github.com/TatyanaLev/EE282/blob/homework4/output/reports/short_summary.specific.diptera_odb10.contig_busco.txt). 

###### bash script:
[hw4_genome_assemblies.sh](https://github.com/TatyanaLev/EE282/tree/homework4/code/scripts/hw4_genome_summary.sh)

###### R script:
[hw4_genome_assemblies.R](https://github.com/TatyanaLev/EE282/tree/homework4/code/scripts/hw4_genome_summary.sh)
