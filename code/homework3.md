### Homework3
#### Genome assembly

The _Drosophila melanogaster_ genome assembly and checksum file were downloaded from flybase.org and assembly file integrity was confirmed with the following success message:

```bash
dmel-all-chromosome-r6.36.fasta.gz: OK
```
##### Summary
The assembly was summarized with `faSize` which reveals that: 
1. Total number of nucleotides (bases) = 143,726,002
2. Total number of Ns (unknown bases) = 1,152,978
3. Total number of sequences = 1,870

[hw3_genome_summary.sh](https://github.com/TatyanaLev/EE282/tree/homework3/code/scripts/hw3_genome_summary.sh)

***

#### Annotation file

The _Drosophila melanogaster_ GFF file (GTF) and checksum file were downloaded from flybase.org, and annotation file integrity was confirmed with the following success message:
```bash
dmel-all-r6.36.gff.gz: OK
```

##### Summary
The unique features, in descending abundance order are:

```bash
16820053 match_part
6814284 match
1803110 
1403581 orthologous_to
 254584 oligonucleotide
 240700 TF_binding_site
 204198 polyA_site
 181247 polypeptide_region
 149458 paralogous_to
 133643 RNAi_reagent
 116053 CDS
  85432 exon
  71909 intron
  71483 exon_junction
  70795 transposable_element_insertion_site
  50389 BAC_cloned_genomic_insert
  48404 region
  43461 transcription_start_site
  38554 five_prime_UTR
  30728 mRNA
  30728 protein
  28721 three_prime_UTR
  25008 regulatory_region
  18671 orthologous_region
  17875 gene
  14095 pcr_product
  11148 oligo
   9739 breakpoint
   9042 repeat_region
   8062 origin_of_replication
   7683 insulator
   6465 point_mutation
   5728 chromosome_band
   5578 transposable_element
   3047 ncRNA
   2339 deletion
   2004 modified_RNA_base_feature
   1870 1
   1870 golden_path_region
   1401 protein_binding_site
    978 syntenic_region
    904 insertion_site
    828 rescue_fragment
    696 complex_substitution
    537 silencer
    485 miRNA
    366 pseudogene
    312 tRNA
    300 snoRNA
    262 pre_miRNA
    246 tandem_repeat
    115 rRNA
    103 enhancer
     95 sequence_variant
     32 snRNA
     22 uncharacterized_change_in_nucleotide_sequence
      7 mature_peptide
      1 DNA_motif
      1 r6.36
```
The number of genes on each chromosome arm:

```bash
   3516 2L
   3653 2R
   3486 3L
   4225 3R
    114 4
   2691 X
    113 Y
```
[hw3_annotation_summary.sh](https://github.com/TatyanaLev/EE282/tree/homework3/code/scripts/hw3_annotation_summary.sh)
