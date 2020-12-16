#!/usr/bin/env Rscript

br_N <- read.table("breadths_Navin.txt", sep = '\t', header = F)
dp_N <- read.table("depths_Navin.txt", sep = '\t', header = F)
q_N <- read.table("quals_Navin.txt", sep = '\t', header = F)
dup_N <- read.table("duplicates_Navin.txt", sep = '\t', header = F)
br_l <- read.table("breadths_lab.txt", sep = '\t', header = F)
dp_l <- read.table("depths_lab.txt", sep = '\t', header = F)
q_l <- read.table("quals_lab.txt", sep = '\t', header = F)
dup_l <- read.table("duplicates_lab.txt", sep = '\t', header = F)

allQC <- cbind(br_N, dp_N, q_N, dup_N, br_l, dp_l, q_l, dup_l)

NavinData <- allQC[1:32,1:4]
head(NavinData)

labData <- allQC[1:32,5:8]
head(labData)

#Breadth 5X
breadthNavin <- NavinData[,1]
breadthLab <- labData[,1]
breadths <- as.data.frame(cbind(breadthNavin, breadthLab))

boxplot(breadths)

breadthU <- wilcox.test(breadthNavin, breadthLab, alternative = "two.sided")
breadthU

#Depth
depthNavin <- NavinData[,2]
depthLab <- labData[,2]
depths <- as.data.frame(cbind(depthNavin, depthLab))

boxplot(depths)

depthU <- wilcox.test(depthNavin, depthLab, alternative = "two.sided")
depthU

#Average Quality
qualNavin <- NavinData[,3]
qualLab <- labData[,3]
quals <- as.data.frame(cbind(qualNavin, qualLab))

boxplot(quals)

qualU <- wilcox.test(qualNavin, qualLab, alternative = "two.sided")
qualU

#Duplicate rate / sequencing saturation
dupNavin <- NavinData[,4]
dupLab <- labData[,4]
dups <- as.data.frame(cbind(dupNavin, dupLab))

boxplot(dups)

dupU <- wilcox.test(dupNavin, dupLab, alternative = "two.sided")
dupU
