#!/bin/bash

SYNC_COMMAND='"cd /home/shared/dotfiles; git pull; cd /home/shared/x-dotfiles; git pull"'

remote.sh roboticslab command "$SYNC_COMMAND"
remote.sh home-primary wakeup
remote.sh home-primary command "$SYNC_COMMAND"
remote.sh home-secondary wakeup
remote.sh home-secondary command "$SYNC_COMMAND"

