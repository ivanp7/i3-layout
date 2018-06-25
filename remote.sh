#!/bin/bash

USERNAME=ivanp7
LOCAL_PORT=65535

# Known servers
if [[ "$2" == "roboticslab" ]]
then
    HOSTNAME=roboticslab
    PORT=62222
    WAKEUP_PORT=40000
    MAC_ADDRESS="38:60:77:72:d5:a0"
elif [[ "$2" == "home-black" ]]
then
    HOSTNAME=home
    PORT=62222
    WAKEUP_PORT=61111
    MAC_ADDRESS="40:61:86:63:db:cc"
elif [[ "$2" == "home-white" ]]
then
    HOSTNAME=home
    PORT=62223
    WAKEUP_PORT=61112
    MAC_ADDRESS="00:14:2a:a0:5f:1f"
else
    echo Error: unknown host "$2"
    exit 2
fi

if [[ "$1" == "check" ]]
then
    COMMAND="nc -z $HOSTNAME $PORT"
elif [[ "$1" == "wakeup" ]]
then
    COMMAND="wol -p $WAKEUP_PORT -i $HOSTNAME $MAC_ADDRESS"

elif [[ "$1" == "upload" ]]
then
    COMMAND="rsync -avrP -e 'ssh -p $PORT' \"$3\" $USERNAME@$HOSTNAME:\"$4\""
elif [[ "$1" == "download" ]]
then
    COMMAND="rsync -avrP -e 'ssh -p $PORT' $USERNAME@$HOSTNAME:\"$3\" \"$4\""

elif [[ "$1" == "command" ]]
then
    SSH_FLAGS="-p $PORT"
    COMMAND="TERM=xterm-256color ssh $SSH_FLAGS $USERNAME@$HOSTNAME ${@:3}"
elif [[ "$1" == "tunnel" ]]
then
    SSH_FLAGS="-D $LOCAL_PORT -N -p $PORT"
    COMMAND="TERM=xterm-256color ssh $SSH_FLAGS $USERNAME@$HOSTNAME"

else
    echo Error: unknown command "$1"
    exit 1
fi

echo $COMMAND
bash -c "$COMMAND"

