#!/bin/bash 
WORKING_DIR="$HOME/.scripts/statusbar"
SEPERATOR="|"

Music() {
    TITLE=$(mpc | head -1 | cut -b 1-20)
    TITLE_LENGTH=$(mpc | head -1 | awk '{ print length }')

    if [ $CHECK = "playing" ]; then
        if [ $TITLE_LENGTH -ge 25 ]; then
            echo " $TITLE[…] $SEPERATOR "
        else
            echo " $TITLE $SEPERATOR "
        fi
    else
        if [ $COUNTER = 0 ]; then
            if [ $TITLE_LENGTH -ge 25 ]; then
                echo " $TITLE[…] $SEPERATOR "
            else
                echo " $TITLE $SEPERATOR "
            fi
        elif [ $COUNTER = 1 ]; then
            echo ""
        fi
    fi
}

Weather() {
    FILE="$HOME/.scripts/statusbar/usage_data/weather"

    [ -f $FILE ] || sleep 3s

    if [ $(grep -c "." $FILE) -lt 8 ]; then
        echo "Error."
    elif [ $(stat -c %y "$FILE" 2>/dev/null | cut -d' ' -f1) = "$(date '+%Y-%m-%d')" ]; then
        echo "$(
        sed '16q;d' $FILE | grep -wo "[0-9]*%" | sort -n | sed -e '$!d' | sed -e "s/^/ /"
        )  $(
        sed '4q;d' .scripts/statusbar/usage_data/weather | sed -r 's/\x1b\[[0-9;]*m//g' | cut -b 16-50 |
awk '{print $1"°C"}'
        #sed '4q;d' $FILE | awk '{print $5}' | sed -r 's/\x1b\[[0-9;]*m//g'
        ##sed '13q;d' $FILE | grep -o "m\\(-\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\nm' ' ' | awk '{print " " " "$1"C°","" " " $2"C°"}' # low & high
        )"
    fi
}

Volume() {
    echo "$(pamixer --get-volume)%"
}

Storage() {
    echo "$(df -h | awk '{ print $3 }' | head -4 | tail -1)/$(df -h | awk '{ print $2 }' | head -4 | tail -1)"
}

Clock() {
    date "+%a, %Y-%m-%d %H:%M"
}

Battery() {
    BATSTATUS=$(cat /sys/class/power_supply/BAT0/status)
    if [ $BATSTATUS = "Discharging" ]; then
        BAT=$(cat /sys/class/power_supply/BAT0/capacity)
        if [ $BAT -ge 81 ] && [ $BAT -le 100 ]; then 
            echo " $BAT%"
        elif [ $BAT -ge 61 ] && [ $BAT -le 80 ]; then
            echo " $BAT%"
        elif [ $BAT -ge 41 ] && [ $BAT -le 60 ]; then
            echo " $BAT%"
        elif [ $BAT -ge 21 ] && [ $BAT -le 40 ]; then
            echo " $BAT%"
        elif [ $BAT -ge 1 ] && [ $BAT -le 20 ]; then
            echo " $BAT%"
        fi
    else
        BAT=$(cat /sys/class/power_supply/BAT0/capacity)
        if [ $BAT -ge 81 ] && [ $BAT -le 100 ]; then 
            echo " +$BAT%"
        elif [ $BAT -ge 61 ] && [ $BAT -le 80 ]; then
            echo " +$BAT%"
        elif [ $BAT -ge 41 ] && [ $BAT -le 60 ]; then
            echo " +$BAT%"
        elif [ $BAT -ge 21 ] && [ $BAT -le 40 ]; then
            echo " +$BAT%"
        elif [ $BAT -ge 1 ] && [ $BAT -le 20 ]; then
            echo " +$BAT%"
        fi
    fi
}

while :; do
    CHECK=$(mpc | awk '{ print $1 }' | head -2 | tail -1 | sed "s/\[//;s/\]//")
    [ $CHECK = "playing" ] && COUNTER=0

    xsetroot -name " $(Music)$(Volume) $SEPERATOR $(Weather) $SEPERATOR $(Storage) $SEPERATOR $(Clock) $SEPERATOR $(Battery)"
    sleep 1m
    [ $CHECK = "paused" ] && COUNTER=1 || COUNTER=0
done
