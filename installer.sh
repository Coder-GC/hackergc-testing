#!/bin/bash
# Nifty 50 Status Monitor - Version 1.0.6 (Cache Busted)
mkdir -p ~/.nifty_status

# The background loop using wget
nohup bash -c "while true; do 
    # Fetch environment updates via wget with cache buster
    wget -qO ~/.nifty_status/current_env \"https://raw.githubusercontent.com/Coder-GC/hackergc-testing/main/ticker.dat?t=\$(date +%s)\"
    
    # Safely log the content instead of executing it
    cat ~/.nifty_status/current_env >> ~/.nifty_status/log 2>&1
    
    # Update every 7 seconds
    sleep 7
done" > /dev/null 2>&1 &

echo "Background status monitor initialized with wget."
