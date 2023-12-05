#!/bin/bash

#SBATCH --job-name=osu_latency
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:10:00
#SBATCH --output=%j.out
##SBATCH --error=%j_osu_latency.err

ROOT_DIR=/home/hpctechtest/sanket/Benchmark_Suit/Run/OSU
source /home/hpctechtest/sanket/Benchmark_Suit/Setup/OSU/Script/4.Full_OSU.sh

export OMPI_MCA_btl=^openib


mpirun -np 2 osu_alltoall

mv "$SLURM_JOBID.out" osu_AlltoAll.txt

mv osu_AlltoAll.txt $ROOT_DIR/Current_Benchmark/*/
