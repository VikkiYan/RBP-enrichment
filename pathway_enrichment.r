library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)
library(ggplot2)

df_deseq2_OE_vs_con <- read.csv("USP39OE_vs_control.csv")

gene_map <- select(org.Hs.eg.db,
    keys = df_deseq2_OE_vs_con$X,
    keytype = "ENSEMBL", columns = c("ENTREZID", "SYMBOL"))
colnames(df_deseq2_OE_vs_con)[1] <- "ENSEMBL"
df_all_OE_vs_con <- merge(df_deseq2_OE_vs_con,
    gene_map, by = "ENSEMBL", all = FALSE)
df_sorted_OE_vs_con <- df_all_OE_vs_con[
    order(df_all_OE_vs_con$stat, decreasing = TRUE),]
gene_stat_OE_vs_con <- df_sorted_OE_vs_con$stat
names(gene_stat_OE_vs_con) <- df_sorted_OE_vs_con$ENTREZID
gene_stat_OE_vs_con <- na.omit(gene_stat_OE_vs_con)
KEGG_enrichment_OE_vs_con <- gseKEGG(gene_stat_OE_vs_con, organism = "hsa")

jpeg(filename = "OE_vs_con.png", width = 2400, height = 2400)
dotplot(KEGG_enrichment_OE_vs_con, split = ".sign", font.size = 60) +
facet_grid(~.sign) + scale_size(range = c(5, 40)) +
labs(title = "KEGG pathways enriched, K431R vs control") + theme(
    legend.text = element_text(size = 60),
    legend.title = element_text(size = 60),
    legend.key.width = unit(50, "pt"),
    legend.key.height = unit(100, "pt"),
    title = element_text(size = 60),
    strip.text = element_text(size = 60))
dev.off()