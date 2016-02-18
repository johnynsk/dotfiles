#!/bin/bash
# Установка git sh

pushd `pwd`
mkdir /tmp/git-sh
git clone https://github.com/johnynsk/git-sh.git /tmp/git-sh
cd /tmp/git-sh
make
sudo make install
cd `popd`
rm -rf /tmp/git-sh
