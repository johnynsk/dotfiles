#!/bin/bash

# Sound notification to let one know when recording is about to start (and ends)
beep() {
    paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga &
}

FILE=~/shots/$FILENAME
#FILE=/home/user/Desktop/$FILENAME
DELAY=`zenity --entry --title='Снимок экрана' --text='Введите время задержки (сек)' --entry-text='1.5' 2>/dev/null` || exit
DURATION=`zenity --entry --title="Запись $MODE" --text='Введите время записи (сек)' 2>/dev/null` || exit
echo Recording duration $DURATION s to $FILE

# xrectsel from https://github.com/lolilolicon/xrectsel
ARGUMENTS=$(xrectsel "--x=%x --y=%y --width=%w --height=%h") || exit -1


