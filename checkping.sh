#!/bin/bash
IP_FILE="/root/ip_list.txt"
LOGFILE="/var/log/ping_checker.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

rm -f $LOGFILE

while read IP; do
	ping -c 2 $IP > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "$DATE - $IP is up" >> $LOGFILE
	else
		echo "$DATE - $IP is down" >> $LOGFILE
	fi
done < $IP_FILE

sleep 120
mail -s "Ping status report at $DATE" arifulislamece7@gmail.com < $LOGFILE

