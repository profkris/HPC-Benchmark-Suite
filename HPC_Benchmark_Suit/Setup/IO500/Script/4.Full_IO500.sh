#!/bin/bash

#$CURRENT_DIR/../Setup
export dep_path=$CURRENT_DIR/../Setup/IO500/Dependencies
export I_path=$CURRENT_DIR/../Setup/IO500/Installation_Path

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

#------------------------------------------------------------------------------------------------

if [ -d "$I_path/io500/bin" ]; then
   echo " "
   export PATH=$I_path/io500/bin:$PATH
   export LD_LIBRARY_PATH=$I_path/io500/lib:$LD_LIBRARY_PATH
   export INCLUDE=$I_path/io500/include:$INCLUDE

   echo "----------------------------------------------"
   echo "|          IO500 Already Installed ..        |"
   echo "----------------------------------------------"


else

    tar -xvf $dep_path/io500.tar.gz

    cd io500

    bash prepare.sh

    rm ./bin/pfind

    if [ ! -d "$I_path/io500/" ]; then
        mkdir -p "$I_path/io500/"
    fi

    if [ ! -d "$I_path/hpcg-3.1/bin" ]; then
        cp -r ./bin $I_path/io500/
        cp -r ./include $I_path/io500/
        cp -r ./lib $I_path/io500/
        cp -r ./build/pfind/pfind $I_path/io500/bin/
        cp -r ./test/ $I_path/io500/
    fi

    export PATH=$I_path/io500/bin:$PATH
    export LD_LIBRARY_PATH=$I_path/io500/lib:$LD_LIBRARY_PATH
    export INCLUDE=$I_path/io500/include:$INCLUDE

   cd ..

   echo "----------------------------------------------"
   echo "|          IO500 Installed Successfully        |"
   echo "----------------------------------------------"

fi


