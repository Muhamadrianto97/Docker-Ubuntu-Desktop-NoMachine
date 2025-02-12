#!/bin/bash
stty intr ""
stty quit ""
stty susp undef

clear
rm -rf loclx loclx.zip loclx.sh > /dev/null 2>&1
echo "======================="
echo "Downloading Loclx..."
echo "======================="
wget -O locxl.zip https://api.localxpose.io/api/downloads/loclx-linux-amd64.zip > /dev/null 2>&1
unzip locxl.zip > /dev/null 2>&1


