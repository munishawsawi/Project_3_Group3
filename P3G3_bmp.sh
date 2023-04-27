#!/bin/bash
#SBATCH --job-name=P3G3_bmp
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project_3_Resources/Group3/OandE/P3G3_bmp.out
#SBATCH --error=/shared/Project_3_Resources/Group3/OandE/P3G3_bmp.err

#Activate Conda(python)
source $HOME/.bash_profile
conda activate /shared/apps/conda/bio

#LAB_NEN
python3 /shared/Project_3_Resources/Group3/QXZP/Scan_tool/sian_bpm.py \
       -i /shared/Project_3_Resources/Group3/QXZP/Scan_tool/TempLAB_NEN.concat.txt \
       -o /shared/Project_3_Resources/Group3/QXZP/Scan_tool/LAB_NEN_bmp \
	   -prefix LAB_NEN_15 -ws 1000 -ms 15 -np 2

#LAB_ODN
python3 /shared/Project_3_Resources/Group3/QXZP/Scan_tool/sian_bpm.py \
       -i /shared/Project_3_Resources/Group3/QXZP/Scan_tool/TempLAB_ODN.concat.txt \
       -o /shared/Project_3_Resources/Group3/QXZP/Scan_tool/LAB_ODN_bmp \
	   -prefix LAB_ODN_15 -ws 1000 -ms 15 -np 2
