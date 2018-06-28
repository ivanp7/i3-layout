#!/bin/bash

sudo cp -f $1 /etc/issue
echo | sudo tee -a /etc/issue > /dev/null
echo 'Arch Linux \r (\l)' | sudo tee -a /etc/issue > /dev/null
echo | sudo tee -a /etc/issue > /dev/null

