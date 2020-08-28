#Import necessary libraries
library(data.table)
library(dplyr)
library(tibble)

#Read in snp info file and add column names
ALL_snp_info<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_snp.info")
colnames(ALL_snp_info)<-c("rs", "bp", "chr")

#Extract chr column
chr<-select(ALL_snp_info, 3)
chr<-as.vector(unlist(chr))

#Select for rs and bp columns
ALL_map<-select(ALL_snp_info, 1:2)

#Add chr column
ALL_map<-add_column(ALL_map, chr = chr, .before = "rs")

#Add cm column
ALL_map<-add_column(ALL_map, cm = "0", .before = "bp")

#Read in geno file and add name to first column
ALL_geno<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_orderedby_ASN_CEU_YRI.geno")
colnames(ALL_geno)[1]<-"rs"

#Create list of all snps from map file
snp_list<-select(ALL_map, 2)
snp_list<-as.vector(unlist(snp_list))

#Take a random sample of 100,000 snps
snp_sample<-sample(snp_list, size=100000)

#Turn snp subset list into data frame with column name rs
snp_sample<-as.data.frame(snp_sample)
colnames(snp_sample)<-c("rs")

#Merge snp subset data frame to map and geno data frames to produce sample with only 100,000 snps
ALL_map_sample<-left_join(snp_sample, ALL_map)
ALL_geno_sample<-left_join(snp_sample, ALL_geno)

#Reorder map columns to match format: chr rs cm bp
ALL_map_sample<-select(ALL_map_sample, 2:4)
snp_sample<-as.vector(unlist(snp_sample))
ALL_map_sample<-add_column(ALL_map_sample, rs = snp_sample, .before = "cm")

#Output data frames into directory
fwrite(ALL_geno_sample, "/home/ashley/LCL_chemotherapy/ALL/ALL_orderedby_ASN_CEU_YRI_snpsubset.geno", na = "NA", quote = F, col.names = F)
fwrite(ALL_map_sample, "/home/ashley/LCL_chemotherapy/ALL/ALL_subset.map", sep = "\t", na = "NA", quote = F, col.names = F)
