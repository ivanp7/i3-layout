#!/bin/bash

sudo mount -o rw,uid=ivanp7,gid=ivanp7,dmask=0022,fmask=0133,defaults /dev/$1 /mnt/usb-drive/

