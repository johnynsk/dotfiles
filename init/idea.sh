#!/bin/bash
pushd `pwd`

sudo mkdir -p /opt/jetbrains/idea
sudo chown `whoami`:`whoami` /opt/jetbrains/idea
cd /opt/jetbrains/idea

URL=`curl -s https://data.services.jetbrains.com/products/releases\?code\=IIU\&latest\=true\&type\=release | python -c "import sys, json; print json.load(sys.stdin)['IIU'][0]['downloads']['linux']['link']"`
FILENAME=`echo ${URL} | sed -rn 's/.*\/([^\/]+)/\1/p'`
DIRNAME=`tar tvf /opt/jetbrains/idea/${FILENAME} | awk '{print $6}' | head -n 1 | sed -rn 's/([^\/]+)\/.*/\1/p'`
tar xzvf ${FILENAME}
rm -f ${FILENAME}
cat ${DIRNAME}/bin/idea64.vmoptions | sed -r 's/-Xms[0-9]+m/-Xms750m/' | sed -r 's/-Xmx[0-9]+m/-Xmx3072m/' | sed -r 's/ReservedCodeCacheSize=[0-9]+m/ReservedCodeCacheSize=750m/' > ${DIRNAME}/bin/idea64.vmoptions.patch
cp ${DIRNAME}/bin/idea64.vmoptions{.patch,}
ln -sf `readlink -f ${DIRNAME}/bin/idea.sh` /usr/bin/idea

cd `popd`
