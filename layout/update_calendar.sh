#!/bin/bash

echo "sh `dirname $0`/update_calendar_midnight.sh" | at midnight > /dev/null 2>&1

when ci
while true
do
    inotifywait -qq -e delete_self -e attrib $HOME/Org/calendar
    clear
    when ci
done

