#!/bin/sh

echo "=== System Information Dashboard ==="
echo "Date: $(date)"
echo "HostName: $(hostname)"
echo "Current User: $(whoami)"
echo "Current DIrectory $(pwd)"
echo "Uptime $(uptime -p)"
echo "Disk Usage:  "
df -h | grep -E '^/dev'
echo ""
echo "Memory Usage: "
free -h
