library(DESeq2)
library(ggplot2)

countData <- read.csv('all_bio_replicates_sum.csv', header = TRUE, sep = ",")
head(countData)

metaData <- read.csv('all_bio_replicates_metadata.csv', header = TRUE, sep = ",")
head(metaData)

dds <- DESeqDataSetFromMatrix(countData=countData, 
                              colData=metaData, 
                              design=~dex, tidy = TRUE)

dds

# dds <- dds[rowSums(counts(dds)) >= 10,] 

dds <- DESeq(dds)

res <- results(dds, contrast = c("dex", "LET.1", "MEF"))
res
head(results(dds, tidy=TRUE)) #let's look at the results table
summary(res) #summary of results

res0.01 <- results(dds, alpha = 0.01)
summary(res0.01) #summary of results

resultsNames(dds)

plotMA(res0.01)

res <- res[order(res$padj),]
head(res)
plotDispEsts(dds)

plotCounts(dds, gene="ATCCTTCGGGTGCAAGG", intgroup="dex")

#reset par
par(mfrow=c(1,1))
# Make a basic volcano plot
with(res, plot(log2FoldChange, -log10(padj), pch=20, main="Volcano plot", xlim=c(-3,3)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(res, padj<.01 ), points(log2FoldChange, -log10(padj), pch=20, col="blue"))
with(subset(res, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(padj), pch=20, col="red"))

#First we need to transform the raw count data
#vst function will perform variance stabilizing transformation
vsdata <- vst(dds, blind=FALSE)

plotPCA(vsdata, intgroup="dex") #using the DESEQ2 plotPCA fxn we can

plotMA(res)

hist(res$pvalue, breaks=20, col="grey")
hist(res$padj, breaks=20, col="grey")

library(dplyr)
res1 <- as.data.frame(res)
res1 <- mutate(res1, sig=ifelse(res1$padj<0.05, "Sig", "Not Sig"))
res1[which(abs(res1$log2FoldChange)<1.0), "sig"] = "Not Sig"

library(ggplot2)
ggplot(res1, aes(log2FoldChange, -log10(padj))) + geom_point(aes(col=sig)) + scale_color_manual(values=c("red", "black"))
