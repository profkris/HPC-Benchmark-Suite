#!/bin/bash


ROOT_DIR=$CURRENT_DIR/../Run/SHOC

FOLDER=$(date +'%Y-%m-%d_%H:%M:%S')

#------------------------------------------------------------------------------------------

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
   mv $ROOT_DIR/Current_Benchmark/*/ $ROOT_DIR/SHOC_Benchmarks/

else
   echo "NO Old Benchmark Data Found"
fi

#-------------------------------------------------------------------------------------------


mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER

#sbatch $ROOT_DIR/Test/slurm_script.sh

sbatch $ROOT_DIR/Test/3.Final_script_v2.sh

#sbatch $ROOT_DIR/Test/test.sh

