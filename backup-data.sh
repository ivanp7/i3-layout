#!/bin/bash

if [[ "$1" == "to-disk" ]]; then
    rsync -avP --force --delete ~/Workspace/ /mnt/usb-drive/Backup/Workspace/
elif [[ "$1" == "to-cloud" ]]; then
    rsync -avP --force --delete -e 'ssh -p 62222' ~/Workspace/ ivanp7@home:/mnt/backup/ivanp7/Workspace/
else
    echo Error: unknown destination "$1"
    exit 1
fi

