# Pioneer DevOps - Daily Server Audit Script

## Overview

This project automates daily Linux server health checks using Bash scripting.

The script collects:

- Hostname
- Current User
- System Uptime
- Memory Usage
- Disk Usage

It also checks disk utilization against a configurable threshold and generates a daily audit report.

---

## Project Structure

```
scripts/
reports/
screenshots/
docs/
```

---

## Requirements

- Linux
- Bash
- awk
- df
- free
- uptime

---

## Running the Script

Navigate into the scripts directory.

```bash
cd scripts
```

Make the script executable.

```bash
chmod +x daily_server_audit.sh
```

Run the script.

```bash
./daily_server_audit.sh
```

The generated report will be stored in:

```
reports/
```

---

## Sample Output

```
=========================================
DAILY SERVER AUDIT REPORT
=========================================

Hostname: ubuntu-server
Memory Usage: 1.3Gi / 3.8Gi
Disk Usage: 41%

Disk usage is within acceptable limits.
```

---

## Learning Objectives

- Bash scripting
- Variables
- Command substitution
- Conditional statements
- File redirection
- Linux system monitoring
