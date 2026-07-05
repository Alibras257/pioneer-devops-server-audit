#!/bin/bash

############################################################
# Pioneer DevOps - Daily Server Audit Script
#
# Description:
# Collects key Linux server health metrics and generates
# a timestamped report.
#
<<<<<<< HEAD
# Demonstrates:
# - Variables
# - Command substitution
# - Conditional statements
# - File redirection
# - Bash automation
############################################################

# Exit immediately if a command fails
=======
# Features:
# - Hostname
# - Current User
# - System Uptime
# - Memory Usage
# - Disk Usage
# - Filesystem Summary
# - Disk Threshold Warning
# - Automatic Report Creation
############################################################

# Exit immediately if any command fails
>>>>>>> 6663398 (Updated README file)
set -e

############################
# Configuration
############################

DISK_THRESHOLD=80

############################
<<<<<<< HEAD
# Determine project directories
=======
# Project Directories
>>>>>>> 6663398 (Updated README file)
############################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
REPORT_DIR="$PROJECT_ROOT/reports"

# Create reports directory if it doesn't exist
mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/server_audit_$(date +%F_%H-%M-%S).txt"

############################
<<<<<<< HEAD
# Verify required commands
=======
# Verify Required Commands
>>>>>>> 6663398 (Updated README file)
############################

REQUIRED_COMMANDS=(
    hostname
    whoami
    uptime
    free
    df
    awk
    date
)

for cmd in "${REQUIRED_COMMANDS[@]}"
do
    if ! command -v "$cmd" >/dev/null 2>&1
    then
        echo "ERROR: Required command '$cmd' is not installed."
        exit 1
    fi
done

############################
<<<<<<< HEAD
# Collect system information
############################

DATE=$(date)
HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)
=======
# Collect Information
############################

DATE=$(date)

HOSTNAME=$(hostname)

CURRENT_USER=$(whoami)

>>>>>>> 6663398 (Updated README file)
UPTIME=$(uptime -p)
MEMORY_USAGE=$(free -h | awk '/Mem:/ {print $3 " / " $2}')
DISK_USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')
OS=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)

<<<<<<< HEAD
############################
# Generate report
############################

{
echo "========================================================"
echo "              DAILY SERVER AUDIT REPORT"
echo "========================================================"
=======
MEMORY_USAGE=$(free -h | awk '/Mem:/ {print $3 " / " $2}')

DISK_USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

OS=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')

KERNEL=$(uname -r)

############################
# Create Report
############################

{

echo "========================================================"
echo "              DAILY SERVER AUDIT REPORT"
echo "========================================================"

>>>>>>> 6663398 (Updated README file)
echo
echo "Generated On : $DATE"
echo "Hostname     : $HOSTNAME"
echo "Operating OS : $OS"
echo "Kernel       : $KERNEL"
echo "Current User : $CURRENT_USER"
echo "System Uptime: $UPTIME"
<<<<<<< HEAD
echo
echo "Memory Usage : $MEMORY_USAGE"
echo "Disk Usage   : ${DISK_USAGE}%"
=======

echo
echo "Memory Usage : $MEMORY_USAGE"
echo "Disk Usage   : ${DISK_USAGE}%"

>>>>>>> 6663398 (Updated README file)
echo

if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "WARNING: Disk usage has exceeded ${DISK_THRESHOLD}%."
else
    echo "Disk usage is within acceptable limits."
fi

echo
echo "Filesystem Summary"
echo "------------------------------"
df -h

echo
echo "========================================================"
echo "Audit Completed Successfully"
echo "========================================================"

} > "$REPORT_FILE"

############################
<<<<<<< HEAD
# Display success message
=======
# Display Success Message
>>>>>>> 6663398 (Updated README file)
############################

echo
echo "========================================"
echo "Server audit completed successfully."
echo "Report saved to:"
echo "$REPORT_FILE"
<<<<<<< HEAD
echo "========================================"
=======
echo "========================================"
>>>>>>> 6663398 (Updated README file)
