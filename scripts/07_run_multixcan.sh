#Create lists, one of drugs and on of populations 
declare -a drugs=("arac" "cape" "carbo" "cis" "dauno" "etop" "pacl" "peme")
declare -a pops=("CEU" "YRI")

#Use loop to run MulTiXcan
for drug in ${drugs[@]}
  do
  for pop in ${pops[@]}
    do
    usr/bin/python MulTiXcan.py --expression_folder /home/ashley/LCL_chemotherapy/${pop}/${pop}_predixcan_predict_output --expression_pattern "${pop}_results_(.*)_predicted_expression.txt" --input_phenos_file /home/ashley/LCL_chemotherapy/${pop}/${pop}_multixcan_phenos/${pop}_${drug}_pheno --input_phenos_column Pheno --mode linear --output /home/ashley/LCL_chemotherapy/${pop}/${pop}_multixcan_output/${pop}_${drug}_multixcan
  done
done
