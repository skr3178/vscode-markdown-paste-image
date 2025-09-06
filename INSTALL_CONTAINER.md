# Container-Friendly Installation Guide

This modified version of the Markdown Paste extension is designed to work in Docker containers and remote environments (SSH, WSL, Dev Container).

## What's Changed

- **Paste functionality disabled in remote mode**: The extension automatically detects remote environments and disables clipboard-dependent features
- **Preserved features**: LaTeX symbols, Ruby tags, snippets, and text processing rules still work
- **Better error messages**: Clear feedback when paste features are unavailable

## Installation Methods

### Method 1: Install from Source (Recommended)

1. **Install Node.js and npm** (if not already installed):
   ```bash
   # On Ubuntu/Debian
   sudo apt update && sudo apt install nodejs npm
   
   # On CentOS/RHEL
   sudo yum install nodejs npm
   
   # On Alpine (common in Docker)
   apk add nodejs npm
   ```

2. **Install dependencies and build**:
   ```bash
   cd /path/to/vscode-markdown-paste-image
   npm install
   npm run compile
   ```

3. **Package the extension**:
   ```bash
   npm run dev:preinstall
   ```

4. **Install in VS Code/Cursor**:
   ```bash
   # For VS Code
   code --install-extension ./vscode-markdown-paste-image-*.vsix
   
   # For Cursor
   cursor --install-extension ./vscode-markdown-paste-image-*.vsix
   ```

### Method 2: Manual Installation

1. Copy the entire extension folder to your VS Code/Cursor extensions directory:
   - **Linux**: `~/.vscode/extensions/` or `~/.cursor/extensions/`
   - **Windows**: `%USERPROFILE%\.vscode\extensions\` or `%USERPROFILE%\.cursor\extensions\`
   - **macOS**: `~/.vscode/extensions/` or `~/.cursor/extensions/`

2. Rename the folder to `telesoho.vscode-markdown-paste-image-1.4.5`

3. Restart VS Code/Cursor

## Available Features in Container Mode

### ✅ Working Features
- **LaTeX Math Symbols** (Ctrl+Alt+\ or Cmd+Alt+\)
- **Ruby Tags** (Ctrl+Alt+T or Cmd+Alt+T)
- **Markdown Snippets** (type "ruby" and press Tab)
- **Text Processing Rules** (URL conversion, HTML to Markdown)
- **AI Text Processing** (if configured with API key)

### ❌ Disabled Features (with helpful error messages)
- **Paste Smart** (Ctrl+Alt+V or Cmd+Alt+V)
- **Paste Code** (Ctrl+Alt+C or Cmd+Alt+C)
- **Download** (Ctrl+Alt+D or Cmd+Alt+D)
- **Image Pasting** (automatically disabled)

## Configuration

The extension uses the same configuration as the original, but paste-related settings are ignored in remote mode:

```json
{
  "MarkdownPaste.enableAI": false,
  "MarkdownPaste.openaiConnectOption": {
    "apiKey": "your-api-key",
    "baseURL": "https://api.groq.com/openai/v1",
    "maxRetries": 2
  }
}
```

## Troubleshooting

1. **Extension not loading**: Make sure you've restarted VS Code/Cursor after installation
2. **Features not working**: Check that you're in a Markdown file (`.md`, `.rmd`, `.quarto`, `.mdx`)
3. **Error messages about paste**: This is expected behavior in container mode - use VS Code's built-in paste instead

## Development

To modify the extension further:

1. Make your changes to the source files
2. Run `npm run compile` to build
3. Run `npm run dev:preinstall` to package
4. Install the new `.vsix` file

## License

Same as original extension - MIT License.
