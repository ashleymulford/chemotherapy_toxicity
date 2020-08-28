#Import necessasry libraries
library(data.table)
library(tibble)

#Create function to paste in drug name
"%&%" = function(a,b) paste(a,b,sep="")

#Create list of drugs for file input
drug_list <- c("arac", "cape", "carbo", "cis", "dauno", "etop", "pacl", "peme")

#Make a data frame with significant results
  #Read in file
  #Add column containing drug name
  #Subset for significance, threshold = 10^-5
  #Compile significant subsets into single data frame
for(drug in drug_list){
  YRI_output <- fread("/home/ashley/LCL_chemotherapy/YRI/YRI_GWAS_results/YRI_GWAS_" %&% drug %&% ".assoc.txt")
  YRI_output<-add_column(YRI_output, drug_name = drug, .before = "chr")
  YRI_output_significant<-subset(YRI_output, p_wald <= 10^-5)
  if(exists("YRI_GWAS_sign")){
    YRI_GWAS_sign<-merge(x = YRI_GWAS_sign, y = YRI_output_significant, all = TRUE)
  }
  else{
    YRI_GWAS_sign<-YRI_output_significant
  }
}

#Subset again for significance, threshold = 10^-7
YRI_GWAS_mostsig <- subset(YRI_GWAS_sign, p_wald <= 10^-7)

#Output data frames into directory
fwrite(YRI_GWAS_sign, "/home/ashley/LCL_chemotherapy/YRI/YRI_GWAS_results/YRI_GWAS_sig", na = "NA", quote = F, sep = "\t", col.names = T) 
fwrite(YRI_GWAS_mostsig, "/home/ashley/LCL_chemotherapy/YRI/YRI_GWAS_results/YRI_GWAS_mostsig", na = "NA", quote = F, sep = "\t", col.names = T) 
