#!/bin/bash

# Exit on error
set -e

# Install required packages (for CentOS/RHEL)
echo "Installing required packages..."
sudo yum install -y git curl cron

# Set up the project directory structure
echo "Setting up project directories..."
mkdir -p /home/ec2-user/automation-script-hub/{scripts,logs}

# Clone the repository if not already done
if [ ! -d "/home/ec2-user/automation-script-hub" ]; then
    echo "Cloning automation-script-hub repository..."
    git clone https://github.com/sgill3077/automation-script-hub.git /home/ec2-user/automation-script-hub
else
    echo "Project already cloned."
fi

# Set file permissions for the project
echo "Setting file permissions..."
sudo chown -R ec2-user:ec2-user /home/ec2-user/automation-script-hub

# Install cron jobs
echo "Setting up cron jobs..."
(crontab -l 2>/dev/null; echo "0 3 * * * /home/ec2-user/automation-script-hub/scripts/patch_manager.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 4 * * * /home/ec2-user/automation-script-hub/scripts/log_cleaner.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 5 * * * /home/ec2-user/automation-script-hub/scripts/service_recovery.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 6 * * * /home/ec2-user/automation-script-hub/scripts/health_check.sh") | crontab -

# Start and enable necessary services
echo "Starting and enabling necessary services..."
sudo systemctl enable cron
sudo systemctl start cron

# Output success message
echo "Setup completed successfully!"


