#!/bin/sh

DRIVE=$(lsblk -f | grep DOCK | awk '{print $1}' | sed "s/└─//")
A_DRIVE="/dev/$DRIVE"
MNTPATH="/home/finn/mnt"

mount $A_DRIVE $MNTPATH
