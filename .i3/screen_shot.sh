#!/bin/bash
FILENAME=`date +%Y-%m-%d-%H-%M-%S`_scrot.png
FILE=~/shots/$FILENAME
DELAY=`zenity --entry --title='Снимок экрана' --text='Введите время задержки (сек)' --entry-text='1.5' 2>/dev/null` || exit
# xrectsel from https://github.com/lolilolicon/xrectsel
SIZE=$(xrectsel)

sleep $DELAY
scrot -z $FILE
convert $FILE -crop $SIZE $FILE

if [ "$1" = "hosting" ]
then
    scp $FILE johnynsk.ru:/var/www/johnynsk.ru/fastimg.johnynsk.ru/www/work/
    REMOTEFILE='http://fastimg.johnynsk.ru/work/'$FILENAME
    echo -n $REMOTEFILE | xsel -i -b
else
    echo -n $FILE | xsel -i -b
fi


#DURATION=`zenity --info --title='Расположение скриншота' --text="$FILE\n$SIZE" 2>/dev/null`

