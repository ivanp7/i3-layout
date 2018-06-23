#!/bin/bash

USERNAME=ivanp7
LOCAL_PORT=65535

# Known servers
if [[ "$2" == "roboticslab" ]]
then
    HOSTNAME=roboticslab
    PORT=62222
elif [[ "$2" == "home-black" ]]
then
    HOSTNAME=home
    PORT=62222
elif [[ "$2" == "home-white" ]]
then
    HOSTNAME=home
    PORT=62223
else
    echo Error: unknown host "$2"
    exit 2
fi

if [[ "$1" == "check" ]]
then
    COMMAND="nc -z $HOSTNAME $PORT"
else
    if [[ "$1" == "login" ]]
    then
        SSH_FLAGS="-p $PORT"
    elif [[ "$1" == "tunnel" ]]
    then
        SSH_FLAGS="-D $LOCAL_PORT -N -p $PORT"
    else
        echo Error: unknown command "$1"
        exit 1
    fi

    COMMAND="TERM=xterm-256color ssh $SSH_FLAGS $USERNAME@$HOSTNAME"
fi

echo $COMMAND
bash -c "$COMMAND"

