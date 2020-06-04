#!/bin/bash
sudo apt-get install -y  sox git cmake pkg-config libusb-1.0-0-dev ffmpeg build-essential libev-dev
sudo cp -f blacklist-rtl.conf /etc/modprobe.d
sudo cp rtl_airband.service /etc/systemd/system/
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
