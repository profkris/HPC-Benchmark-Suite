#!/bin/bash

#SBATCH --job-name=SHOC_Benchmark        
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:30:00
#SBATCH --output=%j.out
##SBATCH --error=%j.err
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1

#cd /home/hpctechtest/sanket/Benchmark_Suit/Run/SHOC/test

export DIR=/home/hpctechtest/sanket/Benchmark_Suit/Run/SHOC/

source /home/hpctechtest/sanket/Benchmark_Suit/Setup/SHOC/Script/5.Full_SHOC.sh

shocdriver -n 1 -d 2 -s 1  -cuda



mv $DIR/$SLURM_JOBID.out ./SHOC/Current_Benchmark/*/shoc_benchmark.txt

mv ../Logs  ./Current_Benchmark/*/

mv ../results.csv ./Current_Benchmark/*/


