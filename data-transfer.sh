#!/bin/bash

pi="host name"
pc="remote host name"

echo "The CWD is $(pwd)"

FILE="dataset"
PUBLIC_DIR="$HOME/Public"

if ls $FILE; then
    echo "$FILE exists"
    rm -rf $FILE
    echo "Delete old file"
    mkdir -p $FILE/d435_data
else 
    mkdir -p $FILE/d435_data
fi
    echo "File $FILE created"

echo "==========================================================="

#data_dir=find $FILE -maxdepth 0 -empty -exec echo {} is empty. \;
if find $FILE -maxdepth 0 -empty; then
    tar -czvf $FILE.tar.gz  *.bag && echo "File $FILE.tar.gz created"
    mv $FILE.tar.gz /home/pi/Public/$FILE.tar.gz && echo "File $FILE.tar.gz moved to $PUBLIC_DIR"
    rm -rf $FILE
    echo "Delete $FILE directory!"
else
    echo "The $FILE directory is empty!"
    exit 1
fi
rsync $FILE.tar.gz  /home/pi/Public/$FILE.tar.gz

echo "==========================================================="
echo "The Public dir contains the following: "
echo "$(ls /home/pi/Public)"

read -rp "Files to transfer: " tr_file_dir
read -rp "Destination file name: " dst_file_dir


scp /home/pi/Public/$tr_file_dir $pc/
