#!/bin/bash

# Build script for container-friendly Markdown Paste extension

echo "Building container-friendly Markdown Paste extension..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install Node.js and npm first."
    echo "On Ubuntu/Debian: sudo apt install nodejs npm"
    echo "On CentOS/RHEL: sudo yum install nodejs npm"
    echo "On Alpine: apk add nodejs npm"
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "npm is not installed. Please install npm first."
    exit 1
fi

# Install dependencies
echo "Installing dependencies..."
npm install

# Compile TypeScript
echo "Compiling TypeScript..."
npm run compile

# Package extension
echo "Packaging extension..."
npm run dev:preinstall

# Find the generated .vsix file
VSIX_FILE=$(find . -name "vscode-markdown-paste-image-*.vsix" -type f | head -1)

if [ -n "$VSIX_FILE" ]; then
    echo "✅ Extension packaged successfully: $VSIX_FILE"
    echo ""
    echo "To install:"
    echo "  VS Code: code --install-extension $VSIX_FILE"
    echo "  Cursor:  cursor --install-extension $VSIX_FILE"
    echo ""
    echo "Or manually copy the .vsix file to your editor and install it."
else
    echo "❌ Failed to package extension. Check the output above for errors."
    exit 1
fi
