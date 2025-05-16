#!/bin/bash

DB="$HOME/.local/share/word_lookup/words.db"
mkdir -p "$(dirname "$DB")"

# Create DB and table if not exists
sqlite3 "$DB" <<EOF
CREATE TABLE IF NOT EXISTS lookups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    word TEXT NOT NULL,
    method TEXT NOT NULL,
    timestamp TEXT NOT NULL,
    output_file TEXT
);
EOF

# Prompt for the word
WORD=$(echo "" | dmenu -p "Enter word:")
[ -z "$WORD" ] && exit 1

# Choose lookup method
CHOICE=$(echo -e "sdcv\nCambridge" | dmenu -p "Choose lookup method:")

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

if [ "$CHOICE" == "sdcv" ]; then
    OUTPUT_FILE="/tmp/sdcv_output.html"
    sdcv "$WORD" > "$OUTPUT_FILE"
    xdg-open "file://$OUTPUT_FILE"

    # Insert into DB
    sqlite3 "$DB" <<EOF
INSERT INTO lookups (word, method, timestamp, output_file)
VALUES ('$WORD', 'sdcv', '$TIMESTAMP', '$OUTPUT_FILE');
EOF

elif [ "$CHOICE" == "Cambridge" ]; then
    # Format URL
    WORD_ENCODED=$(echo "$WORD" | sed 's/ /-/g')
    URL="https://dictionary.cambridge.org/dictionary/english/${WORD_ENCODED}"
    xdg-open "$URL" 2>/dev/null || open "$URL" 2>/dev/null || echo "Please open: $URL"

    # Insert into DB
    sqlite3 "$DB" <<EOF
INSERT INTO lookups (word, method, timestamp, output_file)
VALUES ('$WORD', 'Cambridge', '$TIMESTAMP', NULL);
EOF

else
    echo "Invalid option"
    exit 1
fi

