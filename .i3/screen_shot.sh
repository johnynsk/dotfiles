#!/bin/bash
FILENAME=`date +%Y-%m-%d-%H-%M-%S`_scrot.png
FILE=~/shots/$FILENAME
DURATION=`zenity --info --title='Снимок экрана' --text='Выделите область экрана' 2>/dev/null`
# xrectsel from https://github.com/lolilolicon/xrectsel
SIZE=$(xrectsel)

sleep 1.5
scrot $FILE
convert $FILE -crop $SIZE $FILE

if [ "$1" = "hosting" ]
then
    scp $FILE johnynsk.ru:/var/www/johnynsk.ru/fastimg.johnynsk.ru/www/work/
    REMOTEFILE='http://fastimg.johnynsk.ru/work/'$FILENAME
    echo $REMOTEFILE | xsel -i -b
else
    echo $FILE | xsel -i -b
fi


#DURATION=`zenity --info --title='Расположение скриншота' --text="$FILE\n$SIZE" 2>/dev/null`

