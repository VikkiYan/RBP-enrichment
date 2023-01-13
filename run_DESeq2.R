library("DESeq2")

sampleTable <- read.csv("sampleTable.csv")

countdata <- DESeqDataSetFromHTSeqCount(sampleTable, directory = ".", design = ~ group)
dds <- DESeq(countdata)
USP39OE_vs_control <- results(dds, contrast = c("group","8F39","8con"))
#transformed_data <- rlogTransformation(dds)

write.csv(USP39OE_vs_control,"USP39OE_vs_control.csv")
#write.csv(transformed_data,"normalized_counts.csv")