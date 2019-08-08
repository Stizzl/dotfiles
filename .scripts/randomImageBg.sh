#/bin/sh

dmenu=$(printf "Yes\nNo" | dmenu -i -p "Do you want to load your Background?")

while [ $dmenu = "Yes" ]
do
    OUT=`ls ~/Pictures/Wallpaper | sort -R | tail -$N | head -1`
    feh --bg-scale ~/Pictures/Wallpaper/$OUT
    sleep 1000
done
