# ⚙️ Automation Script Hub

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Shell](https://img.shields.io/badge/Shell-Bash-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-Windows-blue)
![Status](https://img.shields.io/badge/status-active-brightgreen)
![GitHub stars](https://img.shields.io/github/stars/sgill3077/automation-script-hub?style=social)
![Last Commit](https://img.shields.io/github/last-commit/sgill3077/automation-script-hub)
![Repo Size](https://img.shields.io/github/repo-size/sgill3077/automation-script-hub)
![Issues](https://img.shields.io/github/issues/sgill3077/automation-script-hub)
![Pull Requests](https://img.shields.io/github/issues-pr/sgill3077/automation-script-hub)

**Automation Script Hub** is a cross-platform toolkit of modular scripts built for automating and simplifying routine system administration tasks — designed for DevOps engineers, SysAdmins, and power users on both Linux and Windows.

---

## 🔧 Features

- Modular and scalable script design
- Interactive CLI menus for both Bash and PowerShell
- Centralized logging for auditing and debugging
- Robust error handling and status reporting
- Lightweight with no external dependencies

---

## 🚀 Use Cases

- Auto-patching Linux and Windows servers
- Restarting and monitoring stuck services
- Cleaning temporary files and logs
- Running system health checks and diagnostics

---

## 💻 Tech Stack

- **Linux:** Bash, system utilities (`cron`, `systemctl`, `journalctl`)
- **Windows:** PowerShell (cross-compatible with PowerShell Core)
- **Version Control:** Git

---

## 📁 Directory Structure

```bash
automation-script-hub/
├── linux/                      # Linux automation scripts (Bash)
│   ├── patch_manager.sh
│   ├── service_recovery.sh
│   ├── log_cleaner.sh
│   ├── health_check.sh
│   └── logs/                   # Linux script logs
├── windows/                    # Windows automation scripts (PowerShell)
│   ├── cli.ps1                 # CLI menu entry point
│   ├── patch_system.ps1
│   ├── restart_services.ps1
│   ├── clean_logs.ps1
│   ├── utils.ps1               # Shared functions/utilities
│   └── logs/                   # Windows script logs
├── setup.sh                    # Optional Linux setup script
├── LICENSE
└── README.md
```

---

## ▶️ Getting Started

### 🔹 On Linux
```bash
git clone https://github.com/sgill3077/automation-script-hub.git
cd automation-script-hub/linux
chmod +x *.sh
./patch_manager.sh
```

### 🔹 On Windows
Launch PowerShell as Administrator and run:
```powershell
git clone https://github.com/sgill3077/automation-script-hub.git
cd automation-script-hub\windows
.\cli.ps1
```

---

## 🧪 Example Linux Output

```bash
$ ./patch_manager.sh
[INFO] Checking for available updates...
[INFO] Installing security updates...
[OK] System successfully patched.
```

---

## 📈 Roadmap

- [ ] Add macOS support
- [ ] Email/Slack alerts for script output
- [ ] Web dashboard or GUI wrapper (e.g. YAD, Electron)
- [ ] Unit testing for core utilities

---

## 🤝 Contributing

Pull requests are welcome! For large changes, please open an issue first to discuss your ideas. All contributions must follow the [MIT License](./LICENSE).

---

## 📄 License

Distributed under the MIT License. See [LICENSE](./LICENSE) for full text.
