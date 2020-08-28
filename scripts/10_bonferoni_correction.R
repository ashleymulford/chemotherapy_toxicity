#Import necessary libraries
library(data.table)
library(dpylr)
library(tibble)

#Create function to paste in drug name
"%&%" = function(a,b) paste(a,b,sep="")

#Read in table with chr # and bp for genes
bp_chrome <- fread("/home/ashley/LCL_chemotherapy/BP_Chrome.txt")

#Create list of drugs for file input
drug_list <- c("arac", "cape", "carbo", "cis", "dauno", "etop", "pacl", "peme")

#Make a data frame from combined PrediXcan results that includes chr #, bp, and BH and Bonferroni adj p-value
  #Read in combined output file
  #Create vector of p-values
  #Adjust p-values with BH and bonferroni methods
  #Add new columns with adjusted p-values to data frame
  #Join PrediXcan data frame with bp_chrome data frame to add columns with chr # and bp
  #Remove old/inaccurate chr and bp columns
  #Ouput data frame into directory
for (drug in drug_list) {
  YRI_predixcan <- fread("/home/ashley/LCL_chemotherapy/YRI/YRI_assoc_gemma_output_combined/YRI_predixcan_" %&% drug)
  pvalues <- select(YRI_predixcan, contains("p_wald"))
  pvalues <- as.vector(unlist(pvalues))
  pvalues_adjusted_BH <- p.adjust(pvalues, method = "BH")
  pvalues_adjusted_BF <- p.adjust(pvalues, method = "bonferroni")
  YRI_predixcan <- add_column(YRI_predixcan,  pvalues_adjusted_BH = pvalues_adjusted_BH , .before = "p_lrt")
  YRI_predixcan <- add_column(YRI_predixcan,  pvalues_adjusted_bonferroni = pvalues_adjusted_BF, .before = "p_lrt")
  YRI_predixcan <- left_join(YRI_predixcan, bp_chrome, by = c("rs" = "gene"))
  YRI_predixcan <- select(YRI_predixcan, - chr, - ps)
  fwrite(YRI_predixcan, "/home/ashley/LCL_chemotherapy/YRI/YRI_assoc_gemma_output_combined/YRI_predixcan_" %&% drug %&% "_adj.txt")
}
