#!/bin/bash

# patch_manager.sh - Automates system patching and package updates
# Designed for Amazon Linux / RHEL / CentOS systems using yum or dnf

LOG_DIR="/home/ec2-user/automation-script-hub/logs"
LOG_FILE="$LOG_DIR/patch_manager_$(date +%F).log"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

# Run updates
log "Starting system patching..."

# Try dnf first (newer distros), fallback to yum
if command -v dnf &>/dev/null; then
    sudo dnf clean all >>"$LOG_FILE" 2>&1
    sudo dnf -y update >>"$LOG_FILE" 2>&1
else
    sudo yum clean all >>"$LOG_FILE" 2>&1
    sudo yum -y update >>"$LOG_FILE" 2>&1
fi

STATUS=$?
if [ $STATUS -eq 0 ]; then
    log "System update completed successfully."
else
    log "System update encountered errors. Exit status: $STATUS"
fi

