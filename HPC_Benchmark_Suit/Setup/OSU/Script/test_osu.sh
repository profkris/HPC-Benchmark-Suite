#!/bin/bash

#SBATCH --job-name=osu_latency
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:10:00
#SBATCH --output=%j_osu_latency.out
#SBATCH --error=%j_osu_latency.err


source /home/hpctechtest/sanket/Benchmark_Suit/Setup/OSU/Script/4.Full_OSU.sh

export OMPI_MCA_btl=^openib

mpirun -np 3 osu_bw

