#!/bin/bash

mkdir results 2>/dev/null
log_loc="results/"$1
if [[ $log_loc == "results/" ]]; then
	log_loc="results/test"
fi
rm $log_loc*.log 2>/dev/null

#read, write, randread, randwrite, readwrite or rw, randrw

filesize=$(($(df -h | grep "/home/jeongho/mnt" | awk '{print $2}' | sed 's/G//g')/3))
filesize=64
echo filesize to test: "$filesize"GB

fio \
-direct=1 \
-iodepth=128 \
-rw=write \
-ioengine=libaio \
-bs=4K \
-size="$filesize"G \
-numjobs=1 \
-runtime=1000 \
-group_reporting \
-filename=/home/jeongho/mnt/fiotest \
-name=rand_write_testing \
-iopsavgtime=1000 \
-log_avg_msec=1000 \
-write_bw_log=$log_loc \
-write_lat_log=$log_loc \
-write_iops_log=$log_loc

