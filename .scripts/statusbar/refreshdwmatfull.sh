#!/bin/sh
while :; do
    TITLE=$(mpc | head -1)
    [ "$(date "+%T" | sed "s/.*://")" -eq 00 ] && refbar 
    [ "$TITLE" = "$CHECK" ] || refbar
    [ "$(date "+%T" | cut -b 1-5)" -eq "00:00" ] && kill $(pstree -lp | grep weather_curl_s | sed "s/.*-//;s/sleep(//;s/)//")
    sleep 1
    CHECK=$TITLE
done
