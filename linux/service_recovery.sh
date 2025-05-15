#!/bin/bash

LOG_FILE="/home/ec2-user/automation-script-hub/logs/service_recovery.log"
SERVICES=("sshd" "httpd" "docker" "amazon-ssm-agent" "postfix" "crond" "auditd" "rsyslog")

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

for service in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$service"; then
        log "$service is running."
    else
        log "$service is down. Attempting to restart..."
        systemctl restart "$service"
        if systemctl is-active --quiet "$service"; then
            log "$service successfully restarted."
        else
            log "Failed to restart $service."
        fi
    fi
done

