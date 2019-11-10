#!/bin/bash

seperator="|"

# function Transmission {
#     TORRENT=$(transmission-remote -l | sed '2q;d' | sed 's/\(.\) /\1/g')
#     STATUS=$(printf "%s" "$TORRENT" | awk '{print $8}')
#
#     if [ $counter -eq 60 ]; then
#         for((i=0; i<(($(transmission-remote -l | wc -l) - 1)); i++)); do
#             case "$STATUS" in
#                 "Downloading")
#                     let DOWNLOADING=$DOWNLOADING+1
#                     ;;
#                 "Idle|Seeding")
#                     let SEEDING=$SEEDING+1
#                     ;;
#             esac
#         done &
#         printf "%02d seed %02d down" $SEEDING $DOWNLOADING
#     fi
# }

function Date {
    date "+%a, %Y-%m-%d %H:%M:%S"
}

function Battery {
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    [[ $BAT -ge 100 ]] \
        && echo "99" \
        || printf '%02d' $BAT
}

while :; do
    xsetroot -name " $Upload $Dwload $seperator $(Date) $seperator $(Battery)%"
    # xsetroot -name "  $Upload  $Dwload $seperator $(Date) $seperator $(Battery)%"
    up_x=$(cat /proc/net/dev | grep wlp3s0 | awk '{print $10}')
    up_y=$up_x
    dw_x=$(cat /proc/net/dev | grep wlp3s0 | awk '{print $2}')
    dw_y=$dw_x
    sleep 1s
    let counter=$counter+1
    [ $counter -eq 61 ] && \
        counter=1; \
        DOWNLOADING=0; \
        SEEDING=0
    up_x=$(cat /proc/net/dev | grep wlp3s0 | awk '{print $10}')
    up_z=$up_x
    dw_x=$(cat /proc/net/dev | grep wlp3s0 | awk '{print $2}')
    dw_z=$dw_x
    _up=$(expr $up_z - $up_y)
    _dw=$(expr $dw_z - $dw_y)
    up_length=$(echo $_up | awk '{print length}')
    dw_length=$(echo $_dw | awk '{print length}')
    [[ $up_length -le 6 ]] \
        && Upload=$(echo $(printf '%06d' $_up | cut -b 1-3)u KB/s)
    [[ $up_length -gt 6 ]] \
        && Upload=$(echo $(printf '%09d' $_up | cut -b 1-3)u MB/s)
    [[ $dw_length -le 6 ]] \
        && Dwload=$(echo $(printf '%06d' $_dw | cut -b 1-3)d KB/s)
    [[ $dw_length -gt 6 ]] \
        && Dwload=$(echo $(printf '%09d' $_dw | cut -b 1-3)d MB/s)

    # [[ $bat_tmp -ne 0 ]] && \
    #     [[ $(Battery) -eq 99 ]] && notify-send "Battery is charged!"; bat_tmp=0
    # [[ $bat_tmp -ne 0 ]] && \
    #     [[ $(Battery) -eq 05 ]] && notify-send "Battery is nearly empty!"; bat_tmp=0

done
