#!/bin/bash
sudo apt install -y git build-essential cmake autoconf libtool libao-dev libfft>

git clone https://github.com/theori-io/nrsc5.git
cd nrsc5
mkdir build
cd build
cmake ../ -DUSE_NEON=ON -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig

sudo apt-get install python3-pyaudio
sudo apt install python3-gi python3-gi-cairo python-tk gir1.2-gtk-3.0
git clone https://github.com/duracell80/nrsc5-gui.git
cd nrsc5-gui
python3 nrsc5_gui.py

cd ../
git clone https://github.com/KYDronePilot/hdfm.git
