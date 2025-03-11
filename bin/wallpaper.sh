#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/.config/wallpaper"

# Loop to change wallpaper every 10 minutes
while true; do
    feh --randomize --bg-scale "$WALLPAPER_DIR"/*
    sleep 1800  # Wait for 10 minutes (600 seconds)
done

