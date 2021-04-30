#!/bin/bash

PWD=`pwd`

export CXX="/usr/bin/mpicxx"
export CC="/usr/bin/mpicc"

OPENMC_PATH="$HOME/Cloud/OpenMC"
OPENMC_SRC="$OPENMC_PATH/src"
OPENMC_BIN="$OPENMC_PATH/build"

cd $OPENMC_SRC && git checkout develop
git pull upstream develop:develop
cd $OPENMC_BIN
cmake -Ddebug=off -Doptimize=on -DHDF5_PREFER_PARALLEL=on $OPENMC_SRC && \ 
make && sudo make install

cd $PWD
