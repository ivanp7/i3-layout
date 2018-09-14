#!/bin/bash

CLOUD_HOSTNAME=home-primary
CLOUD_BACKUP_DIRECTORY=/mnt/hdd/backup-primary

if [[ "$1" == "keys" ]]; then
    rsync -avP --force --delete "$HOME/Personal/Keys/" "$HOME/Dropbox/Keys/"

elif [[ "$1" == "vm" ]]; then
    remote.sh upload $CLOUD_HOSTNAME "$HOME/HostShared/VirtualMachines/" "$CLOUD_BACKUP_DIRECTORY/VirtualMachines/Used/"

elif [[ "$1" == "data" ]]; then
    if [[ -z "$2" ]]; then
        remote.sh upload $CLOUD_HOSTNAME "$HOME/HostShared/Workspace/Data/" "$CLOUD_BACKUP_DIRECTORY/Workspace/Data/" --force --delete
    else
        rsync -avP --force --delete "$HOME/HostShared/Workspace/Data/" "$2"
    fi

else
    echo Error: unknown command "$1"
    exit 1
fi

