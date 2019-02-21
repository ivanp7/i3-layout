#!/bin/bash

SYNC_COMMAND='"cd /home/shared/dotfiles; git pull; cd /home/shared/x-dotfiles; git pull"'

function sync_dotfiles ()
{
    remote.sh $1 wakeup
    remote.sh $1 command "$SYNC_COMMAND"
}

sync_dotfiles roboticslab
sync_dotfiles home-primary
sync_dotfiles home-secondary

