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

print_message "Starting system cleanup..."

# Print disk usage before cleanup
print_message "Disk usage before cleanup:"
df -h

# Update package list
print_message "Updating package list..."
# sudo apt update
handle_error "Updating package list"

# Upgrade all packages
print_message "Upgrading packages..."
# sudo apt upgrade -y
handle_error "Upgrading packages"

# Clean up package cache
print_message "Cleaning package cache..."
sudo apt clean
handle_error "Cleaning package cache"

# Remove unused packages
print_message "Removing unused packages..."
sudo apt autoremove -y
handle_error "Removing unused packages"

# Clean system logs
print_message "Cleaning system logs..."
sudo journalctl --vacuum-time=2weeks
handle_error "Cleaning system logs"

# Clean up orphaned packages (for Ubuntu)
print_message "Removing orphaned packages..."
sudo deborphan | xargs sudo apt-get -y remove --purge
handle_error "Removing orphaned packages"

# Remove temporary files
print_message "Cleaning up temporary files..."
sudo rm -rf /tmp/* /var/tmp/*
handle_error "Removing temporary files"

# Remove old kernels (for Ubuntu)
print_message "Removing old kernels..."
sudo apt-get autoremove --purge
handle_error "Removing old kernels"

# Remove unused snap packages (if using snap)
print_message "Removing unused snap packages..."
sudo snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do
    sudo snap remove "$snapname" --revision="$revision"
done
handle_error "Removing unused snap packages"

print_message "Docker cleanup start!"

# Docker cleanup
docker container prune -f
handle_error "Removing stopped containers"
docker image prune -a -f
handle_error "Removing unused images"
docker volume prune -f
handle_error "Removing unused volumes"
docker network prune -f
handle_error "Removing unused networks"
docker system prune -a -f
handle_error "Completing Docker system cleanup"

echo "Docker cleanup completed!"

print_message "Flatpak cleanup started!"

# Uninstall unused runtimes and applications
flatpak uninstall --unused -y
handle_error "Uninstalling unused Flatpak apps"

# Optionally clear cached files (be cautious)
sudo rm -rf /var/tmp/flatpak-cache/*
handle_error "Removing Flatpak cache"
sudo rm -rf /var/lib/flatpak/repo/*
handle_error "Removing Flatpak repository files"

print_message "Flathub cleanup completed!"

print_message "Python cleanup started!"

# Specify packages to remove; leave empty if not needed
packages_to_remove=(<package1> <package2>)

for package in "${packages_to_remove[@]}"; do
    pip uninstall -y "$package"
done

# Clear pip cache
pip cache purge

# Optionally remove old virtual environments
# Replace this with the actual path to your virtual environments
virtualenvs_path="$HOME/.virtualenvs"
if [ -d "$virtualenvs_path" ]; then
    echo "Cleaning up virtual environments in $virtualenvs_path"
    rm -rf "$virtualenvs_path"/*
fi

echo "Python cleanup completed!"

print_message "System cleanup completed successfully!"

# Print disk usage after cleanup
print_message "Disk usage after cleanup:"
df -h

