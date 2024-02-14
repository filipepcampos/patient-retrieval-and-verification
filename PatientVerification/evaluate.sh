#!/bin/bash
#
#SBATCH --partition=gpu_min8GB  # Partition where the job will be run. Check with "$ sinfo".
#SBATCH --qos=gpu_min8GB_ext        # QoS level. Must match the partition name. External users must add the suffix "_ext". Check with "$sacctmgr show qos".
#SBATCH --job-name=medfusion_diffusion    # Job name
#SBATCH -o slurm.%N.%j.out       # File containing STDOUT output
#SBATCH -e slurm.%N.%j.err       # File containing STDERR output. If ommited, use STDOUT.

python3 evaluate_trained_model.py --image_path /nas-ctm01/datasets/public/MEDICAL/MIMIC-CXR/