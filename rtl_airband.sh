#!/bin/bash
rtl_fm -M am -f 118M:137M:25k -s 12k -g 49.2 -l 280 |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k
