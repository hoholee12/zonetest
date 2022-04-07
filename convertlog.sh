#!/bin/bash

for i in *.log; do
	if [[ $(echo $i | grep 1\.log) ]]; then
		mv -f $i $(echo $i | sed 's/\.1//g')
	fi
done
