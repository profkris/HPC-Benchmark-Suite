#!/bin/bash

CURRENT_DIR=$(pwd)

Benchmark_path=$CURRENT_DIR/../Setup

while true; do
    clear
    echo "Choose an option:"
    echo "1. Install HPL"
    echo "2. Install HPCG"
    echo "3. Install IO500"
    echo "4. Install SHOC"
    echo "5. Install OSU"
    echo "6. Install STREAM"
    echo "7. Install ALL"
    echo "8. Exit"

    read -p "Enter the number of your choice: " choice
    echo ""
    
    case $choice in
        1)
            echo ""
            source $Benchmark_path/HPL/Script/HPL_Dependencies.sh
            echo ""
            echo "Working on HPL Benchmark ..."
            echo ""
            source $Benchmark_path/HPL/Script/6.Full_HPL.sh
	    
            ;;
        2)
            echo ""
            source $Benchmark_path/HPCG/Script/HPCG_Dependencies.sh
            echo ""
            echo "Working on HPCG ..."
            echo ""
            source $Benchmark_path/HPCG/Script/4.Full_HPCG.sh
            ;;
        3)
            echo ""
            source $Benchmark_path/IO500/Script/IO500_Depencdencies.sh
            echo ""
            echo "Working on IO500 Benchmark ..."
	    source $Benchmark_path/IO500/Script/4.Full_IO500.sh
            ;;
        4)
            echo ""
            source $Benchmark_path/SHOC/Script/SHOC_Dependencies.sh
            echo ""
            echo "Working on SHOC Benchmark ..."
            echo ""
            source $Benchmark_path/SHOC/Script/5.Full_SHOC.sh
            ;;
        5)
            echo ""
            source $Benchmark_path/OSU/Script/OSU_dependencies.sh
            echo ""
            echo "Working on OSU Benchmark ..."
            echo ""
            source $Benchmark_path/OSU/Script/4.Full_OSU.sh
            ;;
        6)
            echo ""
            source $Benchmark_path/STREAM/Script/STREAM_Dependencies.sh
            echo ""

            echo "Working on STREAM Benchmark .."
            source $Benchmark_path/STREAM/Script/4.Full_STREAM.sh
            echo ""
            
            ;;
        7)

            echo "Installing ALL Benchmarks .."
            source $Benchmark_path/HPL/Script/HPL_Dependencies.sh
            source $Benchmark_path/HPL/Script/6.Full_HPL.sh
            
            source $Benchmark_path/HPCG/Script/HPCG_Dependencies.sh
            source $Benchmark_path/HPCG/Script/4.Full_HPCG.sh
            
            source $Benchmark_path/IO500/Script/IO500_Depencdencies.sh
            source $Benchmark_path/IO500/Script/4.Full_IO500.sh
 
            source $Benchmark_path/SHOC/Script/SHOC_Dependencies.sh
            source $Benchmark_path/SHOC/Script/5.Full_SHOC.sh

            source $Benchmark_path/OSU/Script/OSU_dependencies.sh
            source $Benchmark_path/OSU/Script/4.Full_OSU.sh
 
            source $Benchmark_path/STREAM/Script/STREAM_Dependencies.sh
            source $Benchmark_path/STREAM/Script/4.Full_STREAM.sh
            ;;
        8)
	   # echo "Bye ..."
            break 
            ;;
        *)
            echo "Invalid option. Please choose a valid option (1-7)."
            ;;
    esac

    read -p "Press Enter to continue..."
done

echo ".... Thank You For Using HPC Benchmark Suite ...."
