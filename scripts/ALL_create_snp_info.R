#Import necessary libraries
library(data.table)
library(dpylr)

#Read in snp.info files for each pop
ASN_snp_info<-fread("/home/ashley/LCL_chemotherapy/ASN/ASN.TGP_and_imputed.rmBAD.20130718.snp.info")
CEU_snp_info<-fread("/home/ashley/LCL_chemotherapy/CEU/CEU.TGP_and_imputed.rmBAD.20130526.snp.info")
YRI_snp_info<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI.TGP_and_imputed.rmBAD.20130526.snp.info")

#Combine into one snp.info file (chr1 first)
ALL_snp_info<-inner_join(YRI_snp_info, CEU_snp_info)
ALL_snp_info<-inner_join(ALL_snp_info, ASN_snp_info)

#Ouput file into directory
fwrite(ALL_snp_info, "/home/ashley/LCL_chemotherapy/ALL/ALL_snp.info",  quote = F, col.names = F)
