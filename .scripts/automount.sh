#!/bin/sh
while :; do
    mnt=$(lsblk | grep sdb | head -1 | awk '{ print $1 }')
    mnt2=$(lsblk | grep sdb2 | awk '{ print $1 }' | sed "s/\`-//")

    sleep 1
    if [ $mnt = "sdb" ] #&& [ $mnt2 -ne 0 ]; then
    then
        mkdir /home/finn/mnt
        sudo mount /dev/sdb1 /home/finn/mnt
    fi
    while [ $mnt = "sdb" ]; do
        sleep 1
        echo x > /dev/null
    done
    rmdir /home/finn/mnt
done
