#!/bin/bash

ROOT_DIR=$CURRENT_DIR/../Run/STREAM

STREAM_PATH=$CURRENT_DIR/../Setup/STREAM/Installation_Path

FOLDER=$(date +'%Y-%m-%d_%H:%M:%S')

#-------------------------------------------------------------------------------------

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
   mv $ROOT_DIR/Current_Benchmark/*/ $ROOT_DIR/STREAM_Benchmarks/

else
   echo "NO Old Benchmark Data Found"
fi


#---------------------------------------------------------------------------------------

mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER

cd $STREAM_PATH/memory-bandwidth-benchmarks/

bash run.sh

mv Intel-Xeon-Gold-6248-CPU--2.50GHz/nt/* $ROOT_DIR/Current_Benchmark/$FOLDER/

cd - 

