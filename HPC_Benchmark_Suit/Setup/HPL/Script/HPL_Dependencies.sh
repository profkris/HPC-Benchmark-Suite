#!/bin/bash

#CURRENT_DIR=$(pwd)

Benchmark_path=$CURRENT_DIR/../Setup

#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For HPL Benchmark                      "
echo "-------------------------------------------------------------------------------"


cd $Benchmark_path/HPL/Dependencies

wget https://ftp.gnu.org/gnu/gcc/gcc-11.3.0/gcc-11.3.0.tar.gz --no-check-certificate

wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz  --no-check-certificate

wget https://github.com/xianyi/OpenBLAS/releases/download/v0.3.24/OpenBLAS-0.3.24.tar.gz --no-check-certificate

wget https://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz --no-check-certificate

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For HPL Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"


cd -
