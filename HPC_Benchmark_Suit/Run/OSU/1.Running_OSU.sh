#!/bin/bash

ROOT_DIR=$CURRENT_DIR/../Run/OSU

FOLDER=$(date +'%Y-%m-%d_%H:%M:%S')

#-----------------------------------------------------------------------------------------

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
   mv $ROOT_DIR/Current_Benchmark/*/ $ROOT_DIR/OSU_Benchmark/

else
   echo "NO Old Benchmark Data Found"
fi

#-------------------------------------------------------------------------------------------

#mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER

while true; do
   echo ""
   echo "Choose an option:"
   echo "1. Run OSU_BW test"
   echo "2. Run OSU_ALLtoALL test"
   echo "3. RUN BOTH Tests"
   echo "4. EXIT"
   echo ""

   read -p "Enter your choice: " choice

   case $choice in

    1)
      mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER
      sbatch $ROOT_DIR/Test/osu_bw_test.sh
      ;;

    2)
      mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER
      sbatch $ROOT_DIR/Test/osu_alltoall_test.sh
      #sbatch  $ROOT_DIR/Test/testh.sh
      ;;

    3)
      mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER
      sbatch $ROOT_DIR/Test/osu_all_test.sh
     ;;

    4)
     echo "Bye .."
     break
     ;;

    *)
     echo "Invalid option .. Choose (1-4)"
     ;;

   esac

   read -p "Press Enter to Continue ..."
done

