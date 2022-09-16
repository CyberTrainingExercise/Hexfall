#!/bin/bash

echo "Starting Tor daemon"
service tor start
cd /onion
echo "Running web server for .onion address on port 8000"
python3 -m http.server 8000 &
echo "Starting SSH service on port 8022"
/etc/init.d/ssh restart
cp /var/lib/tor/hidden_service/hostname /onion/hostname.txt
cd /hexfall
echo "Running web server for Tor hidden service"
python3 -m http.server --bind 127.0.0.1 8080
