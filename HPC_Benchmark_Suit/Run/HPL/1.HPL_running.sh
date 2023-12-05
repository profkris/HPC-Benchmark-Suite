#!/bin/bash


ROOT_DIR=$CURRENT_DIR/../Run/HPL/

cd $ROOT_DIR

script_dir=/home/hpctechtest/sanket/Benchmark_Suit/Run/HPL

current_datetime=$(date +'%Y-%m-%d_%H:%M:%S')

# Define the path to HPL.dat
#HPL_DAT="$script_dir/HPL.dat"

#--------------------------------------

if [ -f $ROOT_DIR/Current_Benchmark/*/*.txt ]; then
   echo "Moving Old Benchmark Data"
   echo ""
   mv $ROOT_DIR/Current_Benchmark/* $ROOT_DIR/HPL_Benchmarks/

else
   echo "NO Old Benchmark Data Found"
fi




#---------------------------------------




# Prompt the user for input
read -p "Enter the matrix size (N): " N
read -p "Enter the block size (NB): " NB
read -p "Enter the number of processes (P): " P
read -p "Enter the number of threads per process (Q): " Q
read -p "Number of MPI process : " MPI

# Update the HPL.dat file with user-defined parameters
cat <<EOF > "$script_dir/HPL.dat"
HPLinpack benchmark input file
Innovative Computing Laboratory, University of Tennessee
HPL.out
6            device out (6=stdout,7=stderr,file)
$N            # of problems sizes (N)
1000         Ns
1            # of NBs
$NB          NBs
0            PMAP process mapping (0=Row-,1=Column-major)
1            # of process grids (P x Q)
$P           Ps
$Q            Qs
16.0         threshold
3            # of panel fact
2            PFACTs (0=left, 1=Crout, 2=Right)
1            # of recursive stopping criteria
2            NBMINs (>= 1)
1            # of panels in recursion
2            NDIVs
1            # of recursive panel fact.
1            RFACTs (0=left, 1=Crout, 2=Right)
1            # of broadcast
1            BCASTs (0=1rg,1=1rM,2=2rg,3=2rM,4=Lng,5=LnM)
1            # of lookahead depth
1            DEPTHs (>=0)
2            SWAP (0=bin-exch,1=long,2=mix)
64           swapping threshold
0            L1 in (0=transposed,1=no-transposed) form
0            U  in (0=transposed,1=no-transposed) form
1            Equilibration (0=no,1=yes)
8            memory alignment in double (> 0)

EOF

# Run the HPL benchmark
HPL_BIN="./path/to/hpl_executable"  # Replace with the actual path to your HPL executable

export OMPI_MCA_btl=^openib

mkdir -p $ROOT_DIR/Current_Benchmark/$current_datetime/

#mpirun -np $MPI xhpl HPL.dat > ./Current_Benchmark/$current_datetime/$current_datetime.txt
mpirun -np $MPI xhpl $script_dir/HPL.dat > $ROOT_DIR/Current_Benchmark/$current_datetime/$current_datetime.txt


echo "HPL benchmark completed."

cd -
