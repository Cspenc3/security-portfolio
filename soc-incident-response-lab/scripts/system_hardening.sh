#!/bin/bash

# SOC Incident Response Lab - Basic Linux Hardening Script
# Purpose: Simulate post-investigation hardening actions after abnormal network behavior is identified.

set -e

LOG_FILE="hardening_results.txt"

echo "SOC Incident Response Lab - System Hardening" | tee "$LOG_FILE"
echo "Started: $(date)" | tee -a "$LOG_FILE"
echo "----------------------------------------" | tee -a "$LOG_FILE"

# Step 1: Update package lists
echo "[1] Updating package lists..." | tee -a "$LOG_FILE"
sudo apt update | tee -a "$LOG_FILE"

# Step 2: List active services for review
echo "[2] Listing active services for review..." | tee -a "$LOG_FILE"
systemctl --type=service --state=running | tee -a "$LOG_FILE"

# Step 3: Check firewall status if UFW is installed
echo "[3] Checking firewall status..." | tee -a "$LOG_FILE"
if command -v ufw >/dev/null 2>&1; then
    sudo ufw status verbose | tee -a "$LOG_FILE"
else
    echo "UFW is not installed on this system." | tee -a "$LOG_FILE"
fi

# Step 4: Review permissions on home directory
echo "[4] Reviewing /home permissions..." | tee -a "$LOG_FILE"
ls -ld /home | tee -a "$LOG_FILE"

# Step 5: Record recent authentication log entries if available
echo "[5] Collecting recent authentication log entries..." | tee -a "$LOG_FILE"
if [ -f /var/log/auth.log ]; then
    sudo tail -n 20 /var/log/auth.log | tee -a "$LOG_FILE"
else
    echo "Authentication log not found at /var/log/auth.log." | tee -a "$LOG_FILE"
fi

echo "----------------------------------------" | tee -a "$LOG_FILE"
echo "Hardening review complete. Results saved to $LOG_FILE" | tee -a "$LOG_FILE"
