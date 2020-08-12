#Import necessary libraries
library(data.table)

#Paste function
"%&%" = function(a,b) paste(a,b,sep="")

#Create list of drugs for file input
drug_list <- c("arac", "capecitabine", "carboplatin", "cisplatin", "daunorubicin", "etoposide", "paclitaxel", "pemetrexed")

for (drug in drug_list){
  GWAS_CEU <- fread("sumstats/CEU_GWAS_results/CEU_GWAS_"%&% drug %&%".assoc.txt")
  #remove columns
  GWAS_CEU$n_miss <- NULL
  GWAS_CEU$p_lrt <- NULL
  GWAS_CEU$l_mle <- NULL
  GWAS_CEU$l_remle <- NULL
  GWAS_CEU$p_score <- NULL
  #change column names
  colnames(GWAS_CEU) <- c("chromosome", "variant_ID", "base_pair_location", "effect_allele", "other_allele", "effect_allele_frequency", "beta", "standard_error", "p_value")
  fwrite(GWAS_CEU, "sumstats/CEU_GWAS_results/CEU_"%&% drug %&%".assoc.tsv", quote = F, sep = "\t", col.names = T)
}
