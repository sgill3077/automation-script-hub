#!/bin/bash

LOG_DIR="$(dirname "$0")/../logs"
LOG_FILE="$LOG_DIR/health_check.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Thresholds
DISK_THRESHOLD=80
MEM_THRESHOLD=75
CPU_THRESHOLD=1.5

# Create log directory if missing
mkdir -p "$LOG_DIR"

echo "[$TIMESTAMP] Running system health check..." | tee -a "$LOG_FILE"

# Disk usage check
echo "[$TIMESTAMP] Checking disk usage..." | tee -a "$LOG_FILE"
df -h --output=pcent,target | tail -n +2 | while read -r line; do
    USAGE=$(echo "$line" | awk '{print $1}' | sed 's/%//')
    MOUNT=$(echo "$line" | awk '{print $2}')
    if [ -z "$MOUNT" ]; then
        continue
    fi
    if (( USAGE > DISK_THRESHOLD )); then
        echo "[$TIMESTAMP] ALERT: Disk usage on $MOUNT is ${USAGE}%!" | tee -a "$LOG_FILE"
    else
        echo "[$TIMESTAMP] OK: Disk usage on $MOUNT is ${USAGE}%." | tee -a "$LOG_FILE"
    fi
done

# Memory usage check
echo "[$TIMESTAMP] Checking memory usage..." | tee -a "$LOG_FILE"
MEM_USED=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
if (( MEM_USED > MEM_THRESHOLD )); then
    echo "[$TIMESTAMP] ALERT: Memory usage is ${MEM_USED}%!" | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] OK: Memory usage is ${MEM_USED}%." | tee -a "$LOG_FILE"
fi

# CPU load check (1-minute load average)
echo "[$TIMESTAMP] Checking CPU load..." | tee -a "$LOG_FILE"
CPU_LOAD=$(awk '{print $1}' /proc/loadavg)
CPU_LOAD_INT=$(echo "$CPU_LOAD > $CPU_THRESHOLD" | bc)
if (( CPU_LOAD_INT == 1 )); then
    echo "[$TIMESTAMP] ALERT: CPU load is high: $CPU_LOAD" | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] OK: CPU load is $CPU_LOAD" | tee -a "$LOG_FILE"
fi

# Uptime
UPTIME=$(uptime -p)
echo "[$TIMESTAMP] Uptime: $UPTIME" | tee -a "$LOG_FILE"

# Top 5 memory-consuming processes
echo "[$TIMESTAMP] Top 5 memory-consuming processes:" | tee -a "$LOG_FILE"
ps aux --sort=-%mem | awk 'NR<=6{printf "%s %s %s%%\n", $1, $11, $4}' | tee -a "$LOG_FILE"

echo "[$TIMESTAMP] Health check completed." | tee -a "$LOG_FILE"

