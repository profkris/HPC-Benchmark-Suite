#!/bin/bash


export dep_path=$CURRENT_DIR/../Setup/HPCG/Dependencies
export I_path=$CURRENT_DIR/../Setup/HPCG/Installation_Path

if [ -d "$I_path/gcc-11.3.0/my_bin" ]; then

    echo ""

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

    cd ..

    echo "----------------------------------------------"
    echo "|                GCC Installed                 |"
    echo "----------------------------------------------"

    

fi
#-------------------------------------------------------------------

if [ -d "$I_path/openmpi-4.1.4/my_bin" ]; then

    echo ""
 
    export PATH=$I_path/openmpi-4.1.4/my_bin/bin:$PATH

    export INCLUDE=$I_path/openmpi-4.1.4/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$I_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                OpenMP Loaded                |"
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
    echo "|                OpenMP Installed             |"
    echo "----------------------------------------------"


fi

#------------------------------------------------------------------------------------------------

#Here we have bin 
if [ -d "$I_path/hpcg-3.1/bin" ]; then
   echo " "
   export PATH=$I_path/hpcg-3.1/bin:$PATH

   echo "----------------------------------------------"
   echo "|          HPCG Already Installed ..        |"
   echo "----------------------------------------------"


else

    tar -xvf $dep_path/hpcg-3.1.tar.gz

    cd hpcg-3.1

    make -j40 arch=Linux_MPI

    make install

   if [ ! -d "$I_path/hpcg-3.1/" ]; then
        mkdir -p "$I_path/hpcg-3.1/"    
   fi

   if [ ! -d "$I_path/hpcg-3.1/bin" ]; then
        cp -r ./bin $I_path/hpcg-3.1/bin
   fi


   export PATH=$I_path/hpcg-3.1/bin:$PATH

   cd .. 

   echo "----------------------------------------------"
   echo "|          HPCG Installed Successfully        |"
   echo "----------------------------------------------"

fi
