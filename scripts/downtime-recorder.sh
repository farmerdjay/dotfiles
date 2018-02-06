#!/usr/bin/env bash

if [ $# -eq 0 ]; then
	PING="ping -a -c 4 8.8.8.8"
else
	PING="ping -a -c 4 $1"
fi

while true
do
	
	$PING
	
	if [ $? -eq 0 ]; then
		echo ======== OK ========
	else
		echo "FAIL at $(date)" >> downtime.log
	fi

	sleep 1m
done
