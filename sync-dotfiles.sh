#!/bin/bash

SYNC_COMMAND='"cd /home/shared/dotfiles; git pull; cd /home/shared/x-dotfiles; git pull"'

function sync_dotfiles ()
{
    remote.sh $1 wakeup
    sleep $2
    remote.sh $1 command "$SYNC_COMMAND"
}

sync_dotfiles roboticslab 0
sync_dotfiles home-primary 10
sync_dotfiles home-secondary 60

