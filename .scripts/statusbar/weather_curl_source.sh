#!/bin/sh

FILE="$HOME/.scripts/statusbar/usage_data/weather"

while :; do
    ping -c1 google.com
    if [ "$?" = 0 ]; then
        curl -Ls wttr.in/tespe > $FILE
    fi
    sleep 1h
done
