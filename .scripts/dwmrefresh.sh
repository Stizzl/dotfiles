#!/bin/sh
while :; do
    UPDATE=$(wmctrl -m | awk '{ print $2 }' | head -1)
    while [ $UPDATE = "dwm" ]; do
        xrandr --output LVDS1 --mode 1366x768 --pos 0x312 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output VGA1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal --output VIRTUAL1 --off
        xrandr --output LVDS1 --mode 1366x768 --pos 0x156 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output VGA1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal --output VIRTUAL1 --off
        exit
    done
    sleep .1
done
