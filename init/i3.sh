#!/bin/bash
sudo apt-get -y install\
    i3 \
    imagemagick \
    feh \
    redshift \
    pasystray \
    rofi \
    pavucontrol \
    fonts-powerline \
    libreoffice \
    ttf-mscorefonts-installer \
    fonts-ubuntu \
    fontforge \
    xfce4-notifyd \
    xautolock \
    xprintidle

exit
# from https://needforbits.wordpress.com/2017/07/19/install-microsoft-windows-fonts-on-ubuntu-the-ultimate-guide/
#vista fonts
wget https://gist.github.com/maxwelleite/10774746/raw/ttf-vista-fonts-installer.sh -q -O - | sudo bash
#segoe ui
pushd `pwd`
sudo mkdir -p /usr/share/fonts/truetype/msttcorefonts/
cd /usr/share/fonts/truetype/msttcorefonts/
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeui.ttf?raw=true -O segoeui.ttf # regular
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuib.ttf # bold
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuii.ttf # italic
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuiz.ttf?raw=true -O segoeuiz.ttf # bold italic
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuil.ttf?raw=true -O segoeuil.ttf # light
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguili.ttf?raw=true -O seguili.ttf # light italic
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuisl.ttf?raw=true -O segoeuisl.ttf # semilight
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisli.ttf?raw=true -O seguisli.ttf # semilight italic
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisb.ttf?raw=true -O seguisb.ttf # semibold
sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisbi.ttf?raw=true -O seguisbi.ttf # semibold italic
fc-cache -f /usr/share/fonts/truetype/msttcorefonts/
cd `popd`
#tahoma font
wget https://gist.github.com/maxwelleite/ee5a1a4222dd43c8b4af5c99ed72b3fc/raw/ebb31b052f0bb95cfa361d7826b2dbf993820d0b/ttf-wine-tahoma-installer.sh -q -O - | sudo bash


