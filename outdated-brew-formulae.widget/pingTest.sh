#!/bin/bash
while true
do
	if ping -c 1 -t 1 8.8.8.8 &> /dev/null
	then
		/usr/local/bin/brew update >> /Users/snake/Documents/brew/updateLog.txt
		sleep 2
		/usr/local/bin/brew outdated --verbose
		exit 1
	else
	 sleep 60
	fi
done
