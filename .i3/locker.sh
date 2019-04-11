#!/bin/bash
exec 19>> /tmp/i3-locker.log
export BASH_XTRACEFD="19"
set -x
pid=$$
MUTE=`LANG=C pactl list sinks | grep 'Sink #1' -A10 | grep Mute:.no`
pactl set-sink-mute 1 1
processes=$(pgrep locker.sh | grep -v "$pid" | wc -l)

if [ "$processes" -gt 1 ]
then
    exit
fi

FILE="/tmp/screenshot.png"
RAW="/tmp/rawscreenshot.png"
DIR=10
BACK=`echo "(100/$DIR)*100" | bc -l`
scrot -z $RAW
#convert $RAW -scale $DIR% -scale $BACK% -blur 1x1 $FILE
#convert $RAW -blur 5x1 -noise 15 $FILE
#convert $RAW -blux 1x1 -noise 7 $FILE
#convert $RAW -scale $DIR% -scale $BACK% -blur 1x1 +noise 7 $FILE
#convert $RAW -scale $DIR% -scale $BACK% -blur 1x1 +noise 7 -operator gray threshold "50%" $FILE
convert $RAW -scale $DIR% -scale $BACK% +noise 'Impulse|10' -blur 5x3 $FILE
i3lock -n -i $FILE &
i3lock_id=$!
timew start AFK
COUNTER=0

until [ $COUNTER -gt 3000 ];
do
    sleep 0.1
    let COUNTER+=1
    ps ax | awk '{print $1}' | grep -q $i3lock_id || break
done

ps ax | awk '{print $1}' | grep -q $i3lock_id || timew continue @2
ps ax | awk '{print $1}' | grep -q $i3lock_id || ( [ -n "$MUTE" ] && pactl set-sink-mute 1 0 )
ps ax | awk '{print $1}' | grep -q $i3lock_id || exit
xset dpms force off

while [ 1 = 1 ];
do
    sleep 0.1
    (ps ax | awk '{print $1}' | grep -q $i3lock_id ) || break
done

timew continue @2
[ -n "$MUTE" ] && pactl set-sink-mute 1 0

