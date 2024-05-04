#!/bin/bash
#
#SBATCH --partition=gpu_min8GB    # Debug partition
#SBATCH --qos=gpu_min8GB_ext          # Debug QoS level
#SBATCH --job-name=phase2     # Job name
#SBATCH -o /nas-ctm01/homes/fpcampos/slurm_logs/retrieval/%x_%j_%N.out  # File containing STDOUT output
#SBATCH -e /nas-ctm01/homes/fpcampos/slurm_logs/retrieval/%x_%j_%N.err  # File containing STDERR output

echo "Job started"

python3 paper_retrieval_training_phase2.py --config_path './config_files/' --config 'config_CELEB_phase2.json'

