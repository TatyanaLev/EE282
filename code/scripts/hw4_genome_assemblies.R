#!/usr/bin/env Rscript

png("lte_len.png")
hist(log(lte_len[,]), breaks = 50, main="Sequence Lengths in <= 100kb, Logarithmic")
dev.off()

png("lte_gc.png")
hist(lte_gc[,], breaks = 50, main="Sequence GC content in <= 100kb")
dev.off()

png("gr_len.png")
hist(log(gr_len[,]), breaks = 10, main="Sequence Lengths in > 100kb, Logarithmic")
dev.off()

png("gr_gc.png")
hist(gr_gc[,], breaks = 10, main="Sequence GC content in > 100kb")
dev.off()
