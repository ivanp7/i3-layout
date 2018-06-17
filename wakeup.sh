#!/bin/bash

# Known servers
if [[ "$1" == "roboticslab" ]]
then
    HOSTNAME=roboticslab
    PORT=40000
    MAC_ADDRESS="38:60:77:72:d5:a0"
elif [[ "$1" == "home-black" ]]
then
    HOSTNAME=home
    PORT=61111
    MAC_ADDRESS="40:61:86:63:db:cc"
elif [[ "$1" == "home-white" ]]
then
    HOSTNAME=home
    PORT=61112
    MAC_ADDRESS="00:14:2a:a0:5f:1f"
else
    echo Error: unknown host "$1"
    exit 1
fi

WAKEUP_COMMAND="wol -p $PORT -i $HOSTNAME $MAC_ADDRESS"
echo $WAKEUP_COMMAND
bash -c "$WAKEUP_COMMAND"

echo Waiting for 60 seconds...
sleep 60
echo The computer may have started by now.

