#!/bin/bash

MPI = openmpi

# Setup environment for openmc

apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y wget && \
apt-get install -y gfortran g++ cmake && \
apt-get install -y imagemagick
if [ "$MPI" == "openmpi"]; then
    apt-get install -y openmpi-bin lib libopenmpi-dev
    apt-get install -y libhdf5-serial-dev libhdf5-openmpi-dev 
elif [ "$MPI" == "mpich"]; then
    apt-get install -y mpich libmpich-dev
    apt-get install -y libhdf5-serial-dev libhdf5-mpich-dev
else
    echo "MPI should be set as either openmpi or mpich"
    exit 1
fi

# conda
conda activate nuclear

# Update system-provided pip
pip3 install --upgrade pip

# Install h5py
HDF5_MPI=ON HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/openmpi pip install --no-binary=h5py h5py

# Install OpenMC
cmake -Doptimize=on -DHDF5_PREFER_PARALLEL=on "$HOME/Cloud/OpenMC/src"
make && make install
cd .. && pip install -e .[test]

# Install OpenMC plotter
sudo apt-get install libxcb-xinerama0

sudo apt-get install pandoc