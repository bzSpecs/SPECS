library(ggplot2)
library(ggfortify)
library(tidyverse)
library(edgeR)
library(NOISeq)
data(Marioni)

pca <- function(df, base_groups) {
  df_tras <- as.data.frame(t(df))
  pca_res <- prcomp(df_tras, scale. = TRUE)
  df_tras$groups <- base_groups
  #autoplot(pca_res, data = df_tras, colour = 'groups')
  autoplot(pca_res, data = df_tras, colour = 'groups', label = TRUE, label.size = 3)
}

filter_low_reads <- function(df, filter_num) {
  output <- df %>% filter_all(all_vars(.> filter_num))
  return (output)
}



countData <- read.csv('all_replicates_sum.csv', header = TRUE, sep = ",")
head(countData)

only_tech_df = countData[, grepl("unique_17|tech", names(countData))]
head(only_tech_df)

only_bio_df = countData[, !grepl("tech", names(countData))]
head(only_bio_df)


rownames(only_bio_df) <- only_bio_df$unique_17
only_bio_df$unique_17 <- NULL
only_bio_filtered <- filter_low_reads(only_bio_df, 10)

log_cpm_df <- cpm(only_bio_filtered, log = TRUE)
head(log_cpm_df)

pca_groups <- colnames(log_cpm_df) %>% map(function(x) { return (substring(x, 0, unlist(gregexpr(pattern ='_', x))[1]-1)) }) %>% unlist()
pca_groups
pca(norm_df, pca_groups)

boxplot(norm_df)

#NOISeq
analyse <- function(countData, condition_1, condition_2, threshold) {
  pattern <- paste("unique_17", condition_1, condition_2, sep = "|")
  picked_df = countData[, grepl(pattern, names(countData))]
  picked_df = picked_df[, grepl("unique_17|tech", names(picked_df))]
  rownames(picked_df) <- picked_df$unique_17
  picked_df$unique_17 <- NULL
  head(picked_df)
  
  cell_types <- colnames(picked_df) %>% map(function(x) { return (substring(x, 0, unlist(gregexpr(pattern ='_', x))[1]-1)) }) %>% unlist()
  runs <- colnames(picked_df) %>% map(function(x) { return (substring(x, 0, unlist(gregexpr(pattern ='_', x))[2]-1)) }) %>% unlist()
  myfactors <- data.frame(cell_types, runs)
  colnames(myfactors) <- c("cell_type", "run")
  rownames(myfactors) <- colnames(picked_df)
  
  # myfilt = filtered.data(picked_df, factor = myfactors$cell_type, norm = FALSE, method = 1)
  # myRPKM = rpkm(picked_df, long = 1000, k = 0)
  # head(myRPKM)
  # myRPKM["CTCTCTTGTCCCGCGAT",]
  
  mydata <- readData(data = picked_df, factors = myfactors)
  
  # mycountsbio = dat(mydata, factor = NULL, type = "countsbio")
  # explo.plot(mycountsbio, samples = NULL, plottype = "barplot")
  # head(assayData(mydata)$exprs)
  
  
  # mydata2corr1 = ARSyNseq(mydata, factor = "run", batch = FALSE, norm = "rpkm", logtransf = FALSE)
  # myPCA = dat(mydata2corr1, type = "PCA")
  # explo.plot(myPCA, factor = "cell_type")
  # explo.plot(myPCA, factor = "run")
  
  mynoiseq = noiseq(mydata, k = 0.5, norm = "rpkm", factor = "cell_type", replicates = "technical")
  # head(mynoiseq@results[[1]][order(mynoiseq@results[[1]]$ranking, decreasing = TRUE),])
  
  mynoiseq.deg2 = degenes(mynoiseq, q = threshold, M = "up")
  # head(mynoiseq.deg2)
  # DE.plot(mynoiseq, q = 0.7, graphic = "MD")
  # DE.plot(mynoiseq, q = 0.7, graphic = "expr", log.scale = TRUE)
  
  return (mynoiseq.deg2)
}

run_expirement <- function(countData, condition_1, condition_2, threshold) {
  res = analyse(countData, condition_1, condition_2, threshold)
  output_file <- paste(gsub("\\.", "-", condition_1),gsub("\\.", "-", condition_2),"DE",gsub("\\.", "", threshold),"threshold", sep = "_")
  write.csv(mynoiseq.deg2, paste(output_file, "csv", sep = "."))
}

run <- function(countData, threshold) {
  run_expirement(countData, "CD4", "H7", threshold)
  run_expirement(countData, "CD4", "RL", threshold)
  run_expirement(countData, "CD4", "DS", threshold)
  run_expirement(countData, "CD4", "U2", threshold)
  run_expirement(countData, "CD4", "MC.CAR", threshold)
  run_expirement(countData, "CD4", "NCI", threshold)
  run_expirement(countData, "CD4", "HT.1080", threshold)
  run_expirement(countData, "CD8", "H7", threshold)
  run_expirement(countData, "CD8", "RL", threshold)
  run_expirement(countData, "CD8", "DS", threshold)
  run_expirement(countData, "CD8", "U2", threshold)
  run_expirement(countData, "CD8", "MC.CAR", threshold)
  run_expirement(countData, "CD8", "NCI", threshold)
  run_expirement(countData, "CD8", "HT.1080", threshold)
}

threshold <- 0.65
run(countData, threshold)
