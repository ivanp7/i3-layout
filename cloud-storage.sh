#!/bin/bash

CLOUD_HOSTNAME=home-primary
CLOUD_REMOTE_DIRECTORY=/mnt/hdd/backup-primary
CLOUD_LOCAL_DIRECTORY=$HOME/Cloud

if [[ "$1" == "mount" ]]; then
    remote.sh $CLOUD_HOSTNAME wakeup
    remote.sh $CLOUD_HOSTNAME mount $CLOUD_REMOTE_DIRECTORY $CLOUD_LOCAL_DIRECTORY -o idmap=user,uid=$(id -u root),gid=$(cut -d: -f3 < <(getent group vmhgfs))
elif [[ "$1" == "unmount" ]]; then
    remote.sh $CLOUD_HOSTNAME unmount $CLOUD_LOCAL_DIRECTORY
else
    echo Error: unknown command "$1"
    exit 1
fi

