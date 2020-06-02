#!/bin/bash
sudo apt install -y git build-essential cmake autoconf libtool libao-dev libfftw3-dev librtlsdr-dev

git clone https://github.com/theori-io/nrsc5.git
cd nrsc5
mkdir build
cd build
cmake ../ -DUSE_NEON=ON -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
