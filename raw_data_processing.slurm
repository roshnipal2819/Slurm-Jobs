#!/bin/bash
#SBATCH -c 4
#SBATCH -p gpu
#SBATCH --gpus=1
#SBATCH --mem=64gb
#SBATCH --job-name=RawDataProcessor
#SBATCH -t 21:55:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH -o /home/rpal_umassd_edu/logs/Raw_Data_Process/raw_data_process_%A.log

# Activate your Python environment
source /home/rpal_umassd_edu/cgan_virtual/bin/activate

# Set the experiment ID directly
experiment_id=$1

# Run the Python script
python /home/rpal_umassd_edu/cgan_deployment/standalone/RawDataProcessor.py --experiment_id "$experiment_id"
