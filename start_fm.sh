#! /usr/bin/env bash

printf "FM Radio Tuner [ 88-108Mhz ]\n\n"

printf "> Ctl+C to exit\n"
printf "> Skip to next with Up Arrow key or Up on your DPad\n"
printf "> Skip to previous with Down Arrow key or Down on your DPad\n\n\n"

PSET=$'\n' read -d '' -r -a lines < fm_preset.csv
PLEN=$(cat fm_preset.csv | wc -l)
LINE=0

echo "$PLEN Stations in Memory"
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
                rtl_fm -g 50 -f $TUNE -M fm -s 250k -E deemp |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k&
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
		rtl_fm -g 50 -f $TUNE -M fm -s 250k -E deemp |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k&
        elif [[ $k == *"C"* ]] ; then
                ((TUNE+=100000))
                printf "\nFine Tuning Radio: ${FREQ}\n"

                pkill rtl_fm
                sleep 2s
		rtl_fm -g 50 -f $TUNE -M fm -s 250k -E deemp |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k&
	elif [[ $k == *"D"* ]] ; then
                ((TUNE-=100000))
                printf "\nFine Tuning Radio: ${FREQ}\n"

                pkill rtl_fm
                sleep 2s
		rtl_fm -g 50 -f $TUNE -M fm -s 250k -E deemp |  play -r 250k -t raw -e s -b 16 -c 1 -V1 - lowpass 16k&
	elif [[ $k == *"M"* ]] ; then
		echo $TUNE >> fm_preset.csv
	else
                echo $TUNE
        fi
        echo $TUNE
done
