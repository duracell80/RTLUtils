#!/bin/bash
printf "FM Radio: Scanning (88-108Mhz) ...\n"
rm fm_scan.csv
touch ./found_stations.csv
chmod 777 ./found_stations.csv


rtl_power -f 88M:108M:250k -e 2s -i 2 fm_stations.csv >/dev/null 2>&1
python3 heatmap.py fm_stations.csv fm_stations.png >/dev/null 2>&1
python3 flatten.py fm_stations.csv >> found_stations.csv


awk -F"," '{print $1}' found_stations.csv >> fm_scan.csv
rm found_stations.csv
#rm fm_stations.csv

FREQS=$(wc -l fm_scan.csv)
printf "FM Radio: Frequencies Stored ($FREQS)\n\n"


printf "FM Radio: Set Presets \n\n"
printf "> Shift+M to save a clear station\n"
printf "> Skip to next with cursor keys\n\n\n"

PSET=$'\n' read -d '' -r -a lines < fm_scan.csv
PLEN=$(cat fm_scan.csv | wc -l)
LINE=0

#echo "$PLEN Stations in Memory"
while : ; do
        read -n 1 k <&1
        if [[ $k == *"A"* ]] ; then

		FREQ=${lines[LINE]}
		TUNE=${FREQ%.*}

		printf "\nTuning Radio: ${TUNE}\n"
		if (( $LINE <= $PLEN ))
		then
			((LINE+=1))
		else
			LINE=0
		fi
                pkill rtl_fm
                sleep 2s
                #rtl_fm -g 50 -f $TUNE -M fm -s 250k -l 20 -E deemp |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k&
		rtl_fm -M fm -s 250k -l 20 -r 48000 -f $TUNE - | aplay -r 48000 -f S16_LE&

	elif [[ $k == *"B"* ]] ; then
		if (( $LINE >= $PLEN ))
                then
                        ((LINE-=1))
                else
                        LINE=0
                fi

                FREQ=${lines[LINE]}
                TUNE=${FREQ%.*}

                printf "\nTuning Radio: ${TUNE}\n"

                pkill rtl_fm
                sleep 2s
		#rtl_fm -g 50 -f $TUNE -M fm -s 250k -l 20 -E deemp |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k&
		rtl_fm -M fm -s 250k -l 20 -r 48000 -f $TUNE - | aplay -r 48000 -f S16_LE&
        elif [[ $k == *"C"* ]] ; then
                ((TUNE+=100000))
                printf "\nFine Tuning Radio: ${FREQ}\n"

                pkill rtl_fm
                sleep 2s
		#rtl_fm -g 50 -f $TUNE -M fm -s 250k -E deemp |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k&
		rtl_fm -M fm -s 250k -r 48000 -f $TUNE - | aplay -r 48000 -f S16_LE&
	elif [[ $k == *"D"* ]] ; then
                ((TUNE-=100000))
                printf "\nFine Tuning Radio: ${FREQ}\n"

                pkill rtl_fm
                sleep 2s
		#rtl_fm -g 50 -f $TUNE -M fm -s 250k -E deemp |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k&
		rtl_fm -M fm -s 250k -r 48000 -f $TUNE - | aplay -r 48000 -f S16_LE&
	elif [[ $k == *"M"* ]] ; then
		echo $TUNE >> fm_preset.csv
	else
                echo $TUNE
        fi
        echo $TUNE
done
