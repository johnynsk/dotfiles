#!/bin/bash
FILE="/tmp/screenshot.png"
RAW="/tmp/rawscreenshot.png"
DIR=10
BACK=`echo "(100/$DIR)*100" | bc -l`
scrot $RAW

#convert $RAW -scale $DIR% -scale $BACK% -blur 1x1 $FILE
#convert $RAW -blur 5x1 -noise 15 $FILE
#convert $RAW -blux 1x1 -noise 7 $FILE
#convert $RAW -scale $DIR% -scale $BACK% -blur 1x1 +noise 7 $FILE
#convert $RAW -scale $DIR% -scale $BACK% -blur 1x1 +noise 7 -operator gray threshold "50%" $FILE
convert $RAW -scale $DIR% -scale $BACK% +noise 'Impulse|10' -blur 5x3 $FILE

i3lock -i $FILE &
COUNTER=0
until [ $COUNTER -gt 300 ];
do
    sleep 1s
    let COUNTER+=1
    pgrep i3lock || exit
done
pgrep i3lock && xset dpms force off
