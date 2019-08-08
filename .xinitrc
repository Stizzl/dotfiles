#!/bin/sh
#~/.scripts/statusbar/main.sh &
~/.scripts/dwmrefresh.sh &
~/.scripts/display.sh &
~/.scripts/headphonejack.sh &
#numlockx &
#sudo rfkill block bluetooth
start_transmission &
unclutter --timeout 2 &
xset r rate 300 50 &
xset m 0.1 0 &
compton -f -r 6 &
xhkd &
mpd &
dunst &
setxkbmap -layout de -option caps:ctrl_modifier &
xcape -e 'Caps_Lock=Escape'
xmodmap .Xmodmap &
feh --bg-scale $BACKGROUND &
st &
xsetroot -name "                                                                           " &
exec dwm
