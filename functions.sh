#!/bin/bash
DIR=`pwd`

function log {
    if [ -n "$2" ]
    then
        echo "!!! [ERRO] $1"
    else
        echo "--- [INFO] $1"
    fi
}

function link {
    if [ -s "~/$1" ]
    then
        read -p "Файл по пути ~/$1 уже существует. Удалить (y/N)?" -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[yY]$ ]]
        then
            return
        fi
        rm -rf ~/$1
    fi
    /bin/ln -sf ${DIR}/$1 ~/$1
}

export -f log
export -f link
