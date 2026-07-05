# Pioneer DevOps - Daily Server Audit Script

## Overview

This project demonstrates Linux automation using Bash scripting.

The script automatically collects key server health metrics and generates a timestamped audit report.

## Features

- Hostname
- Current User
- Operating System
- Kernel Version
- System Uptime
- Memory Usage
- Disk Usage
- Filesystem Summary
- Disk Usage Warning
- Automatic Report Generation

## Project Structure

```
pioneer-devops-server-audit/
│
├── README.md
├── docs/
│   └── script_explanation.md
├── reports/
├── screenshots/
└── scripts/
    └── daily_server_audit.sh
```

## Requirements

- Ubuntu Linux / WSL
- Bash
- awk
- df
- free
- uptime

## Make Executable

```bash
chmod +x scripts/daily_server_audit.sh
```

## Run

```bash
./scripts/daily_server_audit.sh
```

## Output

Reports are automatically generated inside:

```
reports/
```

Example:

```
reports/server_audit_2026-07-05_20-15-31.txt
```

## Bash Concepts Demonstrated

- Variables
- Command substitution
- Conditional statements
- Loops
- File redirection
- Functions
- Linux monitoring commands
- Error handling
