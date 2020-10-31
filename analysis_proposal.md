### Data Quality Metrics Comparison - Analysis
In this project, I will compare various sequence data quality metrics between a published single-cell DNA-seq dataset (NCBI accession: SRA053195) and one generated in my lab, to understand why my data analysis has yielded inconclusive results. For data quality comparison, I need primary data files: FASTQ; aligned files: BAM; and a “stats” file that is automatically generated alongside the BAM. Half of the files I need for this project are ready for analysis (lab data) and the other half is currently being generated as I align the SRA fastq's. 

For each cell, the following QC metrics will be compared with the corresponding file types in parentheses and their purpose in italics: 
* average insert size (stats) -- _library quality_
* duplicate reads rate (stats) -- _library QC and sequence loading optimization_
* average Phred quality scores (stats) -- _sequencing quality_
* sequence depth (FASTQ) -- _sequencing loading optimization_
* sequence breadth (BAM) -- _library quality_

The data I need from the “stats” files is a number which appears following a certain string that I can grep for. To get sequence depth, I will use a package called “bioinfokit”, which outputs a file with sequence depths in the same order as the input FASTQs. Similarly, for sequence breadth, I will use GATK’s “DiagnoseTargets” on BAM files. Ultimately, I am after a number, for each of the 5 quality metrics, for each cell. To extract the corresponding numbers from input files, and write them to a final output file, I will write a bash script for each metric (5 scripts). I will not combine these scripts into one big script, because the input files aren't all available at the same time. There will be 10 files in the end: 5 lab and 5 SRA.

Once the 10 final files are written, I will analyze them in R. I will merge the 10 files into a single dataframe and perform several analyses/visualizations. First, I will create a boxplot for each metric to understand the distribution of the data. The boxplots side-by-side for lab vs SRA data may already be informative enough to see if there is a difference between the two datasets for each QC metric. I will additionally compare the means between lab vs. SRA quality metrics using Mann-Whitney _U_-test (Wilcoxon rank sum test). I will use this statistical test because my data is unpaired and I am not assuming normality. These analyses will show if our lab data quality differs significantly from published data.

In this data quality metrics analysis I hope to find out if the library and sequencing quality of our lab data is significantly different (worse) than a similar dataset that has been published. The analysis should further point to the specific problem, either in library preparation or sequencing that I can troubleshoot. If the datasets are comparable, then the problem lies in my downstream bioinformatics analysis, which I will need to troubleshoot afterwards.

