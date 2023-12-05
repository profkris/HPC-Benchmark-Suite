#!/bin/bash

echo "-----------------------------------"
echo "| Running IOR Test ....            |"
echo "-----------------------------------"

export OMPI_MCA_btl=^openib

read -p "Enter number of Processes : "  num_process
read -p "Enter testing data size (In MB's eg. 1m) :"  test_size 
read -p "Enter Block data size (In MB's eg. 1m) : " block_size

mpirun -n $num_process ior -w -t $test_size -b $block_size  > "$ROOT_DIR/Current_Benchmark/$FOLDER/IOR.txt"

cd -

echo "-----------------------------------"
echo "| IOR Test Completed ...           |"
echo "-----------------------------------"
