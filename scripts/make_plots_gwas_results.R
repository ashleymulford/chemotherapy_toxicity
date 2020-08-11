#Import necessary libraries
library(data.table)
library(qqman)
library(colorspace)

#Create function to paste in drug name
"%&%" = function(a,b) paste(a,b,sep="")

#Create color vector
colors<-sequential_hcl(4,"SunsetDark")

#Create list of drugs for file input
drug_list <- c("arac", "cape", "carbo", "cis", "dauno", "etop", "pacl", "peme")

#Make QQ and Manhattan plots using loop
for(drug in drug_list){
  GWAS_CEU <- fread("/home/ashley/LCL_chemotherapy/CEU/CEU_GWAS_results/CEU_GWAS_" %&% drug %&% ".assoc.txt")
 
  png(filename = "CEU_GWAS_" %&% drug %&% ".qqplot.png", res=100)
  qq(GWAS_CEU$p_wald)
  dev.off()
  
  png(filename = "CEU_GWAS_" %&% drug %&% ".manplot.png", res=100)
  manhattan(GWAS_CEU, chr = "chr", bp = "ps", p = "p_wald", col = colors)
  dev.off()
}
