#!/bin/sh

while :; do
    jack=$(amixer -c 0 contents | head -18 | tail -1 | awk '{ print $2 }' | sed "s/values=//")
    if [ $jack = "on" ]; then
        pamixer -u
        while [ $jack = "on" ]; do
            jack=$(amixer -c 0 contents | head -18 | tail -1 | awk '{ print $2 }' | sed "s/values=//")
            sleep .5
            echo x > /dev/null
        done
    else
        pamixer -m
        music=$(mpc | head -2 | tail -1 | awk '{ print $1 }' | sed "s/\[//; s/\]//")
        if [ $music = "playing" ]; then
            mpc pause
        fi
        while [ $jack = "off" ]; do
            jack=$(amixer -c 0 contents | head -18 | tail -1 | awk '{ print $2 }' | sed "s/values=//")
            sleep .5
            echo x > /dev/null
        done
    fi
done
