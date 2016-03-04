#!/bin/bash
sudo -u johny DISPLAY=:0 notify-send "Глазам нужен отдых" "До блокировки экрана осталось менее 3 минут" --expire-time=120 -i amppointment-soon &
/bin/sleep 150
sudo -u johny DISPLAY=:0 notify-send "Глазам нужен отдых" "До блокировки экрана осталось 30 секунд" -i emblem-readonly &
/bin/sleep 30
sudo -u johny DISPLAY=:0 /home/johny/.i3/locker.sh &
/usr/sbin/vbetool dpms off
/bin/sleep 90
/usr/sbin/vbetool dpms on
sudo -u johny DISPLAY=:0 /usr/bin/xset dpms force off
