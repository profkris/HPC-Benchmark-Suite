#!/bin/bash

#CURRENT_DIR=$(pwd)

Benchmark_path=$CURRENT_DIR/../Setup


#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For HPCG Benchmark                      "
echo "-------------------------------------------------------------------------------"


cd $Benchmark_path/HPCG/Dependencies

wget https://ftp.gnu.org/gnu/gcc/gcc-11.3.0/gcc-11.3.0.tar.gz --no-check-certificate

wget https://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz --no-check-certificate

wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz  --no-check-certificate

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For HPCG Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"


cd -

