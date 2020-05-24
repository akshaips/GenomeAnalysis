 
# R script for doing the RNA expression analysis
# Requires having made two files, count_table.csv with the counts for each gene in each condition and
# column_data.csv with information on each condition.  For plotting the results, you also need the plot_table file. 

library(DESeq2)
library(ggplot2)

coldata_loc = "condition_table.csv"
table_loc = "count_table.csv"

cts = as.matrix(read.csv(table_loc,sep=",", row.names = "gene_id"))
coldata = read.csv(coldata_loc, row.names = 1)
coldata <- coldata[,c("condition","type")]

dds <- DESeqDataSetFromMatrix(countData = cts,
                               colData = coldata,
                               design = ~ condition)

dds <- DESeq(dds)
res <- results(dds, contrast = c("condition", "bioreactor", "Mineral_leaching"))

reslfc = lfcShrink(dds, coef = "condition_Mineral_leaching_vs_bioreactor", type = "apeglm")

resOrdered <- res[order(res$pvalue),]
summary(res)

vsd = vst(dds)
plotPCA(vsd, intgroup=c("condition", "type"))