# Daily Server Audit Script Documentation

## Purpose

The script automates the collection of key Linux server health metrics and writes the results into a report.

## Variables

Variables are used to store values for reuse.

Example:

```bash
DATE=$(date)
```

Stores the current date.

## Command Substitution

Command substitution captures the output of a command.

Example:

```bash
HOSTNAME=$(hostname)
```

The output of `hostname` becomes the value of `HOSTNAME`.

## Commands Used

| Command | Purpose |
|----------|---------|
| hostname | Display system hostname |
| whoami | Display current user |
| uptime | Display system uptime |
| free | Display memory usage |
| df | Display disk usage |
| awk | Extract command output |
| date | Current date and time |
| uname | Kernel information |
| grep | Read OS information |

## Conditional Logic

The script checks whether disk usage exceeds 80%.

```bash
if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
```

If true, a warning is printed.

## Output Redirection

The report is written to a file using:

```bash
} > "$REPORT_FILE"
```

## Learning Outcomes

- Bash scripting
- Linux monitoring
- Automation
- Variables
- Command substitution
- Conditional statements
- File redirection
<<<<<<< HEAD
- Error handling
=======
- Error handling
>>>>>>> 6663398 (Updated README file)
