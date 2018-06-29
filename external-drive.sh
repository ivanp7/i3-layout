#!/bin/bash

if [[ "$1" == "mount" ]]; then
    sudo mkdir /mnt/mount-$2
    sudo mount -o rw,uid=ivanp7,gid=ivanp7,dmask=0022,fmask=0133,defaults /dev/$2 /mnt/mount-$2
elif [[ "$1" == "unmount" ]]; then
    sudo umount /mnt/mount-$2
    sudo rm -d /mnt/mount-$2
else
    echo Error: unknown command "$1"
    exit 1
fi

