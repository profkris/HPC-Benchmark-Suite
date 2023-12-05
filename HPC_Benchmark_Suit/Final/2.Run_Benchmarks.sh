#!/bin/bash

CURRENT_DIR=$(pwd)

Benchmark_path=$CURRENT_DIR/../Run

#Benchmark_path="/home/hpctechtest/sanket/Benchmark_Suit/Run"


while true; do
    clear
    echo "Choose an option:"
    echo "1. Run HPL"
    echo "2. Run HPCG"
    echo "3. Run IO500"
    echo "4. Run SHOC"
    echo "5. Run OSU"
    echo "6. Run STREAM"
    echo "7. Run ALL"
    echo "8. Exit"

    read -p "Enter the number of your choice: " choice
    echo ""

    case $choice in
        1)
            echo "Working on HPL Benchmark ..."
            echo ""
            #source $Benchmark_path/HPL/1.HPL_running.sh
            source $Benchmark_path/HPL/3.HPL_running.sh
            ;;
        2)
            echo "Working on HPCG ..."
            echo ""
            source $Benchmark_path/HPCG/3.HPCG_running.sh
            ;;
        3)
            echo "Working on IO500 Benchmark ..."
            source $Benchmark_path/IO500/2.IO500_Running_v2.sh
            ;;
        4)
            echo "Working on SHOC Benchmark ..."
            echo ""
            source $Benchmark_path/SHOC/1.Running_shoc.sh
            ;;
        5)
            echo "Working on OSU Benchmark ..."
            echo ""
            source $Benchmark_path/OSU/1.Running_OSU.sh
            ;;
        6)
            echo "Working on STREAM Benchmark .."
            source $Benchmark_path/STREAM/1.STREAM_running.sh
            echo ""

            ;;
        7)
            echo "Installing ALL Benchmarks .."
            source $Benchmark_path/HPL/Script/6.Full_HPL.sh
            source $Benchmark_path/HPCG/Script/4.Full_HPCG.sh
            source $Benchmark_path/IO500/Script/4.Full_IO500.sh
            source $Benchmark_path/SHOC/Script/5.Full_SHOC.sh
            source $Benchmark_path/OSU/Script/4.Full_OSU.sh
            source $Benchmark_path/STREAM/Script/4.Full_STREAM.sh
            ;;
        8)
            echo ""
            break
            ;;
        *)
            echo "Invalid option. Please choose a valid option (1-7)."
            ;;
    esac

    read -p "Press Enter to continue..."
done
