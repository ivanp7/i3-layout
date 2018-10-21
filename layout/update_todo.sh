#!/bin/bash

todo.sh list
while true
do
    inotifywait -qq -e move_self $HOME/Org/todo/todo.txt
    clear
    todo.sh list
done

