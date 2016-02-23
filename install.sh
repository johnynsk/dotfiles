#!/bin/bash

DIR=${0%/*}

source functions.sh

if [[ "$1" =~ ^env || -n "${ENV_TYPE}" ]]
then
    source config/environment.sh
else
    source config/workstation.sh
fi

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
