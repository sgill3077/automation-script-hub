#!/bin/bash

LOG_DIR="/home/ec2-user/automation-script-hub/logs"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_FILE="$LOG_DIR/log_cleaner.log"

echo "[$TIMESTAMP] Starting log cleaning..." | tee -a "$LOG_FILE"

# Clean up old .log files in /var/log
find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \; -exec echo "[$TIMESTAMP] Deleted {}" >> "$LOG_FILE" \;

# Clean temporary files
echo "[$TIMESTAMP] Cleaning /tmp and /var/tmp..." | tee -a "$LOG_FILE"
rm -rf /tmp/* /var/tmp/* 2>>"$LOG_FILE"

echo "[$TIMESTAMP] Log cleaning completed." | tee -a "$LOG_FILE"

