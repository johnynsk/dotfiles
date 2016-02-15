#!/bin/bash
DIR=${0%/*}

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
        rm ~/$1
    fi
    /bin/ln -sf ${DIR}$1 ~/$1
}

LINKPATHS=(
    ".gitconfig"
    ".vim"
    ".vimrc"
    ".i3"
)

INITPATHS=(
    "apt.sh"
    "vim.sh"
    "xrectsel.sh"
    "i3.sh"
)

for PATHTO in "${LINKPATHS[@]}"
do
    log "linking ${PATHTO}:"
    link $PATHTO
done

for PATHTO in "${INITPATHS[@]}"
do
    log "executing ${PATHTO}"
    exec "init/${PATHTO}"
done
