#!/bin/bash

# Check if dependencies are installed
if ! command -v xdotool &>/dev/null || ! command -v wmctrl &>/dev/null; then
    echo "Error: xdotool and wmctrl must be installed."
    exit 1
fi

# Get screen resolution
read SCREEN_WIDTH SCREEN_HEIGHT < <(xdotool getdisplaygeometry)

# Get active window ID
WINDOW_ID=$(xdotool getactivewindow 2>/dev/null)

if [[ -z "$WINDOW_ID" ]]; then
    echo "Error: No active window detected."
    exit 1
fi

# Get window geometry
eval $(xdotool getwindowgeometry --shell "$WINDOW_ID")

# Calculate centered position
POS_X=$(( (SCREEN_WIDTH - WIDTH) / 2 ))
POS_Y=$(( (SCREEN_HEIGHT - HEIGHT) / 2 ))

# Move and resize the window
wmctrl -ir "$WINDOW_ID" -e 0,"$POS_X","$POS_Y","$WIDTH","$HEIGHT"

