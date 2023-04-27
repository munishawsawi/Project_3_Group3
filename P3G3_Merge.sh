#!/bin/bash
#SBATCH --job-name=P3G3_Merge
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project_3_Resources/Group3/OandE/P3G3_Merge.out
#SBATCH --error=/shared/Project_3_Resources/Group3/OandE/P3G3_Merge.err

#Activate Conda(python)
source $HOME/.bash_profile
conda activate /shared/apps/conda/bio

#LAB_ODN
python3 /shared/Project_3_Resources/Group3/QXZP/Scan_tool/Sian_sort_for_ScanTools.py \
       '/shared/Project_3_Resources/Group3/QXZP/Scan_tool/LAB.table.recode.txt /shared/Project_3_Resources/Group3/QXZP/Scan_tool/ODN.table.recode.txt' \
       /shared/Project_3_Resources/Group3/QXZP/Scan_tool/Temp \
	   LAB_ODN

#LAB_NEN
python3 /shared/Project_3_Resources/Group3/QXZP/Scan_tool/Sian_sort_for_ScanTools.py \
       '/shared/Project_3_Resources/Group3/QXZP/Scan_tool/LAB.table.recode.txt /shared/Project_3_Resources/Group3/QXZP/Scan_tool/NEN.table.recode.txt' \
       /shared/Project_3_Resources/Group3/QXZP/Scan_tool/Temp \
	   LAB_NEN
