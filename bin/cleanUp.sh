#!/bin/sh
choice=$(echo "Update\nCleanUp" | dmenu )

[ $choice = "Shutdown" ] &&  ./remov.sh
[ $choice = "Update" ] &&  ./update-upgrade.sh
