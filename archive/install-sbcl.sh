#!/bin/bash

DOWNLOAD_URL="https://netcologne.dl.sourceforge.net/project/sbcl/sbcl/1.4.2/sbcl-1.4.2-x86-64-linux-binary.tar.bz2"
SRC_DIR_NAME=sbcl-1.4.2-x86-64-linux

ARCHIVE_NAME=sbcl-1.4.2-x86-64-linux-binary.tar.bz2
DOWNLOADS_DIR=~/Downloads
EXTRACT_DIR=~/src

INSTALL_COMMAND="sudo sh install.sh"

echo Installing Steel-Bank Common Lisp...
echo ====================================

echo 1. Downloading the archive...
# echo ------------------------------------
# wget -O $DOWNLOADS_DIR/$ARCHIVE_NAME $DOWNLOAD_URL
echo Skipped.

echo 2. Extracting the archive...
echo ------------------------------------
tar -vxf $DOWNLOADS_DIR/$ARCHIVE_NAME -C $EXTRACT_DIR

echo 3. Running the installation...
echo ------------------------------------
cd $EXTRACT_DIR/$SRC_DIR_NAME
$INSTALL_COMMAND

echo ====================================
echo Done!
