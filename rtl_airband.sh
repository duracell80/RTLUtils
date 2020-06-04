#!/bin/bash
rtl_fm -g 50 -f 118M:137M:32k -M am -s 32k -l 70 |  play -r 32k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k
