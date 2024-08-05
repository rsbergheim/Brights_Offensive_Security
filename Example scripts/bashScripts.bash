#!/bin/bash

# -----------------------------------------------------------
# User Account Monitoring
# Task: Check for user account activity and notify administrators.
# -----------------------------------------------------------

echo "Running User Account Monitoring..."
last | grep -E "still logged in|gone - no logout" | awk '{print "User: " $1 " IP: " $3}' | while read -r line; do
    echo "$line" | mail -s "User Account Activity Notification" admin@example.com
done
echo "User Account Monitoring completed."

# -----------------------------------------------------------
# SSH Authentication Logging
# Task: Log successful and failed SSH login attempts.
# -----------------------------------------------------------

echo "Configuring SSH Authentication Logging..."
SSH_CONFIG_FILE="/etc/ssh/sshd_config"
if grep -q "^UsePAM" $SSH_CONFIG_FILE; then
    sed -i 's/^UsePAM.*/UsePAM yes/' $SSH_CONFIG_FILE
else
    echo "UsePAM yes" >> $SSH_CONFIG_FILE
fi

if grep -q "^LogLevel" $SSH_CONFIG_FILE; then
    sed -i 's/^LogLevel.*/LogLevel VERBOSE/' $SSH_CONFIG_FILE
else
    echo "LogLevel VERBOSE" >> $SSH_CONFIG_FILE
fi

echo "SSH Authentication Logging configured. Please restart the SSH service to apply changes."

# -----------------------------------------------------------
# Firewall Rule Management
# Task: Create a Bash script to manage firewall rules.
# -----------------------------------------------------------

echo "Applying Firewall Rules..."
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# To deny all other inbound traffic
iptables -A INPUT -j DROP

# Save the iptables rules
service iptables save

# If using firewalld instead of iptables, uncomment the following lines
# firewall-cmd --permanent --add-port=22/tcp
# firewall-cmd --reload

echo "Firewall rules applied and saved."

# -----------------------------------------------------------
# Log Rotation and Compression
# Task: Rotate and compress log files for efficient storage.
# -----------------------------------------------------------

echo "Configuring Log Rotation..."
cat <<EOL > /etc/logrotate.conf
/var/log/*.log {
    weekly
    rotate 4
    compress
    delaycompress
    missingok
    notifempty
}
EOL

echo "Log Rotation configured."

# -----------------------------------------------------------
# Security Patch Management
# Task: Check for and apply security patches.
# -----------------------------------------------------------

echo "Applying Security Patches..."
apt-get update
apt-get upgrade -y
echo "Security patches applied."

# -----------------------------------------------------------
# Intrusion Detection System (IDS) Logs
# Task: Monitor IDS logs for suspicious activities.
# -----------------------------------------------------------

echo "Checking IDS Logs..."
grep -i "intrusion" /var/log/ids.log
echo "IDS Logs checked."

# -----------------------------------------------------------
# Backup Configuration Files
# Task: Regularly back up critical configuration files.
# -----------------------------------------------------------

echo "Backing up Configuration Files..."
cp /etc/nginx/nginx.conf /path/to/backup/nginx.conf.backup
echo "Configuration files backed up."
