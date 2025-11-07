#!/bin/sh
set -euo pipefail  # Exit on error, undefined vars, pipe failures

echo "Cloning repositories..."

BASE_DIR="$HOME/Development"

# List of repositories to clone
# Format: <repository_url> <target_directory>
REPOS="
git@github.com:piercemcgeough/mugendo-ireland.git mugendo-ireland
git@github.com:piercemcgeough/mugendo-open-website.git mugendo-open
git@github.com:piercemcgeough/piercemcgeough.co.uk.git personal-website
"

echo "$REPOS" | while read -r repo dir; do
    # Skip empty lines
    [ -z "$repo" ] && continue

    TARGET_DIR="$BASE_DIR/$dir"
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Cloning $repo into $TARGET_DIR..."
        git clone "$repo" "$TARGET_DIR"
    else
        echo "Directory $TARGET_DIR already exists, skipping clone."
    fi
done

echo "Repository cloning complete."
