#!/bin/bash


ROOT_DIR=$CURRENT_DIR/../Run/HPCG

cd $ROOT_DIR

export HPCG_dat=~/sanket/Benchmark_Suit/Setup/HPCG/Installation_Path/hpcg-3.1/bin

found=0

for file in $ROOT_DIR/Current_Benchmark/*/* ; do
    if [ -f "$file" ]; then
        found=1  
        break   
    fi
done


if [ "$found" -eq 1 ]; then
   echo "Moving Old Benchmark Data"
   echo ""
   mv $ROOT_DIR/Current_Benchmark/* $ROOT_DIR/HPCG_Benchmarks/

else
   echo "NO Old Benchmark Data Found"
fi

#-----------------------------------------------------------

#cp $HPCG_dat/hpcg.dat $ROOT_DIR/

read -p "Enter the number of MPI processes: " num_procs

mpirun -np $num_procs xhpcg $ROOT_DIR/hpl.data

#-----------------------------------------------------------

current_datetime=$(date +'%Y-%m-%d_%H-%M')

file1_name="HPCG-Benchmark_3.1_$current_datetime"


if [ -f $file1_name*  ]; then
   echo "Benchmark Files generated"
   mkdir -p $ROOT_DIR/Current_Benchmark/$(date +'%Y-%m-%d_%H:%M:%S')
   
   mv *.txt $ROOT_DIR/Current_Benchmark/$(date +'%Y-%m-%d_%H:%M:%S')

else
    echo "Benchmark File NOT Generated"

fi

cd -
