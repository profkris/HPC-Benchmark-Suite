#!/bin/bash

echo "-----------------------------------"
echo "| Running PFIND Test ....          |"
echo "-----------------------------------"

export OMPI_MCA_btl=^openib

read -p "Enter number of Processes : " num_process
read -p "Enter maximum number of elements to process : " max_elements
read -p "Parallelize single directory access [option 1=hashing, option 2=sequential] : " Access

mpiexec -n $num_process pfind ../../Setup/IO500/Installation_Path/io500/test/ -C -M $max_elements -H $Access -P > "$ROOT_DIR/Current_Benchmark/$FOLDER/PFIND.txt"

cd -

echo "-----------------------------------"
echo "| PFIND Test Completed ...         |"
echo "-----------------------------------"
