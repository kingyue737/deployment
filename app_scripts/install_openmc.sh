#!/bin/bash

# conda
conda activate nuclear

# Update system-provided pip
pip3 install --upgrade pip

# Install h5py
HDF5_MPI=ON HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/openmpi pip install --no-binary=h5py h5py

# Install OpenMC
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

cd .. && pip install -e .[test]

# Install OpenMC plotter

PLOTTER_PATH="$HOME/Cloud/plotter"
cd $PLOTTER_PATH && pip install .

# Append environment variable
OPENMC_CROSS_SECTIONS="$HOME/Cloud/nuclear_data_libraries/endfb71_hdf5"
OPENMC_DEPLETE_CHAIN="$HOME/Cloud/depletion_chains/chain_casl_pwr.xml"
echo "export OPENMC_CROSS_SECTIONS=\"$OPENMC_CROSS_SECTIONS\"" >> "$HOME/.bashrc"

# Add the following line into data library cross section xml
# <depletion_chain path="depletion_chains/chain_casl_pwr.xml" type="depletion_chain" />
python set_chain.py $OPENMC_CROSS_SECTIONS $OPENMC_DEPLETE_CHAIN