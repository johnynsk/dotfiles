#!/bin/bash
pushd `pwd`

wget https://download.jetbrains.com/webide/PhpStorm-10.0.3.tar.gz -O /tmp/phpstorm.tar.gz
DIRNAME=`tar -tvf /tmp/phpstorm.tar.gz | head -n 1 | sed -rn 's/.*PhpStorm-([^\/]+)\/.*/PhpStorm-\1/p'`
tar -xzf /tmp/phpstorm.tar.gz -C /tmp/phpstorm
sudo mv /tmp/phpstorm/${DIRNAME} /opt/phpstorm
sudo ln -s /opt/phpstorm/bin/phpstorm.sh /usr/bin/phpstorm
rm -f /tmp/phpstorm.tar.gz
rm -f /tmp/phpstorm

cd `popd`