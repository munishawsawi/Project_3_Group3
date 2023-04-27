#!/bin/bash
#SBATCH --job-name=P3G3_GS2
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project_3_Resources/Group3/QXZP/Final/P3G3_GS2.out
#SBATCH --error=/shared/Project_3_Resources/Group3/QXZP/Final/P3G3_GS2.err

#Activate Conda
source $HOME/.bash_profile
conda activate /shared/Project_3_Resources/Group3/QXZP/python37

cd /shared/Project_3_Resources/Group3/QXZP/Final

#LAB_ODN
python3 G2_genes.py -i DS_1O_Final/LABODN/ -an annotations/C_excelsa_V5_braker2_wRseq.gff3 -gf annotations/1-2-1_hits_all_gene_descriptions.tsv
#LAN_NEN
python3 G2_genes.py -i DS_1N_Final/LABNEN/ -an annotations/C_excelsa_V5_braker2_wRseq.gff3 -gf annotations/1-2-1_hits_all_gene_descriptions.tsv
