#!/bin/bash

img2txt -W 144 -H 50 -g $2 -d $3 -f ansi $1 | sudo tee /etc/issue
echo | sudo tee -a /etc/issue > /dev/null
echo 'Arch Linux \r (\l)' | sudo tee -a /etc/issue > /dev/null
echo | sudo tee -a /etc/issue > /dev/null

