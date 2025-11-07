#!/bin/sh
set -uo pipefail  # Exit on undefined vars, pipe failures (but not errors)

# Function to handle brew bundle with better error reporting
install_brewfile() {
    local file=$1
    local description=$2
    
    echo "Installing $description"
    if brew bundle --file "$file"; then
        echo "✅ $description installed successfully"
    else
        echo "❌ $description failed to install completely"
        echo "Some packages may have been installed. Continuing..."
        # Don't exit on brewfile failures - some packages might still install
    fi
}

# Install Brewfiles with error handling
install_brewfile "./Brewfile.base" "base Brewfile"
install_brewfile "./Brewfile.dev" "development Brewfile"
install_brewfile "./Brewfile.entertainment" "gaming/entertainment Brewfile"

# Create project directories
echo "Creating development directories..."
mkdir -p "$HOME/Development"
mkdir -p "$HOME/Development/archive"
mkdir -p "$HOME/Development/learning"
mkdir -p "$HOME/Development/projects"
mkdir -p "$HOME/Development/sandbox"
echo "✅ Development directories created"

# Clone Github repositories (uncomment when ready)
# echo "Cloning repositories..."
# ./clone.sh

# Set macOS preferences (uncomment when ready)
# echo "Setting macOS preferences..."
# source ./.macos

echo "🎉 Installation script completed!"