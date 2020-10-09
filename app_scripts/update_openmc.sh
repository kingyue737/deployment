#!/bin/bash

export CXX="/usr/bin/mpicxx"
export CC="/usr/bin/mpicc"

OPENMC_PATH="$HOME/Cloud/OpenMC"
OPENMC_SRC="$OPENMC_PATH/src"
OPENMC_BIN="$OPENMC_PATH/build"

cd $OPENMC_SRC && git pull upstream develop:develop
git checkout develop
cd $OPENMC_BIN
cmake -Doptimize=on -DHDF5_PREFER_PARALLEL=on $OPENMC_SRC && \ 
make && make install


