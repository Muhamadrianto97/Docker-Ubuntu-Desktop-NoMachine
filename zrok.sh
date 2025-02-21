#!/bin/bash
stty intr ""
stty quit ""
stty susp undef

clear
rm -rf zrok zrok.zip zrok.sh > /dev/null 2>&1
echo "======================="
echo "Downloading ngrok..."
echo "======================="
wget -O zrok.tgz https://github.com/openziti/zrok/releases/download/v0.4.48/zrok_0.4.48_linux_amd64.tar.gz > /dev/null 2>&1
tar -xvzf zrok.tgz > /dev/null 2>&1

