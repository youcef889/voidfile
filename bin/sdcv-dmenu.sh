# Prompt for a word using dmenu
WORD=$(echo "" | dmenu -p "Enter word:")

# If a word is entered, look it up using sdcv
if [[ -n "$WORD" ]]; then
    # Save output as an HTML file
    OUTPUT_FILE="/tmp/sdcv_output.html"
    sdcv "$WORD" > "$OUTPUT_FILE"

    # Open the output in surf
    surf "file://$OUTPUT_FILE"
fi

