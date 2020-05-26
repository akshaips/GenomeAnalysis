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
