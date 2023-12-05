#!/bin/bash

#SBATCH --job-name=osu_latency
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:10:00
#SBATCH --output=%j.out


FOLDER=$(date +'%Y-%m-%d_%H:%M:%S')
 

echo "worked"

#mv "$SLURM_JOBID.out" worked.out

