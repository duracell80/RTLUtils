!/bin/bash
rtl_fm -g 50 -f $1M -M nfm -s 160k -E deemp |  play -r 160k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k
