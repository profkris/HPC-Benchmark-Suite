#!/bin/bash

#SBATCH --job-name=osu_latency
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:10:00
#SBATCH --output=%j.out
##SBATCH --error=%j_osu_latency.err

#FOLDER=$(date +'%Y-%m-%d_%H:%M:%S')

ROOT_DIR=/home/hpctechtest/sanket/Benchmark_Suit/Run/OSU
source /home/hpctechtest/sanket/Benchmark_Suit/Setup/OSU/Script/4.Full_OSU.sh


export OMPI_MCA_btl=^openib


mpirun -np 2 osu_bw

mv "$SLURM_JOBID.out" osu_bw.txt

mv osu_bw.txt $ROOT_DIR/Current_Benchmark/*/


