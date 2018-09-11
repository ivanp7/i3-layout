#!/bin/bash

CLOUD_HOSTNAME=home-primary

if [[ "$1" == "keys" ]]; then
    rsync -avP --force --delete "$HOME/Personal/Keys/" "$HOME/Dropbox/Keys/"

elif [[ "$1" == "vm" ]]; then
    if [[ -z "$2" ]]; then
        remote.sh upload $CLOUD_HOSTNAME "$HOME/HostShared/VirtualMachines/" "/mnt/backup/Disk/VirtualMachines/Used/"
    else
        if [[ -z "$3" ]]; then
            remote.sh upload $CLOUD_HOSTNAME "$HOME/VirtualMachines/$2" "/mnt/backup/Disk/VirtualMachines/Used/"
        else
            rsync -avP "$HOME/VirtualMachines/$2" "$3"
        fi
    fi

elif [[ "$1" == "data" ]]; then
    if [[ -z "$2" ]]; then
        remote.sh upload $CLOUD_HOSTNAME "$HOME/HostShared/Workspace/Data/" "/mnt/backup/Disk/Workspace/Data/" --force --delete
    else
        rsync -avP --force --delete "$HOME/HostShared/Workspace/Data/" "$2"
    fi

else
    echo Error: unknown command "$1"
    exit 1
fi

