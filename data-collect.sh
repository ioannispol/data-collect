#!/bin/bash
# Data collection script

FILE=~/d435-data-collect
cfg="./data_collect.cfg"
PUBLIC_DIR="$HOME/$USER/Public"

echo "The CWD is: " $PWD

# TODO:create separate folders in the collection dir
if ls $FILE; then
    echo "$FILE folder exists"
    # rm -rf $FILE
    # echo "Delete old file"
    read -rp "Enter the name of the test folder: " folder
    mkdir -p $FILE/d435_data/$folder
else 
    read -rp "Enter the name of the test folder: " folder
    mkdir -p $FILE/d435_data/$folder
fi
    echo "File $FILE created"

echo "Monitor leak sensor"
#./leak_monitor.sh

echo "==========================================================="
echo "Data collection statistics started"

read -rp "Enter the time of the data collection (seconds): " collect_time
read -rp "Enter the required frames: " collect_frames

rs-data-collect -c $cfg -f ./log.csv -t $collect_time -m $collect_frames
if [ $? -eq 0 ]; then
    echo "rs-data-collect completed"
else
    echo "rs-data-collect failed"
    exit 1
fi

echo "Collect D435 camera intrisics/extrinsics"
rs-enumerate-devices -c > $FILE/d435_data/$folder/d435_intrinsics_extrinsics.txt

./D435_intrinsics
if [ $? -eq 0 ]; then
    echo "D435_intrinsics completed"
    mv ./intrinsic.txt $FILE/d435_data/$folder/intrinsics.txt
else
    echo "D435_intrinsics failed"
    exit 1
fi

echo "==========================================================="
echo "rs-record started"
#read -rp "Enter the data collection number (d435_recode_number): " collect_num

#rs-record -f $FILE/d435_data/d435_record_$collect_num.bag -t $collect_time
./d435_recorder -f $FILE/d435_data/$folder/d435_record_$file.bag -t $collect_time
if [ $? -eq 0 ]; then
    echo "rs-record $collect_num completed"
    mv ./out/intrinsics.txt $FILE/d435_data/$folder/d435_intrinsics.txt
else
    echo "rs-record failed"
    exit 1
fi

echo "==========================================================="
if find $FILE/d435_data/$folder -maxdepth 0; then
    #tar -czvf $FILE/$folder.tar.gz $FILE/d435_data/$folder && echo "File $folder.tar.gz created"
    tar cf - $FILE/d435_data/$folder -P | pv -s $(du -sb $FILE/d435_data/$folder | awk '{print $1'}) | gzip > $FILE/$folder.tar.gz &&
    echo "File $folder.tar.gz created"
    mv $FILE/$folder.tar.gz ~/Public/ && echo "File $folder.tar.gz moved to $PUBLIC_DIR"
    rm -rf $FILE/d435_data/$folder
    echo "Delete $FILE/$folder directory!"
else
    echo "The $FILE directory is empty!"
    exit 1
fi

#rsync $FILE/d435_data/$folder.tar.gz  $PUBLIC_DIR/$FILE.tar.gz

echo "=================== END ==================================="