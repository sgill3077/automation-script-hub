# Automation Script Hub

**Automation Script Hub** is a personal toolkit of modular Bash scripts designed to streamline and simplify routine system administration tasks on Linux and Unix environments.

## 🔧 Features

- Modular script design for reusability and customization
- Interactive CLI menus for ease of use
- Robust logging and error handling
- Lightweight and fast — no external dependencies

## 🚀 Use Cases

- Automatically patch and update servers
- Restart and monitor essential services
- Clean up temp, cache, and log files
- System health checks and reports

## 💻 Tech Stack

- **Shell Scripting:** Bash
- **Version Control:** Git
- **Other Tools:** `cron`, `systemctl`, `journalctl`, `awk`, `sed`

## 📁 Directory Structure

automation-script-hub/          <-- Your main project folder (root of the repo)
├── scripts/                    <-- A folder that holds all your automation scripts
│   ├── patch_manager.sh        <-- Script to handle patching/updating systems
│   ├── service_recovery.sh     <-- Script to monitor and restart services
│   └── log_cleaner.sh          <-- Script to clean log/temp files
├── logs/                       <-- A folder where logs from the scripts are stored
├── README.md                   <-- The markdown file you just created (project intro)
└── LICENSE                     <-- A file that defines the legal license (MIT, GPL, etc.)


## 📌 Getting Started

Clone the repository and start using the scripts:

```bash
git clone git@github.com:sgill3077/automation-script-hub.git
cd automation-script-hub
chmod +x scripts/*.sh
./scripts/patch_manager.sh

