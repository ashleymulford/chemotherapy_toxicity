#Import necessary libraries
library(data.table)
library(dplyr)
library(tibble)

#Read in fam file for each pop and set column names, then add pop column
YRI_fam<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI.chr10.TGP_and_imputed.20130416.exclude_BAD_SNPs.fam")
colnames(YRI_fam)<-c("FID", "IID", "fat", "mot", "sx", "pheno")
YRI_fam<-add_column(YRI_fam, pop = "YRI", .before = "FID")
CEU_fam<-fread("/home/ashley/LCL_chemotherapy/CEU/CEU.chr10.TGP_and_imputed.20130416.exclude_BAD_SNPs.fam")
colnames(CEU_fam)<-c("FID", "IID", "fat", "mot", "sx", "pheno")
CEU_fam<-add_column(CEU_fam, pop = "CEU", .before = "FID")
ASN_fam<-fread("/home/ashley/LCL_chemotherapy/ASN/ASN.chr10.TGP_and_imputed.20130718.phased.R2gt0.8.fam")
colnames(ASN_fam)<-c("FID", "IID", "fat", "mot", "sx", "pheno")
ASN_fam<-add_column(ASN_fam, pop = "ASN", .before = "FID")

#ASN_fam fat and mat are type int, must change to type chr

#Pull out fat column and create vector
fat<-select(ASN_fam, contains("fat"))
fat<-as.vector(unlist(fat))

#Pull out mot column and create vector
mot<-select(ASN_fam, contains("mot"))
mot<-as.vector(unlist(mot))

#Remove fat and mot columns from data frame
ASN_fam<-select(ASN_fam, -fat, -mot)

#Convert each item in fat vector to type chr
for (n in fat) {
  n<-toString(n)
  if(exists("fat_list")){
    fat_list<-append(fat_list, n)
  }
  else{
    fat_list<-c(n)
  }
}

#Add new fat column to data frame
ASN_fam<-add_column(ASN_fam, fat = fat_list, .before = "sx")

#Convert each item in mot vector to type chr
for (n in mot) {
  n<-toString(n)
  if(exists("mot_list")){
    mot_list<-append(mot_list, n)
  }
  else{
    mot_list<-c(n)
  }
}

#Add new mot column to data frame
ASN_fam<-add_column(ASN_fam, mot = mot_list, .before = "sx")

#Join all fam files together 
ALL_fam<-full_join(ASN_fam, CEU_fam)
ALL_fam<-full_join(ALL_fam, YRI_fam)

#Output file into directory
fwrite(ALL_fam, "/home/ashley/LCL_chemotherapy/ALL/ALL_orderedby_ASN_CEU_YRI.fam", quote = F, sep = " ", col.names = F)

