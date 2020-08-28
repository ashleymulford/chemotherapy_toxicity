#Import necessary libraries
library(data.table)
library(dpylr)
library(tibble)

#Create function to paste in drug name
"%&%" = function(a,b) paste(a,b,sep="")

#Read in table with chr # and bp for genes
bp_chrome<-fread("/home/ashley/LCL_chemotherapy/BP_Chrome.txt")

#Create list of drugs for file input
drug_list<-c("arac", "cape", "carbo", "cis", "dauno", "etop", "pacl", "peme")

#Make a data frame from MulTiXcan results that includes chr #, bp, and BH and Bonferroni adj p-value
  #Read in MulTiXcan output file
  #Create vector of p-values
  #Adjust p-values with BH and bonferroni methods
  #Add new columns with adjusted p-values to data frame
  #Join MulTiXcan data frame with bp_chrome data frame to add columns with chr # and bp
  #Ouput data frame into directory
for (drug in drug_list) {
  YRI_multixcan<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI_multixcan_output/YRI_multixcan_" %&% drug)
  pvalues<-select(YRI_multixcan, contains("pvalue"))
  pvalues<-as.vector(unlist(pvalues))
  pvalues_adjusted_BH <- p.adjust(pvalues, method = "BH")
  pvalues_adjusted_BF <- p.adjust(pvalues, method = "bonferroni")
  YRI_multixcan <- add_column(YRI_multixcan,  pvalues_adjusted_BH = pvalues_adjusted_BH , .before = "n_models")
  YRI_multixcan <- add_column(YRI_multixcan,  pvalues_adjusted_bonferroni = pvalues_adjusted_BF, .before = "n_models")
  YRI_multixcan_wchr <- left_join(YRI_multixcan, bp_chrome, by = c("gene" = "gene"))
  fwrite(YRI_multixcan_wchr, "/home/ashley/LCL_chemotherapy/YRI/YRI_multixcan_output/YRI_multixcan_" %&% drug %&% "_adj.txt", col.names = T, row.names = F, sep = "\t", quote = F)
}
