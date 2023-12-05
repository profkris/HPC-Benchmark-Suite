#!/bin/bash

#CURRENT_DIR=$(pwd)

Benchmark_path=$CURRENT_DIR/../Setup

#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For STREAM Benchmark                      "
echo "-------------------------------------------------------------------------------"

cd $Benchmark_path/STREAM/Dependencies

wget https://ftp.gnu.org/gnu/gcc/gcc-11.3.0/gcc-11.3.0.tar.gz --no-check-certificate

wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz  --no-check-certificate

git clone https://github.com/intel/memory-bandwidth-benchmarks.git

tar -cvf memory-bandwidth-benchmarks.tar.gz memory-bandwidth-benchmarks

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For STREAM Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"


cd -

