#!/bin/bash
# Рабочая машина
DIR=${0%/*}
source functions.sh

LINKPATHS=(
    ".gitconfig"
    ".vim"
    ".vimrc"
    ".i3"
    ".config/git"
    ".config/jirabranch"
    ".keynavrc"
    ".xsessionrc"
)

EXECPATHS=(
    "git.sh"
    "apt.sh"
    "vim.sh"
    "screen-record.sh"
    "i3.sh"
    "keynav.sh"
)

for PATHTO in "${LINKPATHS[@]}"
do
    log "linking ${PATHTO}:"
    link ${PATHTO}
done

for PATHTO in "${EXECPATHS[@]}"
do
    log "executing ${PATHTO}"
    ./init/${PATHTO}
done
