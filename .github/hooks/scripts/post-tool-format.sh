#!/bin/bash
# post-tool-format.sh - Post-tool use formatting
# Runs after code modifications to auto-format

# Read input from stdin (hook contract)
INPUT=$(cat)

# Check if PHPCBF is available and if a PHP file was modified
if command -v phpcbf &> /dev/null; then
    # Extract file path if available
    FILE_PATH=$(echo "$INPUT" | grep -o '"filePath":"[^"]*"' | cut -d'"' -f4 2>/dev/null || echo "")
    
    if [[ "$FILE_PATH" == *.php ]] || [[ "$FILE_PATH" == *.module ]] || [[ "$FILE_PATH" == *.inc ]]; then
        # Auto-format the file
        phpcbf --standard=Drupal "$FILE_PATH" 2>/dev/null || true
        echo "Auto-formatted: $FILE_PATH" >&2
    fi
fi

# Allow the operation to continue
echo '{"continue": true}'
