#!/bin/bash

#SBATCH --job-name=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:30:00
#SBATCH --output=%j.out
##SBATCH --error=%j.err
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1

echo "Hello"

#mv ./$SLURM_JOBID.out worked.txt

mv $ROOT_DIR$SLURM_JOBID.out worked.txt

#mv worked.txt ./Current_Benchmark/

#mv ../Logs ./Current_Benchmark/

#mv ../results.csv ./Current_Benchmark/


