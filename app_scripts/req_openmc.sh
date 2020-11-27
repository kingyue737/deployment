#!/bin/bash

MPI=openmpi

# Setup environment for openmc

apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y wget && \
apt-get install -y gfortran g++ cmake && \
apt-get install -y imagemagick
if [ "$MPI"=="openmpi" ]; then
    apt-get install -y openmpi-bin lib libopenmpi-dev
    apt-get install -y libhdf5-serial-dev libhdf5-openmpi-dev 
elif [ "$MPI"=="mpich" ]; then
    apt-get install -y mpich libmpich-dev
    apt-get install -y libhdf5-serial-dev libhdf5-mpich-dev
else
    echo "MPI should be set as either openmpi or mpich"
    exit 1
fi
apt-get install libxcb-xinerama0
apt-get install pandoc