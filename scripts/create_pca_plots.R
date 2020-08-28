#Import necessary libraries
library(data.table)
library(dplyr)
library(ggplot2)

#Read in fam file and add column names
fam<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_orderedby_ASN_CEU_YRI.fam") %>% select (V1,V2,V3)
colnames(fam)<-c("pop", "FID", "IID")

#Read in pcs (king output)
pcs <- fread("/home/ashley/LCL_chemotherapy/ALL/ALL_PCA/kingpc.txt")

#Join fam and pcs to reorder pcs and add pop 
pcdf <- left_join(fam, pcs)

#Make covariate file for gemma input
covariates<-select(pcdf, 8:17)
fwrite(covariates, "/home/ashley/LCL_chemotherapy/ALL/ALL_covariates.txt", col.names = F, sep = "\t")

#Create vector with eigen values (they appear in output process as king runs pca, no file produced)
eval<-c(2206.37, 1655.92, 491.55, 468.26, 380.01, 369.98, 348.94, 343.41, 340.54, 339.70)

#Calcuate proportion variance explained by each PC:
eval<-round(eval/sum(eval),3)
eval<-cbind.data.frame(eval,c(1,2,3,4,5,6,7,8,9,10))
colnames(eval)<-c("percent_var", "PC")

#Make PCA plots:
pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_PCA/ALL_PCA_plots_king.pdf")

#Scree Plot
ggplot(data=eval, aes(x=PC, y=percent_var)) + geom_point() + geom_line() + scale_x_continuous(breaks = 1:10) + ggtitle("Proportion of variance explained")

#PCA Plot 1 (PC1 vs PC2)
ggplot() + geom_point(data=pcdf,aes(x=PC1,y=PC2,col=pop,shape=pop)) + theme_bw() + scale_colour_brewer(palette="Set1") + ggtitle("PC1 vs PC2")

#PCA Plot 2 (PC1 vs PC3)
ggplot() + geom_point(data=pcdf,aes(x=PC1,y=PC3,col=pop,shape=pop)) + theme_bw() + scale_colour_brewer(palette="Set1") + ggtitle("PC1 vs PC3")

#PCA Plot 1 (PC2 vs PC3)
ggplot() + geom_point(data=pcdf,aes(x=PC2,y=PC3,col=pop,shape=pop)) + theme_bw() + scale_colour_brewer(palette="Set1") + ggtitle("PC2 vs PC3")

dev.off() 
