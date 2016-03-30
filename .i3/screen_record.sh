#!/bin/bash

# Delay before starting
DELAY=3

# Sound notification to let one know when recording is about to start (and ends)
beep() {
    paplay /usr/share/sounds/KDE-Im-Irc-Event.ogg &
}

FILENAME=`date +%Y-%m-%d_%H-%M-%S`_byanz
REMOTE=

if [ "$1" = "flv" ]
then
    FILENAME=$FILENAME.flv
    if [ "$2" = "hosting" ]
    then
        REMOTE=1
    fi
else
    FILENAME=$FILENAME.gif
    if [ "$1" = "hosting" ]
    then
        REMOTE=1
    fi
fi;

FILE=~/shots/$FILENAME

DURATION=`zenity --entry --title='Запись gif' --text='Введите время записи (сек)' 2>/dev/null` || exit
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
    scp $FILE johnynsk.ru:/var/www/johnynsk.ru/fastimg.johnynsk.ru/www/work/
    REMOTEFILE='http://fastimg.johnynsk.ru/work/'$FILENAME
    echo $REMOTEFILE | xsel -i -b
else
    echo $FILE | xsel -i -b
fi

