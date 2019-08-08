#!/bin/sh

while :; do
    vga=$(xrandr | grep VGA1 | awk '{ print $2 }')
    if [ "$vga" = "connected" ]; then
        xrandr --output LVDS1 --mode 1366x768 --pos 0x156 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output VGA1 --primary --mode 1920x1080 --rate 60 --pos 1366x0 --rotate normal --output VIRTUAL1 --off
        xset r rate 300 50
        xset m 0.1 0
        setxkbmap -layout de -option caps:ctrl_modifier
        [ -z $(pidof xcape) ] && xcape -e 'Caps_Lock=Escape'
        xmodmap .Xmodmap
        # polybar dwm2 &
        feh --bg-scale $BACKGROUND
        while [ "$vga" = "connected" ]; do
            vga=$(xrandr | grep VGA1 | awk '{ print $2 }')
            sleep .3
        done
    else
        xrandr --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output VGA1 --off --output VIRTUAL1 --off
        xrandr --output LVDS1 --mode 1366x768 --pos 0x156 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output VGA1 --primary --mode 1920x1080 --rate 60 --pos 1366x0 --rotate normal --output VIRTUAL1 --off
        xset r rate 300 50
        xset m 0.1 0
        setxkbmap -layout de -option caps:ctrl_modifier
        [ -z $(pidof xcape) ] && xcape -e 'Caps_Lock=Escape'
        xmodmap .Xmodmap
        # polybar dwm1 &
        feh --bg-scale $BACKGROUND
        while [ "$vga" = "disconnected" ]; do
            vga=$(xrandr | grep VGA1 | awk '{ print $2 }')
            sleep .3
        done
    fi
done
