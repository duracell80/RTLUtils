# SDR Radio Tools for Volumio, Moode, Mopidy etc
These tools require an RTL chipset based DVB-T dongle and strong radio signals. There are a bunch of scripts to listen to FM directly using the sox play command ... or as an IP feed from the ip address of the Raspberry Pi.

Here is some general information about the hardware and software:

https://cromwell-intl.com/open-source/raspberry-pi/sdr-getting-started.html

```
$ cd ~/
$ git clone https://github.com/duracell80/RTLUtils.git
$ cd RTLUtils.git

$ sudo chmod +x *.sh
```

## Install Options
To install only the SDR tools without a streamer
```
$ ./install.sh

after reboot and knowing a local FM station's frequency
$ cd ~/
$ ./tune_fm 103.3M
```

To install only the SDR tools without a streamer
```
$ ./install-streamer.sh
$ sudo reboot
```

To listen to radio over your local LAN after reboot and knowing the IP address of the Pi and a frequency to tune to such as 103.3; Open the URL in a web browser or VLC player as ... http://192.168.1.180:2346/103300000
