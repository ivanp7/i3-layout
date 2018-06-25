#!/bin/bash

USERNAME=ivanp7

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

if [[ "$1" == "download" ]]
then
    SCP_COMMAND="scp -P $PORT $USERNAME@$HOSTNAME:\"$3\" \"$4\""
elif [[ "$1" == "upload" ]]
then
    SCP_COMMAND="scp -P $PORT \"$3\" $USERNAME@$HOSTNAME:\"$4\""
else
    echo Error: unknown command "$1"
    exit 1
fi

echo $SCP_COMMAND
bash -c "$SCP_COMMAND"

