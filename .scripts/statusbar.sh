#!/usr/bin/env bash

seperator="|"

function Storage {
	s=$(df -h /dev/sda3 | tail -1 | awk '{print $4}')
	[[ -z $s ]] &&
		df -h /dev/sdb3 | tail -1 | awk '{print $4}'
	df -h /dev/sda3 | tail -1 | awk '{print $4}'
}

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
	xsetroot -name " $Upload $Dwload $seperator $(Storage) $seperator $(Date) $seperator $(Battery)%"

    up_x=$(cat /proc/net/dev | grep wlp3s0 | awk '{print $10}')
    up_y=$up_x
    dw_x=$(cat /proc/net/dev | grep wlp3s0 | awk '{print $2}')
    dw_y=$dw_x

    sleep 1s

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
done &>/dev/null
