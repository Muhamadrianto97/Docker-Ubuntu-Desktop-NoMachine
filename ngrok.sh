#!/bin/bash
stty intr ""
stty quit ""
stty susp undef

clear
rm -rf ngrok locxl.zip ng.sh > /dev/null 2>&1
echo "======================="
echo "Downloading ngrok..."
echo "======================="
wget -O locxl.zip https://api.localxpose.io/api/downloads/loclx-linux-amd64.zip > /dev/null 2>&1
tar -xvzf loclx.zip > /dev/null 2>&1

