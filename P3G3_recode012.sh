#!/bin/bash
#SBATCH --job-name=P3G3_recode
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project_3_Resources/Group3/QXZP/Scan_tool/OandE/P3G3_recode.out
#SBATCH --error=/shared/Project_3_Resources/Group3/QXZP/Scan_tool/OandE/P3G3_recode.err

#Activate Conda(python)
source $HOME/.bash_profile
conda activate /shared/apps/conda/bio

#LAB
python3 /shared/Project_3_Resources/Group3/QXZP/Scan_tool/recode012.py \
       -i /shared/Project_3_Resources/Group3/QXZP/Scan_tool/LAB.table \
       -o /shared/Project_3_Resources/Group3/QXZP/Scan_tool \
       -pop LAB

#NEN
python3 /shared/Project_3_Resources/Group3/QXZP/Scan_tool/recode012.py \
       -i /shared/Project_3_Resources/Group3/QXZP/Scan_tool/NEN.table \
       -o /shared/Project_3_Resources/Group3/QXZP/Scan_tool \
       -pop NEN

#ODN
python3 /shared/Project_3_Resources/Group3/QXZP/Scan_tool/recode012.py \
       -i /shared/Project_3_Resources/Group3/QXZP/Scan_tool/ODN.table \
       -o /shared/Project_3_Resources/Group3/QXZP/Scan_tool \
       -pop ODN
