#!/bin/bash

CLOUD_HOSTNAME=home-primary

if [[ "$1" == "keys" ]]; then
    rsync -avP --force --delete "~/Personal/Keys/" "~/Dropbox/Keys/"

elif [[ "$1" == "vm" ]]; then
    if [[ -z "$2" ]]; then
        remote.sh upload $CLOUD_HOSTNAME "~/HostShared/VirtualMachines/" "/mnt/backup/Disk/VirtualMachines/Used/"
    else
        if [[ -z "$3" ]]; then
            remote.sh upload $CLOUD_HOSTNAME "~/VirtualMachines/$2" "/mnt/backup/Disk/VirtualMachines/Used/"
        else
            rsync -avP "~/VirtualMachines/$2" "$3"
        fi
    fi

elif [[ "$1" == "data" ]]; then
    if [[ -z "$2" ]]; then
        remote.sh upload $CLOUD_HOSTNAME "~/HostShared/Workspace/Data/" "/mnt/backup/Disk/Workspace/Data/" --force --delete
    else
        rsync -avP --force --delete "~/HostShared/Workspace/Data/" "$2"
    fi

else
    echo Error: unknown command "$1"
    exit 1
fi

