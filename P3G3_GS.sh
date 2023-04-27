#!/bin/bash
#SBATCH --job-name=P3G3_GS 
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project_3_Resources/Group3/OandE/P3G3_GS.out
#SBATCH --error=/shared/Project_3_Resources/Group3/OandE/P3G3_GS.err

#Activate Conda
source $HOME/.bash_profile
conda activate /shared/Project_3_Resources/Group3/QXZP/python37

cd /shared/Project_3_Resources/Group3/QXZP/Final

#LAB_ODN
python3 /shared/Project_3_Resources/Group3/QXZP/Final/G1_outliers.py -i new_AC_tables/ -coh1 LAB -coh2 ODN -o DS_1O_Final/
#LAN_NEN
python3 /shared/Project_3_Resources/Group3/QXZP/Final/G1_outliers.py -i new_AC_tables/ -coh1 LAB -coh2 NEN -o DS_1N_Final/ 
