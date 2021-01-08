#Import necessary libraries
library(data.table)
library(dplyr)
library(ggplot2)

#PrediXcan Results:

#Plot Predicted Expression for STARD5, for Brain_Cortex tissue, ALL pop, and Etop drug:
#Pheno file:
x_ALL_etop_pheno<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_etop.txt")
#Predicted Expression file:
y_ALL_Pred_Brain_Cortex<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_predixcan_predict_output/ALL_results_Brain_Cortex_predicted_expression.txt")
#Association file with top hits (to look up gene ID):
ALL_Pred_top_hits<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_assoc_gemma_output_combined/ALL_predixcan_top_hits")
#Data file:
xy_ALL_Pred_etop_Brain_Cortex<-inner_join(x_ALL_etop_pheno, y_ALL_Pred_Brain_Cortex, by = c("FID", "IID"))

#Make Plot:
pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_predicted_expression_plots/ALL_Etoposide_STARD5.pdf")
ggplot(xy_ALL_Pred_etop_Brain_Cortex, aes(x = xy_ALL_Pred_etop_Brain_Cortex$ENSG00000172345.9, y = xy_ALL_Pred_etop_Brain_Cortex$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted gene expression") + 
  scale_y_continuous(name = "Etop IC50 (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Etoposide Brain Cortex STARD5")
dev.off()




#Plot Predicted Expression for USF1, Liver, ALL, Cape:
#Pheno file:
x_ALL_cape_pheno <-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_cape.txt")
#Predicted Expression file:
y_ALL_Pred_Liver<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_predixcan_predict_output/ALL_results_Liver_predicted_expression.txt")
#Association file with top hits (to look up gene ID):
ALL_pred_top_hits<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_assoc_gemma_output_combined/ALL_predixcan_top_hits")
#Data file:
xy_ALL_Pred_cape_Liver<-inner_join(x_ALL_cape_pheno, y_ALL_Pred_Liver, by = c("FID", "IID"))

#Make Plot:
pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_predicted_expression_plots/ALL_Capecitabine_USF1.pdf")
ggplot(xy_ALL_Pred_cape_Liver, aes(x = xy_ALL_Pred_cape_Liver$ENSG00000158773.10, y = xy_ALL_Pred_cape_Liver$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") +
  scale_x_continuous(name = "Predicted gene expression") + 
  scale_y_continuous(name = "Cape AUC (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Capecitabine Liver USF1")
dev.off()



#MulTiXcan Results:

#Plot Predicted Expression for CCAR1, Esophagus Mucosa, YRI, Cape:
#Pheno file:
x_YRI_cape_pheno <-fread("/home/ashley/LCL_chemotherapy/YRI/YRI_multixcan_phenos/YRI_cape_pheno")
#Predicted Expression file:
y_YRI_Mult_EsoMuc<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI_predixcan_predict_output/YRI_results_Esophagus_Mucosa_predicted_expression.txt")
#Association file with top hits (to look up gene ID):
YRI_Mult_top_hits<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI_multixcan_output/YRI_multixcan_top_hits")
#Data file:
xy_YRI_Mult_cape_EsoMuc<-inner_join(x_YRI_cape_pheno, y_YRI_Mult_EsoMuc, by = c("FID", "IID"))

#Make Plot:
pdf("/home/ashley/LCL_chemotherapy/YRI/YRI_predicted_expression_plots/YRI_Capecitabine_CCAR1.pdf")
ggplot(xy_YRI_Mult_cape_EsoMuc, aes(x = xy_YRI_Mult_cape_EsoMuc$ENSG00000060339.9, y = xy_YRI_Mult_cape_EsoMuc$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") +
  scale_x_continuous(name = "Predicted gene expression") + 
  scale_y_continuous(name = "Cape AUC (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("YRI Capecitabine Esophagus Mucosa CCAR1")
dev.off()


#All plots in one pdf:

pdf("/home/ashley/LCL_chemotherapy/pred_exp_plots.pdf", onefile=TRUE)
plot1<-(ggplot(xy_ALL_Pred_etop_Brain_Cortex, aes(x = xy_ALL_Pred_etop_Brain_Cortex$ENSG00000172345.9, y = xy_ALL_Pred_etop_Brain_Cortex$Pheno)) +
  geom_jitter(size = 0.5, color = "black") +
  geom_density_2d(color = "dark gray") +
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "black") +
  scale_x_continuous(name = "Predicted gene expression") +
  scale_y_continuous(name = "Etop IC50 (rank normalized)") +
  theme_bw() +
  theme(text = element_text(size = 6), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Etoposide Brain Cortex STARD5"))
print(plot1)
plot2<-(ggplot(xy_ALL_Pred_cape_Liver, aes(x = xy_ALL_Pred_cape_Liver$ENSG00000158773.10, y = xy_ALL_Pred_cape_Liver$Pheno)) +
  geom_jitter(size = 0.5, color = "black") +
  geom_density_2d(color = "dark gray") +
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "black") +
  scale_x_continuous(name = "Predicted gene expression") +
  scale_y_continuous(name = "Cape AUC (rank normalized)") +
  theme_bw() +
  theme(text = element_text(size = 6), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Capecitabine Liver USF1"))
print(plot2)
plot3<-(ggplot(xy_YRI_Mult_cape_EsoMuc, aes(x = xy_YRI_Mult_cape_EsoMuc$ENSG00000060339.9, y = xy_YRI_Mult_cape_EsoMuc$Pheno)) +
  geom_jitter(size = 0.5, color = "black") +
  geom_density_2d(color = "dark gray") +
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "black") +
  scale_x_continuous(name = "Predicted gene expression") +
  scale_y_continuous(name = "Cape AUC (rank normalized)") +
  theme_bw() +
  theme(text = element_text(size = 6), plot.title = element_text(hjust = 0.5)) +
  ggtitle("YRI Capecitabine Esophagus Mucosa CCAR1"))
print(plot3)
dev.off()


pdf("/home/ashley/LCL_chemotherapy/pred_exp_plots2.pdf", onefile=TRUE, paper="A4r")
ggarrange(plot1, plot2, plot3,
          labels = c("A", "B", "C"),
          font.label = list(size = 8),
          ncol = 3, nrow = 3)
dev.off()
