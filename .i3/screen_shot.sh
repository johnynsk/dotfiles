#!/bin/bash
# xrectsel from https://github.com/lolilolicon/xrectsel
SIZE=$(xrectsel) || exit -1
FILE=~/shots/`date +%Y-%m-%d-%H-%M-%S`_scrot.png
scrot $FILE
convert $FILE -crop $SIZE $FILE
