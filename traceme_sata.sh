#!/bin/bash

name="trace"

if [[ $1 == "clean" ]]; then
	rm -rf $(ls --ignore=*.sh)
	exit
elif [[ $1 == "" ]]; then
	:
else
	name=$1
fi
sudo blktrace -d /dev/sdb -o $name


