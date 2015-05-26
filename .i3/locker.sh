#!/bin/bash
FILE="/tmp/screenshot.png"
RAW="/tmp/rawscreenshot.png"
DIR=7.5
BACK=`echo "(100/$DIR)*100" | bc -l`
scrot $RAW

convert $RAW -scale $DIR% -scale $BACK% -blur 5x1 $FILE
i3lock -i $FILE &
COUNTER=0
until [ $COUNTER -gt 300 ];
do
    sleep 1s
    let COUNTER+=1
    pgrep i3lock || exit
done
pgrep i3lock && xset dpms force off
