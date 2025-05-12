#!/bin/bash
#SBATCH -c 4
#SBATCH -p gpu
#SBATCH --gpus=1
#SBATCH --mem=64gb
#SBATCH --job-name=load_velocities
#SBATCH -t 21:55:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH -o /home/rpal_umassd_edu/logs/loadVelocities/load_velocities_%A.log

# Activate your Python environment
source /home/rpal_umassd_edu/cgan_virtual/bin/activate

# Set the experiment ID directly
experiment_id=$1
transform_flag=$2

# Run the Python script
python /home/rpal_umassd_edu/cgan_deployment/standalone/LoadVelocities.py --experiment_id "$experiment_id" --transform_flag "$transform_flag"
