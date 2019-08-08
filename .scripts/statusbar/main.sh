#!/bin/sh
# executable files in this dir

ABSOLUT_DIR="$HOME/.scripts/statusbar"

$ABSOLUT_DIR/whileloop.sh &
$ABSOLUT_DIR/weather_curl_source.sh &
$ABSOLUT_DIR/refreshdwmatfull.sh &
