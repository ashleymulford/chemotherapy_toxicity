#Import necessary libraries
library(data.table)

#Paste function
"%&%" = function(a,b) paste(a,b,sep="")

pop_list <- c("YRI", "CEU", "ASN", "ALL")
drug_list <- c("arac", "capecitabine", "carboplatin", "cisplatin", "daunorubicin", "etoposide", "paclitaxel", "pemetrexed")

for (pop in pop_list) {
  for (drug in drug_list){
    GWAS <- fread("sumstats/"%&% pop %&%"_GWAS_results/"%&% pop %&%"_GWAS_"%&% drug %&%".assoc.txt")
    #remove columns
    GWAS$n_miss <- NULL
    GWAS$p_lrt <- NULL
    GWAS$l_mle <- NULL
    GWAS$l_remle <- NULL
    GWAS$p_score <- NULL
    #change column names
    colnames(GWAS) <- c("chromosome", "variant_ID", "base_pair_location", "effect_allele", "other_allele", "effect_allele_frequency", "beta", "standard_error", "p_value")
    fwrite(GWAS, "sumstats/"%&% pop %&%"_GWAS_results/"%&% pop %&%"_"%&% drug %&%".assoc.tsv", quote = F, sep = "\t", col.names = T)
  }
}
