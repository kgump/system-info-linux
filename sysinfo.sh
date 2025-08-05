#!/usr/bin/env bash

OS=$(cat /etc/os-release | grep "PRETTY" | sed 's/PRETTY_NAME=//' | sed 's/"//' | sed 's/"//')
totalRAM=$(free -h | awk '/Gi/ {print $2}')
freeRAM=$(free -h | awk '/Gi/ {print $4}')
totalDisk=$(df -h | awk 'NR==4 {print $2}')
freeDisk=$(df -h | awk 'NR==4 {print $4}')
isSystemD=$(ps -p 1 -o comm=)
sh=$(echo $SHELL | sed 's./bin/..' | sed 's./..')

echo ""
tput setaf 6
echo "OS: $OS"
echo "Total RAM: $totalRAM"
echo "Available RAM: $freeRAM"
echo "Total Disk Space: $totalDisk"
echo "Available Disk Space: $freeDisk"
echo "Init System: $isSystemD"
echo "Current Shell: $sh"
tput sgr0
echo ""
