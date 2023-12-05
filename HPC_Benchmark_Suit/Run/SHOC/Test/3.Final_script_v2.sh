#!/bin/bash

#SBATCH --job-name=SHOC_Benchmark        
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:30:00
#SBATCH --output=%j.out
##SBATCH --error=%j.err
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1


export ROOT_DIR=/home/hpctechtest/sanket/Benchmark_Suit/Run/SHOC

source /home/hpctechtest/sanket/Benchmark_Suit/Setup/SHOC/Script/5.Full_SHOC.sh

shocdriver -n 1 -d 2 -s 1  -cuda

echo $FOLDER

mv "$SLURM_JOBID.out" $ROOT_DIR/shoc_benchmark.txt

mv "$ROOT_DIR/shoc_benchmark.txt" $ROOT_DIR/Current_Benchmark/*/


mv ./Logs $ROOT_DIR/Current_Benchmark/*/

 #mv ../Logs  ./Current_Benchmark/*/

mv ./results.csv $ROOT_DIR/Current_Benchmark/*/

 #mv ../results.csv ./Current_Benchmark/*/



