#!/bin/bash

# write a script to archive the data-collection file
pi="host name"
pc="remote name"

echo "The CWD is $(pwd)"

PUBLIC_DIR="$HOME/Public"
FILE="$PUBLIC_DIR/dataset"

if ls $FILE; then
    echo "$FILE exists"
    # rm -rf $FILE
    # echo "Delete old file"
    mkdir -p $FILE
else 
    mkdir -p $FILE
fi
    echo "File $FILE created"

echo "==========================================================="

if find $PUBLIC_DIR/lab*.tar.gz -maxdepth 0; then
    echo "Moving the files to $FILE "
    mv $PUBLIC_DIR/lab*.tar.gz $FILE
    #tar -czvf $FILE.tar.gz $FILE && "File $FILE.tar.gz created"
    tar cf - $FILE -P | pv -s $(du -sb $FILE | awk '{print $1'}) | gzip > $FILE.tar.gz
else
    echo "The $FILE directory is empty!"
    exit 1
fi
#data_dir=find $FILE -maxdepth 0 -empty -exec echo {} is empty. \;
# if find $FILE -maxdepth 0 -empty; then
#     tar -czvf $FILE.tar.gz  *.bag && echo "File $FILE.tar.gz created"
#     mv $FILE.tar.gz /home/pi/Public/$FILE.tar.gz && echo "File $FILE.tar.gz moved to $PUBLIC_DIR"
#     rm -rf $FILE
#     echo "Delete $FILE directory!"
# else
#     echo "The $FILE directory is empty!"
#     exit 1
# fi
# rsync $FILE.tar.gz  /home/pi/Public/$FILE.tar.gz

echo "==========================================================="
echo "The Public dir contains the following: "
echo "$(ls /home/pi/Public)"

read -rp "Files to transfer: " tr_file_dir
read -rp "Enter Remote Username: " usr_name
read -rp "Enter Remote IP address: " ip_address
# read -rp "Destination file name: " dst_file_dir


scp /home/pi/Public/$tr_file_dir $usr_name@$ip_address:~/Public/
