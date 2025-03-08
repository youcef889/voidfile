#!/bin/sh

choice=$(echo "Shutdown\nReboot\nExit" | dmenu )

[ $choice = "Shutdown" ] &&  poweroff
[ $choice = "Reboot" ] && reboot
[ $choice = "Exit" ] &&  pkill dwm




