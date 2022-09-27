#!/bin/bash
# Data collection script

FILE=~/d435-data-collect
cfg="data_collect.cfg"

if ls $FILE; then
    echo "$FILE exists"
    rm -rf $FILE
    echo "Delete old file"
    mkdir -p $FILE/d435_data
else 
    mkdir -p $FILE/d435_data
fi
    echo "File $FILE created"

echo "Monitor leak sensor"
python leak-sensor/ard2pi.py


echo "==========================================================="
echo "Data collection statistics started"

read -rp "Enter the time of the data collection (seconds): " collect_time
real -rp "Enter the required frames: " collect_frames
 
rs-data-collect -c $cfg -f ./log.csv -t $collect_time -m $collect_frames
 if [ $? -eq 0 ]; then
     echo "rs-data-collect completed"
 else
     echo "rs-data-collect failed"
     exit 1
 fi

echo "Collect D435 camera intrisics/extrinsics"
rs-enumerate-devices -c > $FILE/d435_data/d435_intrinsics_extrinsics.txt

./build/D435_intrinsics
 if [ $? -eq 0 ]; then
     echo "D435_intrinsics completed"
     mv build/intrinsic.txt $FILE/d435_data/intrinsics.txt
 else
     echo "D435_intrinsics failed"
     exit 1
 fi

echo "==========================================================="
echo "rs-record started"
read -rp "Enter the data collection number (d435_recode_number): " collect_num

rs-record -f $FILE/d435_data/d435_record_$collect_num.bag -t $collect_time
if [ $? -eq 0 ]; then
    echo "rs-record $collect_num completed"
else
    echo "rs-record failed"
    exit 1
fi