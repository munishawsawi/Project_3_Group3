#!/bin/bash
#SBATCH --job-name=P3G3_gatk2
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project_3_Resources/Group3/OandE/P3G3_gatk2.out
#SBATCH --error=/shared/Project_3_Resources/Group3/OandE/P3G3_gatk2.err

#Activate Conda(samtools)
#source $HOME/.bash_profile
#conda activate /shared/Project_3_Resources/Group3/QXZP/samtools

#Make a FASTA index file
#samtools faidx /shared/Project_3_Resources/Group3/QXZP/Scan_tool/C_excelsa_V5.fa

#Deactivate Conda(samtools)
#conda deactivate


#Activate Conda(gatk)
source $HOME/.bash_profile
conda activate /shared/apps/conda/bio

#Categorize VCF files
VCF_dataset=/shared/Project_3_Resources/Group3/QXZP/Scan_tool/LAB_NEN_ODN.clean_BI.ann.vcf
Reference=/shared/Project_3_Resources/Group3/QXZP/Scan_tool/C_excelsa_V5.fa

#Make a Fasta dict file
#gatk CreateSequenceDictionary -R $Reference

#LAB
  #gatk SelectVariants \
  #-R $Reference \
  #-V $VCF_dataset \
  #-sn LAB_1 -sn LAB_2 -sn LAB_4 -sn LAB_5 -sn LAB_004 -sn LAB_300 -sn LAB_400 -sn LAB_500 \
  #--exclude-filtered \
  #--select "AF > 0 && AF < 1" \
  #-O /shared/Project_3_Resources/Group3/QXZP/Scan_tool/LAB_dataset.vcf

#NEN
  #gatk SelectVariants \
  #-R $Reference \
  #-V $VCF_dataset \
  #-sn NEN_001 -sn NEN_003 -sn NEN_4 -sn NEN_5 -sn NEN_6 -sn NEN_200 -sn NEN_300 \
  #--exclude-filtered \
  #--select "AF > 0 && AF < 1" \
  #-O /shared/Project_3_Resources/Group3/QXZP/Scan_tool/NEN_dataset.vcf

#ODN
  #gatk SelectVariants \
  #-R $Reference \
  #-V $VCF_dataset \
  #-sn ODN_2 -sn ODN_4 -sn ODN_5 -sn ODN_6 -sn ODN_7 -sn ODN_9 -sn ODN_10 \
  #--exclude-filtered \
  #--select "AF > 0 && AF < 1" \
  #-O /shared/Project_3_Resources/Group3/QXZP/Scan_tool/ODN_dataset.vcf

#Preparing input files (Convert vcf format file to table format file)
  #LAB
  gatk VariantsToTable -V LAB_dataset.vcf -R $Reference -F CHROM -F POS -F REF -F AN -F DP -GF GT -O /shared/Project_3_Resources/Group3/QXZP/Scan_tool/LAB.table
  #NEN
  gatk VariantsToTable -V NEN_dataset.vcf -R $Reference -F CHROM -F POS -F REF -F AN -F DP -GF GT -O /shared/Project_3_Resources/Group3/QXZP/Scan_tool/NEN.table
  #ODN
  gatk VariantsToTable -V ODN_dataset.vcf -R $Reference -F CHROM -F POS -F REF -F AN -F DP -GF GT -O /shared/Project_3_Resources/Group3/QXZP/Scan_tool/ODN.table
