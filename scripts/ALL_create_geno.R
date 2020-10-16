#Import necessary libraries
library(data.table)
library(dplyr)

#Read in snp info file 
ALL_snpinfo<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_snp.info")

#Read in geno file for each pop
ASN_geno<-fread("/home/ashley/LCL_chemotherapy/ASN/ASN.TGP_and_imputed.rmBAD.20130718.geno")
CEU_geno<-fread("/home/ashley/LCL_chemotherapy/CEU/CEU.TGP_and_imputed.rmBAD.20130526.geno")
YRI_geno<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI.TGP_and_imputed.rmBAD.20130526.geno")

#Create data frame with rsIDs only
rsID<-select(ALL_snpinfo, 1)

#Join geno files with rsID (keep only snps shared across pops in geno file)
ASN_geno_shared_snps<-right_join(ASN_geno, rsID)
CEU_geno_shared_snps<-right_join(CEU_geno, rsID)
YRI_geno_shared_snps<-right_join(YRI_geno, rsID)

#Create data frame with columns for individuals only
CEU_geno_shared_snps_people<-select(CEU_geno_shared_snps, 4:181)
YRI_geno_shared_snps_people<-select(YRI_geno_shared_snps, 4:181)

#Combine data frames (add new columns of CEU and YRI individuals to the back of ASN geno file)
ALL_geno<-bind_cols(ASN_geno_shared_snps, CEU_geno_shared_snps_people)
ALL_geno<-bind_cols(ALL_geno, YRI_geno_shared_snps_people)

#Output file in directory
fwrite(ALL_geno, "/home/ashley/LCL_chemotherapy/ALL/ALL.geno", na = "NA", quote = F, col.names = F)
