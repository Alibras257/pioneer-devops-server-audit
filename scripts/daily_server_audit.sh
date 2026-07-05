#!/bin/bash

#######################################################
# Daily Server Audit Script
# Author: Ibraheem
# Description:
# Collects important server health metrics and
# generates a daily audit report.
#######################################################

# Store today's date
DATE=$(date)

# Store hostname using command substitution
HOSTNAME=$(hostname)

# Store current logged in user
CURRENT_USER=$(whoami)

# Store system uptime
UPTIME=$(uptime -p)

# Get memory usage
MEMORY=$(free -h | awk '/Mem:/ {print $3 " / " $2}')

# Get disk usage percentage for root partition
DISK_USAGE=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')

# Define disk threshold
THRESHOLD=80

# Report filename
REPORT="../reports/server_audit_$(date +%F).txt"

# Create report
{
echo "========================================="
echo "      DAILY SERVER AUDIT REPORT"
echo "========================================="
echo "Date: $DATE"
echo "Hostname: $HOSTNAME"
echo "Current User: $CURRENT_USER"
echo "System Uptime: $UPTIME"
echo "Memory Usage: $MEMORY"
echo "Disk Usage: ${DISK_USAGE}%"
echo

# Conditional statement
if [ "$DISK_USAGE" -ge "$THRESHOLD" ]
then
    echo "WARNING: Disk usage exceeded ${THRESHOLD}%!"
else
    echo "Disk usage is within acceptable limits."
fi

echo
echo "Audit Completed Successfully."
echo "========================================="

} > "$REPORT"

echo "Report saved to:"
echo "$REPORT"
