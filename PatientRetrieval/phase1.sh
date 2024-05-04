#!/bin/bash
#
#SBATCH --partition=gpu_min32gb    # Debug partition
#SBATCH --qos=gpu_min32gb          # Debug QoS level
#SBATCH --job-name=phase1     # Job name
#SBATCH -o /nas-ctm01/homes/fpcampos/slurm_logs/retrieval/%x_%j_%N.out  # File containing STDOUT output
#SBATCH -e /nas-ctm01/homes/fpcampos/slurm_logs/retrieval/%x_%j_%N.err  # File containing STDERR output

# Echo date and time to output file
date

python3 paper_retrieval_training_phase1.py --config_path './config_files/' --config 'config_CELEB_phase1.json'
