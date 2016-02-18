#!/bin/bash
FILE=~/shots/`date +%Y-%m-%d-%H-%M-%S`_scrot.png
DURATION=`zenity --info --title='Снимок экрана' --text='Выделите область экрана' 2>/dev/null`
SIZE=$(xrectsel)

scrot $FILE
convert $FILE -crop $SIZE $FILE
echo $FILE | xsel -i -b
