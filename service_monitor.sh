#!/bin/bash 

services=("sshd","NetworkManager", "systemd-resolved","cron")
echo "=== SERVICE MONITORING ==="
echo "Checking critical services..."
echo ""

for service in "${services[@]}"; do
  if systemctl is-active --quiet "$service"; then 
    echo "✅ $service is running"
    status = $(systemctl is-enabled "$service" 2>/dev/null)
    echo "  Status: $status"
  else 
    echo "❌ $service is NOT running"
    echo "   To start: sudo systemctl start $service "
  fi 
  echo "" 
done

# Check overall system load
load=$(uptime | awk '{print $NF}')
echo "Current system load: $load"

if (( $(echo "$load > 2.0" | bc -l) )); then
    echo "⚠️  WARNING: High system load detected!"
else
    echo "✅ System load is normal"
fi
