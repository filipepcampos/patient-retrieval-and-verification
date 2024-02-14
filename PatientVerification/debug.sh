#!/bin/bash
#
#SBATCH --partition=debug_8GB    # Debug partition
#SBATCH --qos=debug_8GB          # Debug QoS level
#SBATCH --job-name=debug_job     # Job name
#SBATCH -o slurm.%N.%j.out       # File containing STDOUT output
#SBATCH -e slurm.%N.%j.err       # File containing STDERR output

echo "Running job in the debug partition"

python3 evaluate_trained_model.py --image_path /nas-ctm01/datasets/public/MEDICAL/MIMIC-CXR/