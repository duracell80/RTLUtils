#!/bin/bash
sudo apt-get install -y  sox git cmake pkg-config libusb-1.0-0-dev ffmpeg build-essential libev-dev
sudo cp -f blacklist-rtl.conf /etc/modprobe.d
sudo cp rtl_fm.service /etc/systemd/system/
chmod +x *.sh


git clone git://git.osmocom.org/rtl-sdr.git
cd ./rtl-sdr
mkdir build
cd ./build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
sudo ldconfig

cd ~/RTLUtils
git clone https://github.com/AlbrechtL/rtl_fm_streamer.git
cd rtl_fm_streamer
mkdir build
cd build
cmake ../
make
sudo make install
sudo ldconfig

sudo systemctl daemon-reload
sudo systemctl enable rtl_fm.service
sudo systemctl start rtl_fm.service
