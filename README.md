# 🛠️ Automation Script Hub

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Shell](https://img.shields.io/badge/Shell-Bash-blue)
![Status](https://img.shields.io/badge/status-active-brightgreen)
![GitHub stars](https://img.shields.io/github/stars/sgill3077/automation-script-hub?style=social)
![Last Commit](https://img.shields.io/github/last-commit/sgill3077/automation-script-hub)
![Repo Size](https://img.shields.io/github/repo-size/sgill3077/automation-script-hub)
![Issues](https://img.shields.io/github/issues/sgill3077/automation-script-hub)
![Pull Requests](https://img.shields.io/github/issues-pr/sgill3077/automation-script-hub)

**Automation Script Hub** is a curated collection of modular Bash scripts that automate and simplify routine system administration tasks in Linux/Unix environments — ideal for DevOps engineers, SysAdmins, and power users.

---

## 🔧 Features

- Modular script design for reusability and customization  
- Interactive CLI menus for ease of use  
- Robust logging and error handling  
- Lightweight and fast — no external dependencies  

---

## 🚀 Use Cases

- Automatically patch and update servers  
- Restart and monitor essential services  
- Clean up temp, cache, and log files  
- Perform system health checks and generate reports  

---

## 💻 Tech Stack

- **Shell Scripting:** Bash  
- **Version Control:** Git  
- **System Utilities:** `cron`, `systemctl`, `journalctl`, `awk`, `sed`  

---

## 📁 Directory Structure

```
automation-script-hub/          <-- Main project folder (repo root)
├── scripts/                    <-- Contains all the automation scripts
│   ├── patch_manager.sh        <-- Patching system script
│   ├── service_recovery.sh     <-- Monitor & restart services script
│   └── log_cleaner.sh          <-- Clean logs and temp files script
│   └── health_check.sh         <-- Check system health (disk, CPU, etc.)
├── logs/                       <-- Where logs from scripts are stored
├── LICENSE                     <-- License for your project
├── README.md                   <-- Project documentation
└── setup.sh                    <-- A setup script for initial configuration

```

---

## 📌 Getting Started

Clone the repository and start using the scripts:

```bash
git clone git@github.com:sgill3077/automation-script-hub.git
cd automation-script-hub
chmod +x scripts/*.sh
./scripts/patch_manager.sh
```

---

## 🧪 Example Output

```bash
$ ./scripts/patch_manager.sh
[INFO] Checking for available updates...
[INFO] Installing security updates...
[OK] System successfully patched.
```

---

## 📈 Future Plans

- Add support for macOS tools  
- Slack/email alerts for script outputs  
- GUI wrapper (e.g., Zenity or YAD)  

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you'd like to propose.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
