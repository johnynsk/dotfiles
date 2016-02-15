#!/bin/bash
# Screen locker - blur

FILE="/tmp/screenshot.png"
RAW="/tmp/rawscreenshot.png"
SCALE=7.5
BACKSCALE=`echo "(100/$SCALE)*100" | bc -l`
scrot $RAW

convert $RAW -scale $SCALE% -scale $BACKSCALE% -blur 5x1 $FILE
i3lock -i $FILE &
COUNTER=0
until [ $COUNTER -gt 300 ];
do
    sleep 1s
    let COUNTER+=1
    pgrep i3lock || exit
done

# отключаем экран
pgrep i3lock && xset dpms force off
