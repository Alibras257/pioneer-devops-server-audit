#!/bin/bash

############################################################
# Pioneer DevOps - Daily Server Audit Script
#
# Description:
# Collects key Linux server health metrics and generates
# a timestamped report.
#
# Demonstrates:
# - Variables
# - Command substitution
# - Conditional statements
# - File redirection
# - Bash automation
############################################################

# Exit immediately if a command fails
set -e

############################
# Configuration
############################

DISK_THRESHOLD=80

############################
# Determine project directories
############################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
REPORT_DIR="$PROJECT_ROOT/reports"

# Create reports directory if it doesn't exist
mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/server_audit_$(date +%F_%H-%M-%S).txt"

############################
# Verify required commands
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
# Collect system information
############################

DATE=$(date)
HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)
UPTIME=$(uptime -p)
MEMORY_USAGE=$(free -h | awk '/Mem:/ {print $3 " / " $2}')
DISK_USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')
OS=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)

############################
# Generate report
############################

{
echo "========================================================"
echo "              DAILY SERVER AUDIT REPORT"
echo "========================================================"
echo
echo "Generated On : $DATE"
echo "Hostname     : $HOSTNAME"
echo "Operating OS : $OS"
echo "Kernel       : $KERNEL"
echo "Current User : $CURRENT_USER"
echo "System Uptime: $UPTIME"
echo
echo "Memory Usage : $MEMORY_USAGE"
echo "Disk Usage   : ${DISK_USAGE}%"
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
# Display success message
############################

echo
echo "========================================"
echo "Server audit completed successfully."
echo "Report saved to:"
echo "$REPORT_FILE"
echo "========================================"
