# SDR Radio Tool Collection for Raspberry Pi
These tools require an RTL chipset based DVB-T dongle and strong radio signals. There are a bunch of scripts to listen to FM directly using the sox play command ... or as an IP feed from the IP address of the Raspberry Pi.

[Required Hardware DVB-T Stick](https://www.amazon.com/dp/B01B4L48QU/ref=sspa_dk_hqp_detail_aax_0?psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExTkU4VUY2UjRVU1kyJmVuY3J5cHRlZElkPUEwODk1ODU0OUEyTTJOMlFUMDlDJmVuY3J5cHRlZEFkSWQ9QTAwODg2NzIxWkdBOTA1RElNMktIJndpZGdldE5hbWU9c3BfaHFwX3NoYXJlZCZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=)

Here is some general information about the hardware and software:

- https://cromwell-intl.com/open-source/raspberry-pi/sdr-getting-started.html
- https://photobyte.org/using-the-raspberry-pi-as-an-rtl-sdr-dongle-server/
- https://github.com/AlbrechtL/rtl_fm_streamer
- To find your Pi's Ethernet address use "ifconfig eth0"
- To find your Pi's WiFi address use "ifconfig wlan0"

## Clone the repo

```
$ cd ~/
$ git clone https://github.com/duracell80/RTLUtils.git
$ cd RTLUtils

$ sudo chmod +x *.sh
```

## Install RTL_FM
To install only the SDR tools without a streamer
```
$ cd ~/RTLUtils
$ ./install.sh
```
After reboot and knowing a local FM station's frequency and already knowing your Pi is outputting sound ...

```
$ cd ~/RTLUtils
$ sudo chmod +x *.sh
$ ./tune_fm.sh 103.3M
```
## Install RTL_FM with FM Server (FM over IP)
To install the SDR with a streamer
```
$ cd ~/RTLUtils
$ sudo chmod +x *.sh
$ ./install-streamer.sh
$ sudo reboot

From your PC or Phone's browser via port 2346
http://your-pi-ip:2346/103300000
```

This could be useful if you're wanting to listen to an FM station on your phone maybe in VLC without having to use Internet data to do so, using your Raspberry Pi as a conduit. Maybe your local FM station doesn't carry sporting events on their online stream.

To listen to a local FM radio station over your local LAN after reboot and knowing the IP address of the Pi and a frequency to tune to such as 103.3; Open the URL in a web browser or VLC player as ... http://192.168.1.180:2346/103300000. Add these as URL's to M3U or PLS files to use within Mopidy, Moode, Volumio or any other MPD player. Note as stated by rtl_fm_streamer's creator, this is a one dongle, one station, one client deal. It's not possible to tune to the same station from multiple devices at the same time. Switching between listening devices I have found it beneficial to reboot the pi.

Knowing your local FM frequencies is very helpful and I recommend putting together a playlist of the stations you want to tune to, in this way you could mix local FM broadcasts with online streams in one playlist file.

[Lookup FM Frequencies Here](https://www.fmlist.org)
