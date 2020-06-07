# SDR Radio Tools for Volumio, Moode, Mopidy etc
These tools require an RTL chipset based DVB-T dongle and strong radio signals. There are a bunch of scripts to listen to FM directly using the sox play command ... or as an IP feed from the ip address of the Raspberry Pi.

Here is some general information about the hardware and software:

https://cromwell-intl.com/open-source/raspberry-pi/sdr-getting-started.html
https://photobyte.org/using-the-raspberry-pi-as-an-rtl-sdr-dongle-server/
https://github.com/AlbrechtL/rtl_fm_streamer

## Clone the repo

```
$ cd ~/
$ git clone https://github.com/duracell80/RTLUtils.git
$ cd RTLUtils.git

$ sudo chmod +x *.sh
```

## Install RTL_FM
To install only the SDR tools without a streamer
```
$ ./install.sh

after reboot and knowing a local FM station's frequency
$ cd ~/
$ ./tune_fm 103.3M
```
## Install RTL_FM with FM Server (FM over IP)
To install only the SDR tools without a streamer
```
$ ./install-streamer.sh
$ sudo reboot
```

To listen to a local FM radio station over your local LAN after reboot and knowing the IP address of the Pi and a frequency to tune to such as 103.3; Open the URL in a web browser or VLC player as ... http://192.168.1.180:2346/103300000. Add these as URL's to M3U or PLS files to use within Mopidy, Moode, Volumio or any other MPD player.

Note as stated by rtl_fm_streamer's creator, this is a one dongle, one station, one client deal. It's not possible to tune to multiple stations at the same time. This could be achieved with multiple DVB-T dongles. It's alos only possible to listen from one device at a time, so if you are listening to a station on the Pi, you won;t be able to also tune to it from a desktop PC / cell phone and visa versa. You must also be on the same network as your Pi if using VLC.
