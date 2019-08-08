#!/bin/sh

[ -z $@ ] && exit

if [ $@ = "left" ]; then
    xdotool mousemove 0 538.5 click 1
    xdotool keydown super
    xdotool mousedown 1
    xdotool mousemove 1366 538.5
    xdotool keyup super
    xdotool mouseup 1
    xdotool key super+shift+space
elif [ $@ = "right" ]; then
    xdotool mousemove 1366 538.5 click 1
    xdotool keydown super
    xdotool mousedown 1
    xdotool mousemove 0 538.5
    xdotool keyup super
    xdotool mouseup 1
    xdotool key super+shift+space
fi
