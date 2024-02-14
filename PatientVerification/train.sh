#!/bin/bash
#
#SBATCH --partition=gpu_min24GB  # Partition where the job will be run. Check with "$ sinfo".
#SBATCH --qos=gpu_min24GB_ext        # QoS level. Must match the partition name. External users must add the suffix "_ext". Check with "$sacctmgr show qos".
#SBATCH --job-name=medfusion_diffusion    # Job name
#SBATCH -o slurm.%N.%j.out       # File containing STDOUT output
#SBATCH -e slurm.%N.%j.err       # File containing STDERR output. If ommited, use STDOUT.

python3 main.py --config_path ./config_files/ --config config.json