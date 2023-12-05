#!/bin/bash


export dep_path=$CURRENT_DIR/../Setup/HPL/Dependencies
export I_path=$CURRENT_DIR/../Setup/HPL/Installation_Path

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

    cd ..

    echo "----------------------------------------------"
    echo "|                GCC Installed                 |"
    echo "----------------------------------------------"

fi

#------------------------------------------------------------------------------------------

if [ -d "$I_path/openmpi-4.1.4/my_bin/" ]; then

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

#-----------------------------------------------------------------------------------------------

if [ -d "$I_path/OpenBLAS-0.3.24/my_bin" ]; then
   
   export PATH=$I_path/OpenBLAS-0.3.24/my_bin/bin:$PATH

   export INCLUDE=$I_path/OpenBLAS-0.3.24/my_bin/include:$INCLUDE

   export LD_LIBRARY_PATH=$I_path/OpenBLAS-0.3.24/my_bin/lib:$LD_LIBRARY_PATH


  echo "----------------------------------------------"
  echo "|                OpenBlas Loaded              |"
  echo "----------------------------------------------"

else

  tar -xvf $dep_path/OpenBLAS-0.3.24.tar.gz

  cd OpenBLAS-0.3.24

  mkdir my_bin

  make -j40 PREFIX=$I_path/OpenBLAS-0.3.24/my_bin

  make  PREFIX=$I_path/OpenBLAS-0.3.24/my_bin install

  export PATH=$I_path/OpenBLAS-0.3.24/my_bin/bin:$PATH

  export INCLUDE=$I_path/OpenBLAS-0.3.24/my_bin/include:$INCLUDE

  export LD_LIBRARY_PATH=$I_path/OpenBLAS-0.3.24/my_bin/lib:$LD_LIBRARY_PATH

  cd ..

  echo "----------------------------------------------"
  echo "|                OpenBlas Installed             |"
  echo "----------------------------------------------"

fi
#--------------------------------------------------------------------------


if [ -d "$I_path/hpl-2.3/my_bin/" ]; then

  export PATH=$I_path/hpl-2.3/my_bin/bin:$PATH

  #export INCLUDE=$I_path/hpl-2.3/my_bin/include:$INCLUDE

  export LD_LIBRARY_PATH=$I_path/hpl-2.3/my_bin/lib:$LD_LIBRARY_PATH

  #export LD_LIBRARY_PATH=$I_path/hpl-2.3/my_bin/lib64:$LD_LIBRARY_PATH

  echo "----------------------------------------------"
  echo "|              HPL Loaded                     |"
  echo "----------------------------------------------"  

else

  tar -xvf $dep_path/hpl-2.3.tar.gz

  cd hpl-2.3

  mkdir my_bin

  bash ./configure --prefix=$I_path/hpl-2.3/my_bin --disable-multilib

  make -j40

  make install

  export PATH=$I_path/hpl-2.3/my_bin/bin:$PATH

  #export INCLUDE=$I_path/hpl-2.3/my_bin/include:$INCLUDE

  export LD_LIBRARY_PATH=$I_path/hpl-2.3/my_bin/lib:$LD_LIBRARY_PATH

 # export LD_LIBRARY_PATH=$I_path/hpl-2.3/my_bin/lib64:$LD_LIBRARY_PATH

  cd ..
  
  echo "----------------------------------------------"
  echo "|              HPL Installed                  |"
  echo "----------------------------------------------"

fi
