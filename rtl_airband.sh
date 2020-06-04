#!/bin/bash
sudo systemctl stop rtl_fm.service
rtl_fm -g 50 -f 118M:137M:32k -M am -s 32k -l 70 -t 1 |  play -r 32k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k
