#!/bin/bash

if [[ "$1" == "keys" ]]; then
    rsync -avP --force --delete ~/Personal/Keys/ ~/Dropbox/Keys/
elif [[ "$1" == "data-to-drive" ]]; then
    rsync -avP --force --delete ~/HostShared/Workspace/Data/ /mnt/mount-$2/Backup/Workspace/Data/
elif [[ "$1" == "data-to-cloud" ]]; then
    rsync -avP --force --delete -e 'ssh -p 62222' ~/HostShared/Workspace/Data/ ivanp7@home:/mnt/backup/ivanp7/Workspace/Data/
else
    echo Error: unknown command "$1"
    exit 1
fi

