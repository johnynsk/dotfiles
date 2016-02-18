#!/bin/bash
# Установка xrectsel

pushd `pwd`
sudo apt-get -y install libx11-dev autoconf
rm -rf /tmp/xrectsel

git clone https://github.com/lolilolicon/xrectsel /tmp/xrectsel
cd /tmp/xrectsel

# установка
./bootstrap
./configure --prefix /usr
sudo checkinstall

# прибираемся
cd `popd`
rm -rf /tmp/xrectsel