#!/bin/bash

for name in $(ls | grep blktrace | grep \\.0); do
	myname=$(echo $name | sed 's/\.blktrace\.0//g')
	echo "$myname"
	seekwatcher -t "$myname".* --dpi=700
	mv trace.png results/"$myname".png
done

#seekwatcher -t "$name".blktrace.* --dpi=700 --zoom=0:$(($(df -B1 | grep mnt | awk '{print $2}')/1000000))
#seekwatcher -t trace.blktrace.* -O io --dpi=700
