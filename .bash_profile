if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    echo "Choose session: (1) DWM  (2) XFCE"
    read -p "Enter choice: " choice

    case "$choice" in
        1) exec startx ~/.xinitrc.dwm ;;
        2) exec startx ~/.xinitrc.xfce ;;
        *) echo "Invalid choice. Defaulting to DWM." 
           exec startx ~/.xinitrc.dwm ;;
    esac
fi

# Load .bashrc if available
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

