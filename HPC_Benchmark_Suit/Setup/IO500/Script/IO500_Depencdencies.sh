#!/bin/bash

#CURRENT_DIR=$(pwd)

Benchmark_path=$CURRENT_DIR/../Setup

#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For IO500 Benchmark                      "
echo "-------------------------------------------------------------------------------"

cd $Benchmark_path/IO500/Dependencies

wget https://ftp.gnu.org/gnu/gcc/gcc-11.3.0/gcc-11.3.0.tar.gz --no-check-certificate

wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz  --no-check-certificate

git clone https://github.com/IO500/io500.git

tar -cvf io500.tar.gz io500

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For IO500 Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"

cd -
