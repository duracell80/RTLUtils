!/bin/bash
sudo systemctl stop rtl_fm.service
mpd stop
rtl_fm -g 50 -f 162.508M -M fm -s 115k -E deemp |  play -r 115k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k
