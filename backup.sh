#!/bin/bash

CLOUD_HOSTNAME=home-primary
CLOUD_BACKUP_DIRECTORY=/mnt/hdd/backup-primary

if [[ "$1" == "keys" ]]; then
    rsync -avP --force --delete "$HOME/Personal/Keys/" "$HOME/Dropbox/Keys/"

elif [[ "$1" == "vm" ]]; then
    remote.sh $CLOUD_HOSTNAME upload "$HOME/HostShared/VirtualMachines/" "$CLOUD_BACKUP_DIRECTORY/VirtualMachines/Used/" -a --groupmap=*:server

elif [[ "$1" == "data" ]]; then
    remote.sh $CLOUD_HOSTNAME upload "$HOME/HostShared/Workspace/Data/" "$CLOUD_BACKUP_DIRECTORY/Workspace/Data/" -a --groupmap=*:server --force --delete

else
    echo Error: unknown command "$1"
    exit 1
fi

