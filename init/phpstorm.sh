#!/bin/bash
pushd `pwd`

sudo mkdir -p /opt/jetbrains/phpstorm
sudo chown `whoami`:`whoami` /opt/jetbrains/phpstorm
cd /opt/jetbrains/phpstorm

URL=`curl -s https://data.services.jetbrains.com/products/releases\?code\=PS\&latest\=true\&type\=release | python -c "import sys, json; print json.load(sys.stdin)['PS'][0]['downloads']['linux']['link']"`
FILENAME=`echo ${URL} | sed -rn 's/.*\/([^\/]+)/\1/p'`
DIRNAME=`tar tvf /opt/jetbrains/phpstorm/${FILENAME} | awk '{print $6}' | head -n 1 | sed -rn 's/([^\/]+)\/.*/\1/p'`
tar xzvf ${FILENAME}
rm -f ${FILENAME}
ln -sf `readlink -f ${DIRNAME}/bin/phpstorm.sh` /usr/bin/phpstorm

cd `popd`
