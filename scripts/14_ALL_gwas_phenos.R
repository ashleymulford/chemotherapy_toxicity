#Import necessary libraries
library(data.table)
library(dpylr)

#Read in pheno file
ALL_pheno<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_pheno_orderedbyfam_ASN_CEU_YRI.txt")

#Create pheno data frame with ids (for reference)
ALL_arac_ids<-select(ALL_pheno, 1:12, 29)
ALL_cape_ids<-select(ALL_pheno, 1:12, 31)
ALL_carbo_ids<-select(ALL_pheno, 1:12, 32)
ALL_cis_ids<-select(ALL_pheno, 1:12, 34)
ALL_dauno_ids<-select(ALL_pheno, 1:12, 36)
ALL_etop_ids<-select(ALL_pheno, 1:12, 38)
ALL_pacl_ids<-select(ALL_pheno, 1:12, 41)
ALL_peme_ids<-select(ALL_pheno, 1:12, 42)

#Create single-column pheno data frames wiht drug only (for input into GEMMA)
ALL_arac<-select(ALL_pheno, 29)
ALL_cape<-select(ALL_pheno, 31)
ALL_carbo<-select(ALL_pheno, 32)
ALL_cis<-select(ALL_pheno, 34)
ALL_dauno<-select(ALL_pheno, 36)
ALL_etop<-select(ALL_pheno, 38)
ALL_pacl<-select(ALL_pheno, 41)
ALL_peme<-select(ALL_pheno, 42)

#Output reference pheno files into directory
fwrite(ALL_arac_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_arac_bestpheno_ids.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_cape_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_cape_bestpheno_ids.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_carbo_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_carbo_bestpheno_ids.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_cis_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_cis_bestpheno_ids.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_dauno_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_dauno_bestpheno_ids.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_etop_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_etop_bestpheno_ids.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_pacl_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_pacl_bestpheno_ids.txt", na = "NA", col.names = T, quote = F, sep = "\t")
fwrite(ALL_peme_ids, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_peme_bestpheno_ids.txt", na = "NA", col.names = T, quote = F, sep = "\t")

#Output input pheno files into directory
fwrite(ALL_arac, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_arac_bestpheno_noids.txt", na = "NA", col.names = F)
fwrite(ALL_cape, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_cape_bestpheno_noids.txt", na = "NA", col.names = F)
fwrite(ALL_carbo, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_carbo_bestpheno_noids.txt", na = "NA", col.names = F)
fwrite(ALL_cis, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_cis_bestpheno_noids.txt", na = "NA", col.names = F)
fwrite(ALL_dauno, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_dauno_bestpheno_noids.txt", na = "NA", col.names = F)
fwrite(ALL_etop, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_etop_bestpheno_noids.txt", na = "NA", col.names = F)
fwrite(ALL_pacl, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_pacl_bestpheno_noids.txt", na = "NA", col.names = F)
fwrite(ALL_peme, "/home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_peme_bestpheno_noids.txt", na = "NA", col.names = F)
