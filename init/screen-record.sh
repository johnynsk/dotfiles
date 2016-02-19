#!/bin/bash
# Установка xrectsel

pushd `pwd`
sudo apt-get -y install xclip xsel scrot zenity
rm -rf /tmp/xrectsel

git clone https://github.com/lolilolicon/xrectsel /tmp/xrectsel
cd /tmp/xrectsel

# установка
./bootstrap && ./configure --prefix /usr && make && sudo make install

# прибираемся
cd `popd`
rm -rf /tmp/xrectsel

mkdir ~/shots
