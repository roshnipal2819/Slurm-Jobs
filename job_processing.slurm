#!/bin/bash
#SBATCH -c 8
#SBATCH -p gpu
#SBATCH --gpus=1
#SBATCH --partition=gpu                # Specifies GPU partition (correct)
#SBATCH --cpus-per-task=16             # Allocates 16 CPU cores per task (correct)
#SBATCH --mem=80G                      # Allocates 80 GB of memory (correct)
#SBATCH --time=21:55:00                # Sets the job time limit (21 hours 55 minutes)
#SBATCH --nodes=1                      # Requests 1 node (correct)
#SBATCH --ntasks-per-node=1            # One task per node (correct)
#SBATCH --job-name=music_video_processing            # Job name (correct)
#SBATCH --output=/home/rpal_umassd_edu/PARE-VideoProcessing/PARE/slurm/logs/Pare_data_preprocessing_%A.log
#SBATCH --error=/home/rpal_umassd_edu/PARE-VideoProcessing/PARE/slurm/logs/Pare_data_preprocessing_%A.err

echo "Job started on $(date)"
# Load CUDA module
module load cuda/11.8
echo "CUDA module loaded"

# Source bash profile and activate Conda environment
export PATH="/home/rpal_umassd_edu/miniconda3/bin:$PATH"
source /home/rpal_umassd_edu/miniconda3/etc/profile.d/conda.sh
conda deactivate
conda activate pare-env

# Verify conda environment
echo "Available Conda environments:"
conda env list
echo "Active Conda environment: $CONDA_DEFAULT_ENV"
echo "Python version: $(python --version)"
echo "CUDA version: $(nvcc --version)"

cd /home/rpal_umassd_edu/PARE-VideoProcessing/PARE/
echo "Current working directory: $(pwd)"

# Run the python script
echo "Starting data preparation..."
source scripts/prepare_data.sh
echo "Running video processing script..."
python slurm/PARE_video_processing.py

# Print completion message
echo "Job completed on $(date)"
