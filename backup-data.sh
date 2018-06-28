#!/bin/bash

if [[ "$1" == "to-disk" ]]; then
    rsync -avP --force --delete ~/HostShared/Workspace/Data/ /mnt/usb-drive/Backup/Workspace/Data/
elif [[ "$1" == "to-cloud" ]]; then
    rsync -avP --force --delete -e 'ssh -p 62222' ~/HostShared/Workspace/Data/ ivanp7@home:/mnt/backup/ivanp7/Workspace/Data/
else
    echo Error: unknown destination "$1"
    exit 1
fi

