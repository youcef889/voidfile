#!/bin/bash

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to print messages in green
function print_message {
    echo -e "${GREEN}$1${NC}"
}

# Function to handle errors and stop execution if a command fails
function handle_error {
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error occurred during: $1. Exiting.${NC}"
        exit 1
    fi
}

print_message "Starting system update and upgrade process..."

# Print disk usage before the process
print_message "Disk usage before update and upgrade:"
df -H

# Update package list
print_message "Updating package list..."
sudo apt update
handle_error "Updating package list"

# Upgrade all packages
print_message "Upgrading packages..."
sudo apt upgrade -y
handle_error "Upgrading packages"

# Full distribution upgrade (optional, but recommended for some systems)
print_message "Performing full distribution upgrade..."
sudo apt dist-upgrade -y
handle_error "Full distribution upgrade"

# Clean up package cache
print_message "Cleaning package cache..."
sudo apt clean
handle_error "Cleaning package cache"

# Remove unused packages
print_message "Removing unused packages..."
sudo apt autoremove -y
handle_error "Removing unused packages"

print_message "System update and upgrade completed successfully!"

# Print disk usage after the process
print_message "Disk usage after update and upgrade:"
df -H
