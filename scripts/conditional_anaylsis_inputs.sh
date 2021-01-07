
#Generate input files for conditional analysis - pull out significant SNPs from geno files

#ASN Carbo SNPs input
grep -e rs2100011, -e rs2254812, -e rs2254813, ASN.TGP_and_imputed.rmBAD.20130718.geno > conditional_analysis_snps_ASN_carbo.txt

#YRI Dauno SNPs input
grep -e rs61079639, -e rs60507300, YRI.TGP_and_imputed.rmBAD.20130526.geno > conditional_analysis_snps_YRI_dauno.txt

#YRI Etop SNPs input
grep -e rs7971310, -e rs7960974, -e rs7979399, -e rs2711729, -e rs2711728, -e rs11183699, YRI.TGP_and_imputed.rmBAD.20130526.geno > conditional_analysis_snps_YRI_etop.txt


#Use these along with pheno info to run conditional analysis in R
