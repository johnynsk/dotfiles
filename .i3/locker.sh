#!/bin/bash
FILE="/tmp/screenshot.png"
RAW="/tmp/rawscreenshot.png"
DIR=7.5
BACK=`echo "(100/$DIR)*100" | bc -l`
scrot $RAW

convert $RAW -scale $DIR% -scale $BACK% -blur 5x1 $FILE
i3lock -i $FILE &
sleep 5m
pgrep i3lock && xset dpms force off
