#!/bin/bash


export dep_path=$CURRENT_DIR/../Setup/SHOC/Dependencies
export I_path=$CURRENT_DIR/../Setup/SHOC/Installation_Path


if [ -d "$I_path/gcc-7.5.0/my_bin" ]; then

    export PATH=$I_path/gcc-7.5.0/my_bin/bin:$PATH

    export INCLUDE=$I_path/gcc-7.5.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$I_path/gcc-7.5.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$I_path/gcc-7.5.0/my_bin/lib64:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                GCC Loaded                   |"
    echo "----------------------------------------------"



else


    tar -xvf $dep_path/gcc-7.5.0.tar.gz

    cd gcc-7.5.0

    bash ./contrib/download_prerequisites

    mkdir my_bin

    bash ./configure --prefix=$I_path/gcc-7.5.0/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$I_path/gcc-7.5.0/my_bin/bin:$PATH

    export INCLUDE=$I_path/gcc-7.5.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$I_path/gcc-7.5.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$I_path/gcc-7.5.0/my_bin/lib64:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                GCC Installed                 |"
    echo "----------------------------------------------"

fi

#-----------------------------------------------------------------------------------


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


fi

#-----------------------------------------------------------------------------------


if [ -d "$I_path/cuda_bin/bin" ]; then
   echo " "

    export PATH=$I_path/cuda_bin/bin:$PATH
    export INCLUDE=$I_path/cuda_bin/include:$INCLUDE
    export LD_LIBRARY_PATH=$I_path/cuda_bin/lib64:$LD_LIBRARY_PATH


   echo "----------------------------------------------"
   echo "|          Cuda Loaded ...                    |"
   echo "----------------------------------------------"


else

    mkdir $I_path/cuda_bin/

    bash  $dep_path/cuda_10.1.243_418.87.00_linux.run --silent --override --toolkit --toolkitpath=$I_path/cuda_bin/ --librarypath=$I_path/cuda_bin/

    export PATH=$I_path/cuda_bin/bin:$PATH
    export INCLUDE=$I_path/cuda_bin/include:$INCLUDE
    export LD_LIBRARY_PATH=$I_path/cuda_bin/lib64:$LD_LIBRARY_PATH

   echo "----------------------------------------------"
   echo "|          CUDA Installed Successfully        |"
   echo "----------------------------------------------"

fi


#-------------------------------------------------------------------------


if [ -d "$I_path/shoc/my_bin" ]; then

    echo ""

    export PATH=$I_path/shoc/my_bin/bin:$PATH

    export LD_LIBRARY_PATH=$I_path/shoc/my_bin/libexec:$LD_LIBRARY_PATH


    echo "----------------------------------------------"
    echo "|                SHOC Benchmark Installed     |"
    echo "----------------------------------------------"


else


    tar -xvf $dep_path/shoc.tar.gz

    cd shoc

    mkdir my_bin

    bash ./configure --prefix=$I_path/shoc/my_bin --with-cuda --without-opencl --with-mpi

    make -j40

    make install

    export PATH=$I_path/shoc/my_bin/bin:$PATH

    export LD_LIBRARY_PATH=$I_path/shoc/my_bin/libexec:$LD_LIBRARY_PATH

    cd ..

    echo "----------------------------------------------"
    echo "|                SHOC Benchmark Installed     |"
    echo "----------------------------------------------"


fi

