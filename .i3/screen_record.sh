#!/bin/bash

# Delay before starting
DELAY=3

# Sound notification to let one know when recording is about to start (and ends)
beep() {
#    paplay /usr/share/sounds/KDE-Im-Irc-Event.ogg &
    paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga &
}

FILENAME=`date +%Y-%m-%d_%H-%M-%S`_byanz
REMOTE=
MODE="gif"
if [ "$1" = "webm" ]
then
    MODE="webm"
    FILENAME=$FILENAME.webm
    if [ "$2" = "hosting" ]
    then
        MODE="$MODE (hosting)"
        REMOTE=1
    fi
else
    if [ "$1" = "flv" ]
    then
        MODE="flv"
        FILENAME=$FILENAME.flv
        if [ "$2" = "hosting" ]
        then
            MODE="$MODE (hosting)"
            REMOTE=1
        fi

    else
        FILENAME=$FILENAME.gif
        if [ "$1" = "hosting" ]
        then
            MODE="$MODE (hosting)"
            REMOTE=1
        fi
    fi;
fi;

FILE=/media/sf_shar/shots/$FILENAME
#FILE=/home/user/Desktop/$FILENAME
DELAY=`zenity --entry --title='Снимок экрана' --text='Введите время задержки (сек)' --entry-text='1.5' 2>/dev/null` || exit
DURATION=`zenity --entry --title="Запись $MODE" --text='Введите время записи (сек)' 2>/dev/null` || exit
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

if [ -n "$REMOTE" ]
then
    scp $FILE dev0:/data/projects/www.johnynsk.ru/www/records/
    REMOTEFILE='http://johnynsk.ru/records/'$FILENAME
    echo -n $REMOTEFILE | xsel -i -b
else
    echo -n $FILE | xsel -i -b
fi

