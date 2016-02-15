#!/bin/bash
# Установка xrectsel

pushd `pwd`
rm -rf /tmp/xrectsel

git clone https://github.com/lolilolicon/xrectsel /tmp/xrectsel
cd /tmp/xrectsel

# установка
./bootstrap
make
sudo make DESTDIR=`/usr/bin/` install

# прибираемся
cd `popd`
rm -rf /tmp/xrectsel