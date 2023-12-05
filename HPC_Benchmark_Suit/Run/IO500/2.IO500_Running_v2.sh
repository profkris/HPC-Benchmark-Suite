#!/bin/bash

ROOT_DIR=$CURRENT_DIR/../Run/IO500

cd $ROOT_DIR

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
   mv $ROOT_DIR/Current_Benchmark/*/ $ROOT_DIR/IO500_Benchmark/

else
   echo "NO Old Benchmark Data Found"
fi

#-------------------------------------------------------------------------------------------

#mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER

echo "--------------------------------------------------------------------------------------"
echo "|    IF YOU WANT TO RUN ALL CASES CHOOSE OPTION NUMBER : 4                            |"
echo "-------------------------------------------------------------------------------------"



while true; do
   echo "Choose an option:"
   echo "1. Run IOR test"
   echo "2. Run MDtest"
   echo "3. Run PFIND"
   echo "4. RUN ALL TESTS"
   echo "5. EXIT"

   read -p "Enter your choice: " choice

   case $choice in
    
    1)
      mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER 
      source $ROOT_DIR/IO500_tests/1.IOR_test.sh
      ;;

    2) 
     mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER
     source $ROOT_DIR/IO500_tests/2.MD_test.sh
     ;;

    3) 
     mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER
     source $ROOT_DIR/IO500_tests/3.PFind_test.sh
     ;;

    4)
     mkdir -p $ROOT_DIR/Current_Benchmark/$FOLDER
     echo "RUNNING ALL TESTS .....WAIT "
     echo ""
     source $ROOT_DIR/IO500_tests/1.IOR_test.sh
     source $ROOT_DIR/IO500_tests/2.MD_test.sh
     source $ROOT_DIR/IO500_tests/3.PFind_test.sh
     
     ;;

    5)
     echo "Bye .."
     exit 0;
     ;;

   esac
   
   read -p "Press Enter to Continue ..."
done

cd -
