#Import necessasry libraries
library(data.table)
library(tibble)
library(dplyr)

#Create function to paste in drug name
"%&%" = function(a,b) paste(a,b,sep="")

#Create list of drugs for file input
drug_list <- c("arac", "cape", "carbo", "cis", "dauno", "etop", "pacl", "peme")

#Make a data frame with significant results for every drug
  #Read in file
  #Add column containing drug name
  #Subset for significance using unadjusted p-value, want about 100 top genes, threshold accordingly
  #Remove decimals from gene ids, necessary for FUMA to read input
  #Output data frame into directory
for(drug in drug_list){
  ALL_pred <- fread("/home/ashley/LCL_chemotherapy/ALL/ALL_assoc_gemma_output_combined/ALL_predixcan_" %&% drug %&% "_adj_bonferroni.txt")
  ALL_pred<-add_column(ALL_pred, drug = drug, .before = "tissue")
  #Use p_wald < .0005 for all pops, will subset top ~100 genes for all pop/drug
  ALL_pred_sign<-subset(ALL_pred, p_wald < .0005)
  
  genes<-select(ALL_pred_sign, 3)
  genes<-as.vector(unlist(genes))
  
  ALL_pred_sign<-select(ALL_pred_sign, 1:2, 4:18)
  
  gene_list_fuma<-c()
  
  for (gene in genes) {
    gene<-substr(gene,0,15)
    gene_list_fuma<-append(gene_list_fuma, gene)
  }
  ALL_pred_sign<-add_column(ALL_pred_sign, gene = gene_list_fuma, .before = "drug")
  
  fwrite(ALL_pred_sign, "/home/ashley/LCL_chemotherapy/ALL/ALL_assoc_gemma_output_combined/ALL_predixcan_" %&% drug %&% "_FUMA", na = "NA", quote = F, sep = "\t", col.names = T) 
}

#Make a list of all genes tested (same genes across all drugs)
genes_list<-select(ALL_pred, 3)
genes_list<-as.vector(unlist(genes_list))

#create empty list
gn_list_fuma<-c()

#remove decimals for the end of every gene id
for (gn in genes_list) {
  gn<-substr(gn,0,15)
  gn_list_fuma<-append(gn_list_fuma, gn)
}

#Transform list into single-column data frame
gn_list_fuma<-as.data.frame(gn_list_fuma)

#Output data frame into directory
fwrite(gn_list_fuma, "/home/ashley/LCL_chemotherapy/ALL/ALL_assoc_gemma_output_combined/ALL_predixcan_genes_FUMA", na = "NA", quote = F, sep = "\t", col.names = T)
