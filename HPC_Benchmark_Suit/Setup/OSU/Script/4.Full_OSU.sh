#!/bin/bash


$CURRENT_DIR/../Setup

export dep_path=$CURRENT_DIR/../Setup/OSU/Dependencies
export I_path=$CURRENT_DIR/../Setup/OSU/Installation_Path
export OSU_path=$CURRENT_DIR/../Setup/OSU/Dependencies/osu-micro-benchmarks-5.6.2/my_bin/libexec/osu-micro-benchmarks/mpi

#MPICC=$(which mpicc)
#MPICXX=$(which mpicxx)

if [ -d "$I_path/gcc-11.3.0/my_bin" ]; then

    export PATH=$I_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$I_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$I_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$I_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                GCC Loaded                   |"
    echo "----------------------------------------------"

else

    tar -xvf $dep_path/gcc-11.3.0.tar.gz

    cd gcc-11.3.0

    bash ./contrib/download_prerequisites

    mkdir my_bin

    bash ./configure --prefix=$I_path/gcc-11.3.0/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$I_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$I_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$I_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$I_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                GCC Installed                 |"
    echo "----------------------------------------------"

fi

#-------------------------------------------------------------------------------

if [ -d "$I_path/openmpi-4.1.4/my_bin" ]; then

    echo ""

    export PATH=$I_path/openmpi-4.1.4/my_bin/bin:$PATH

    export INCLUDE=$I_path/openmpi-4.1.4/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$I_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                OpenMPI Loaded                |"
    echo "----------------------------------------------"

else


    tar -xvf $dep_path/openmpi-4.1.4.tar.gz

    cd openmpi-4.1.4

    mkdir my_bin

    bash ./configure --prefix=$I_path/openmpi-4.1.4/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$I_path/openmpi-4.1.4/my_bin/bin:$PATH

    export INCLUDE=$I_path/openmpi-4.1.4/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$I_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

    cd ..

    echo "----------------------------------------------"
    echo "|                OpenMPI Installed             |"
    echo "----------------------------------------------"

    MPICC=$(which mpicc)
    MPICXX=$(which mpicxx)


fi

#-------------------------------------------------------------------------


if [ -d "$I_path/osu-micro-benchmarks-5.6.2/my_bin" ]; then
   echo " "

    export PATH=$OSU_path/collective:$PATH
    export PATH=$OSU_path/one-sided:$PATH
    export PATH=$OSU_path/pt2pt:$PATH
    export PATH=$OSU_path/startup:$PATH


   echo "----------------------------------------------"
   echo "|          OSU Already Installed ..           |"
   echo "----------------------------------------------"


else

    tar -xvf $dep_path/osu-micro-benchmarks-5.6.2.tar.gz

    cd osu-micro-benchmarks-5.6.2

    mkdir my_bin

    ./configure CC=$MPICC CXX=$MPICXX --prefix=$I_path/osu-micro-benchmarks-5.6.2/my_bin

    make -j40

    make install

    export PATH=$OSU_path/collective:$PATH
    export PATH=$OSU_path/one-sided:$PATH
    export PATH=$OSU_path/pt2pt:$PATH
    export PATH=$OSU_path/startup:$PATH

   cd ..

   echo "----------------------------------------------"
   echo "|          OSU Installed Successfully        |"
   echo "----------------------------------------------"

fi

