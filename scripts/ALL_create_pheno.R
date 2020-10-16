#Import necessary libraries
library(data.table)
library(dplyr)

#Read in master pheno file
master_pheno<-fread("/home/ashley/LCL_chemotherapy/master_cytotoxicity_info_130311_plus_igrowth.txt")

#Read in fam file for each pop and set column names
YRI_fam<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI.chr10.TGP_and_imputed.20130416.exclude_BAD_SNPs.fam")
colnames(YRI_fam)<-c("FID", "IID", "fat", "mot", "sx", "pheno")
CEU_fam<-fread("/home/ashley/LCL_chemotherapy/CEU/CEU.chr10.TGP_and_imputed.20130416.exclude_BAD_SNPs.fam")
colnames(CEU_fam)<-c("FID", "IID", "fat", "mot", "sx", "pheno")
ASN_fam<-fread("/home/ashley/LCL_chemotherapy/ASN/ASN.chr10.TGP_and_imputed.20130718.phased.R2gt0.8.fam")
colnames(ASN_fam)<-c("FID", "IID", "fat", "mot", "sx", "pheno")

#Subset master pheno file by pop
YRI_pheno<-subset(master_pheno, pop == "YRI")
CEU_pheno<-subset(master_pheno, pop == "CEU")
JPT_pheno<-subset(master_pheno, pop == "JPT")
CHB_pheno<-subset(master_pheno, pop == "CHB")

#Combine CHB and JPT to get single ASN pheno file
ASN_pheno<-full_join(CHB_pheno, JPT_pheno)

#Join pheno with fam file so order and number of people match fam file
ASN_pheno_ordered<-left_join(ASN_fam, ASN_pheno)
ASN_pheno_ordered<-select(ASN_pheno_ordered, -fat, -mot, -sx, -pheno)
YRI_pheno_178<-left_join(YRI_fam, YRI_pheno)
YRI_pheno_178<-select(YRI_pheno_178, -fat, -mot, -sx, -pheno)
CEU_pheno_178<-left_join(CEU_fam, CEU_pheno)
CEU_pheno_178<-select(CEU_pheno_178, -fat, -mot, -sx, -pheno)

#Join all pheno files together 
ALL_pheno<-full_join(ASN_pheno_ordered, CEU_pheno_178)
ALL_pheno<-full_join(ALL_pheno, YRI_pheno_178)

#Output file into directory
fwrite(ALL_pheno, "/home/ashley/LCL_chemotherapy/ALL/ALL_pheno_orderedbyfam_ASN_CEU_YRI.txt", na = "NA", quote = F, sep = " ", col.names = T)


