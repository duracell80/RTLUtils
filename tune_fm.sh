!/bin/bash
sudo systemctl stop rtl_fm.service
rtl_fm -g 50 -f $1M -M wfm -s 250k -E deemp |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k
