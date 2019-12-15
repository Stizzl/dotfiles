#!/bin/sh
~/.scripts/statusbar.sh &
~/.scripts/dwmrefresh.sh &
~/.scripts/display.sh &
~/.scripts/headphonejack.sh &
unclutter --timeout 1 &
xset r rate 300 50 &
xset m 0.1 0 &
compton -f -r 6 &
sxhkd &
mpd &
dunst &
setxkbmap -layout de -option caps:ctrl_modifier &
xcape -e 'Caps_Lock=Escape' &
feh --bg-scale $BACKGROUND &
exec dwm
