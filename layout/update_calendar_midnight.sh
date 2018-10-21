#!/bin/bash

touch $HOME/Org/calendar
echo "sh $0" | at midnight > /dev/null 2>&1

