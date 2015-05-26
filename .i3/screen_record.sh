#!/bin/bash

# Delay before starting
DELAY=5

# Sound notification to let one know when recording is about to start (and ends)
beep() {
    paplay /usr/share/sounds/KDE-Im-Irc-Event.ogg &
}

FILE=~/shots/`date +%Y-%m-%d_%H-%M-%S`_byanz.gif
DURATION=`zenity --entry --title='Запись gif' --text='Введите время записи (сек)' 2>/dev/null`
echo Recording duration $DURATION s to $FILE

# xrectsel from https://github.com/lolilolicon/xrectsel
ARGUMENTS=$(xrectsel "--x=%x --y=%y --width=%w --height=%h") || exit -1

echo Delaying $DELAY seconds. After that, byzanz will start
for (( i=$DELAY; i>0; --i )) ; do
    echo $i
    sleep 1
done
beep
byzanz-record --verbose --delay=0 ${ARGUMENTS} --duration=$DURATION $FILE
beep
