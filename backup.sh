#!/bin/bash

if [[ "$1" == "keys" ]]; then
    rsync -avP --force --delete ~/Personal/Keys/ ~/Dropbox/Keys/
elif [[ "$1" == "vm" ]]; then
    if [[ -z "$2" ]]; then
        remote.sh upload home-primary ~/HostShared/VirtualMachines/ /mnt/backup/ivanp7/VirtualMachines/
    else
        rsync -avP ~/HostShared/VirtualMachines/ $2
    fi
elif [[ "$1" == "data" ]]; then
    if [[ -z "$2" ]]; then
        remote.sh upload home-primary ~/HostShared/Workspace/Data/ /mnt/backup/ivanp7/Workspace/Data/ --force --delete
    else
        rsync -avP --force --delete ~/HostShared/Workspace/Data/ $2
    fi
else
    echo Error: unknown command "$1"
    exit 1
fi

