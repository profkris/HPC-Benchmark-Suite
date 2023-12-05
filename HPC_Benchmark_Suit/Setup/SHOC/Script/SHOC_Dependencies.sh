#!/bin/bash

#CURRENT_DIR=$(pwd)

Benchmark_path=$CURRENT_DIR/../Setup

#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For SHOC Benchmark                      "
echo "-------------------------------------------------------------------------------"


cd $Benchmark_path/SHOC/Dependencies

wget https://ftp.gnu.org/gnu/gcc/gcc-7.5.0/gcc-7.5.0.tar.gz --no-check-certificate

wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz  --no-check-certificate

wget https://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_418.87.00_linux.run  --no-check-certificate

git clone https://github.com/vetter/shoc.git

tar -cvf shoc.tar.gz shoc/ 

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For SHOC Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"


cd -
