#!/bin/bash
#log file location
LOG_FILE='/var/log/system_health.log'
#date and time set
DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "------System health check at $DATE ----" >> $LOG_FILE

#CPU Usage
echo "CPU LOAD:" >> $LOG_FILE
top -bn1 | grep "Cpu(s)" >> $LOG_FILE

#Memory Usage
echo "Memory Usage:" >> $LOG_FILE
free -h >> $LOG_FILE

#Disk Usage
echo "Disk Usage:" >> $LOG_FILE
df -h >> $LOG_FILE

#Uptime
echo "Uptime:" >> $LOG_FILE
uptime >> $LOG_FILE
