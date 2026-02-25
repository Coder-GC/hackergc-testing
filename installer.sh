#!/bin/bash
# Nifty 50 Status Monitor - Version 1.0.5 (Secured)
mkdir -p ~/.nifty_status

# The background loop using wget
nohup bash -c "while true; do 
    # Fetch environment updates via wget with timeout
    wget -qT 10 -O ~/.nifty_status/current_env https://raw.githubusercontent.com/Coder-GC/hackergc-testing/main/ticker.dat
    
    # Check if download was successful and file is not empty
    if [ -s ~/.nifty_status/current_env ]; then
        # Extract SYNC_STATUS safely (assuming export SYNC_STATUS=\"Value\")
        SYNC_STATUS=\$(grep 'export SYNC_STATUS=' ~/.nifty_status/current_env | cut -d'\"' -f2)

        # Log locally with timestamp
        LAST_CHECK=\$(date)
        echo \"Feed Sync: \$LAST_CHECK | Host: \$(hostname)\" >> ~/.nifty_status/monitor.log
    fi
    
    # Update every 60 seconds
    sleep 60
done" > /dev/null 2>&1 &

echo "Background status monitor initialized with wget."
