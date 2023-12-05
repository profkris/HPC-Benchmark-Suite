#!/bin/bash

echo "-----------------------------------"
echo "| Running MD Test ....          |"
echo "-----------------------------------"

export OMPI_MCA_btl=^openib

read -p "Enter number of Processes : " num_process
read -p "Enter number of Dir/Files to be created  : " num_dir

mpirun -np $num_process mdtest -n $num_dir > "$ROOT_DIR/Current_Benchmark/$FOLDER/MDtest.txt"

cd -

echo "-----------------------------------"
echo "| MD Test Completed ...         |"
echo "-----------------------------------"
