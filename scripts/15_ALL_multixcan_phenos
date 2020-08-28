#Import necessary libraries
library(data.table)
library(dplyr)

#Read in pheno file
ALL_pheno<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_pheno_orderedbyfam_ASN_CEU_YRI.txt")

#Create three-column pheno data frames, with column names FID, IID, and Pheno
ALL_arac_ids<-select(ALL_pheno, 1:2, 29)
colnames(ALL_arac_ids) <- c("FID", "IID", "Pheno")
ALL_cape_ids<-select(ALL_pheno, 1:2, 31)
colnames(ALL_cape_ids) <- c("FID", "IID", "Pheno")
ALL_carbo_ids<-select(ALL_pheno, 1:2, 32)
colnames(ALL_carbo_ids) <- c("FID", "IID", "Pheno")
ALL_cis_ids<-select(ALL_pheno, 1:2, 34)
colnames(ALL_cis_ids) <- c("FID", "IID", "Pheno")
ALL_dauno_ids<-select(ALL_pheno, 1:2, 36)
colnames(ALL_dauno_ids) <- c("FID", "IID", "Pheno")
ALL_etop_ids<-select(ALL_pheno, 1:2, 38)
colnames(ALL_etop_ids) <- c("FID", "IID", "Pheno")
ALL_pacl_ids<-select(ALL_pheno, 1:2, 41)
colnames(ALL_pacl_ids) <- c("FID", "IID", "Pheno")
ALL_peme_ids<-select(ALL_pheno, 1:2, 42)
colnames(ALL_peme_ids) <- c("FID", "IID", "Pheno")

#Ouput data frames into directory
fwrite(ALL_arac_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_arac.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_cape_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_cape.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_carbo_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_carbo.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_cis_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_cis.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_dauno_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_dauno.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_etop_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_etop.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_pacl_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_pacl.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_peme_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_peme.txt", na = "NA", col.names = T, quote = F, sep = "\t")
