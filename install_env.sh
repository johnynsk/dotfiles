#!/bin/bash
# Среда разработки
DIR=${0%/*}
source functions.sh

LINKPATHS=(
    ".gitconfig"
    ".vim"
    ".vimrc"
    ".config/git"
    ".config/jirabranch"
)

EXECPATHS=(
    "git.sh"
    "vim.sh"
)

for PATHTO in "${LINKPATHS[@]}"
do
    log "linking ${PATHTO}:"
    link ${PATHTO}
done

for PATHTO in "${EXECPATHS[@]}"
do
    log "executing ${PATHTO}"
    exec "init/${PATHTO}"
done
