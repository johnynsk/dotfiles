#!/bin/bash
FILE=~/shots/`date +%Y-%m-%d-%H-%M-%S`_scrot.png
DURATION=`zenity --info --title='Снимок экрана' --text='Выделите область экрана' 2>/dev/null`
# xrectsel from https://github.com/lolilolicon/xrectsel
SIZE=$(xrectsel)

scrot $FILE
convert $FILE -crop $SIZE $FILE
xclip
echo $FILE | xsel -i -b
