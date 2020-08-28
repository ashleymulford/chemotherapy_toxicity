#Import necessasry libraries
library(data.table)
library(tibble)

#Create function to paste in tissue name
"%&%" = function(a,b) paste(a,b,sep="")

#Create list of tissues for file input
tiss_list <- c("Adipose_Subcutaneous", "Adipose_Visceral_Omentum", "Adrenal_Gland", "Artery_Aorta", "Artery_Coronary", "Artery_Tibial", "Brain_Amygdala", "Brain_Anterior", "Brain_Caudate", "Brain_Cerebellar_Hemisphere", "Brain_Cerebellum", "Brain_Cortex", "Brain_Frontal_Cortex", "Brain_Hippocampus", "Brain_Hypothalamus", "Brain_Nucleus", "Brain_Putamen", "Brain_Spinal", "Brain_Substantia", "Breast_Mammary_Tissue", "Cells_EBV-transformed_lymphocytes", "Cells_Transformed_fibroblasts", "Colon_Sigmoid", "Colon_Transverse", "Esophagus_Gastroesophageal_Junction", "Esophagus_Mucosa", "Esophagus_Muscularis", "Heart_Atrial_Appendage", "Heart_Left_Ventricle", "Liver", "Lung", "MESA_AFA", "MESA_AFHI", "MESA_ALL", "MESA_CAU", "MESA_HIS", "Minor_Salivary_Gland", "Muscle_Skeletal", "Nerve_Tibial", "Ovary", "Pancreas", "Pituitary", "Prostate", "Skin_Not_Sun_Exposed_Suprapubic", "Skin_Sun_Exposed_Lower_leg", "Small_Intestine_Terminal_Ileum", "Spleen", "Stomach", "Testis", "Thyroid", "Uterus", "Vagina", "Whole_Blood")

#Make a data frame with all results from each tissue per drug per pop
  #Read in file
  #Add column containing tissue name
  #Compile significant subsets into single data frame
for(tiss in tiss_list){
  arac_output <- fread("/home/ashley/LCL_chemotherapy/YRI/YRI_assoc_gemma_output/YRI_assoc_arac_" %&% tiss %&% ".assoc.txt")
  arac_output<-add_column(arac_output, tissue = tiss, .before = "chr")
  if(exists("YRI_assoc_arac")){
    YRI_assoc_arac<-merge(x = YRI_assoc_arac, y = arac_output, all = TRUE)
  }
  else{
    YRI_assoc_arac<-arac_output
  }
}

#Output data frames into directory
fwrite(YRI_assoc_arac, "/home/ashley/LCL_chemotherapy/YRI/YRI_assoc_gemma_output_combined/YRI_predixcan_arac", na = "NA", quote = F, sep = "\t", col.names = T) 
