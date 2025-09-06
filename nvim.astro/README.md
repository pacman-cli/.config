# 🚀 Enhanced AstroNeovim Configuration

This is an enhanced AstroNeovim configuration optimized for **Java**, **C++**, **Go**, and **Python** development with additional productivity tools and language-specific features.

## ✨ What's Enhanced

### 🔧 Language Support
- **Java**: Full LSP support with JDTLS, Spring Boot integration, testing, and debugging
- **C++**: Clangd LSP with enhanced features, code formatting, and debugging
- **Go**: Gopls LSP with Go-specific tools, testing, and development helpers
- **Python**: Pyright LSP with Black formatting, Flake8 linting, and debugging

### 🛠️ Development Tools
- **Language Servers**: Automatically installed and configured
- **Formatters**: Language-specific code formatting on save
- **Linters**: Code quality checks and suggestions
- **Debuggers**: Integrated debugging support for all languages
- **Testing**: Neotest integration for running tests
- **Git Integration**: Enhanced Git workflow with signs and operations

### 📚 Additional Features
- **Treesitter**: Enhanced syntax highlighting and code analysis
- **Auto-completion**: Intelligent code completion with LSP
- **Code Actions**: Refactoring and code improvement suggestions
- **Inlay Hints**: Type information and parameter hints
- **Semantic Tokens**: Enhanced code highlighting

## 🚀 Getting Started

### Prerequisites
- Neovim 0.9.0 or higher
- Git
- Node.js (for some tools)
- Python 3.8+ (for Python development)
- Java 11+ (for Java development)
- Go 1.19+ (for Go development)
- C++ compiler (for C++ development)

### Installation
1. **Backup your current config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Wait for setup**: The first startup will install all plugins and tools automatically.

## ⌨️ Key Mappings

### General Development
- `<leader>tt` - Run tests
- `<leader>tf` - Run tests in current file
- `<leader>tl` - Run last test
- `<leader>to` - Show test output
- `<leader>ts` - Show test summary

### Debugging
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue debugging
- `<leader>ds` - Step over
- `<leader>di` - Step into
- `<leader>do` - Step out

### Code Actions
- `<leader>ca` - Show code actions
- `<leader>rn` - Rename symbol
- `<leader>gd` - Go to definition
- `<leader>gr` - Find references
- `<leader>gi` - Go to implementation
- `<leader>gt` - Go to type definition

### Formatting
- `<leader>f` - Format buffer
- `<leader>F` - Format buffer (async)

### File Navigation
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags

### Git Operations
- `<leader>gs` - Git status
- `<leader>gc` - Git commits
- `<leader>gb` - Git branches

## 🗣️ Language-Specific Features

### Java
- **JDTLS**: Full Java language server support
- **Spring Boot**: Enhanced Spring framework support
- **Testing**: JUnit integration
- **Import Management**: Automatic import organization
- **Code Generation**: Template-based code generation

**Java Keymaps:**
- `<leader>jm` - Organize imports
- `<leader>jt` - Test class
- `<leader>jn` - Test nearest method

### C++
- **Clangd**: Advanced C++ language server
- **Code Formatting**: Clang-format integration
- **Header Switching**: Easy source/header navigation
- **AST Viewing**: Abstract syntax tree visualization

**C++ Keymaps:**
- `<leader>cb` - Switch source/header
- `<leader>cc` - Show AST

### Go
- **Gopls**: Go language server with enhanced features
- **Go Tools**: fmt, imports, lint, test, run, build
- **Go Modules**: Go module support
- **Testing**: Go test integration

**Go Keymaps:**
- `<leader>gt` - Go test
- `<leader>gf` - Go fmt
- `<leader>gi` - Go import
- `<leader>gl` - Go lint
- `<leader>gr` - Go run
- `<leader>gb` - Go build

### Python
- **Pyright**: Microsoft's Python language server
- **Black**: Code formatting
- **Flake8**: Linting
- **Testing**: pytest integration
- **Debugging**: Python debugger support

**Python Keymaps:**
- `<leader>pr` - Test method
- `<leader>pc` - Test class

## 🎨 Customization

### Adding New Languages
To add support for a new language, edit `lua/community.lua` and add:
```lua
{ import = "astrocommunity.pack.yourlanguage" },
```

### Adding New Tools
To add new Mason tools, edit `lua/plugins/mason.lua` and add to the `ensure_installed` list.

### Custom Keymaps
To add custom keymaps, edit `lua/polish.lua` and add them to the `setup_dev_keymaps()` function.

## 🔧 Configuration Files

- `init.lua` - Main entry point
- `lua/lazy_setup.lua` - Plugin manager setup
- `lua/community.lua` - AstroCommunity modules
- `lua/plugins/astrolsp.lua` - LSP configuration
- `lua/plugins/mason.lua` - Tool installation
- `lua/plugins/treesitter.lua` - Syntax highlighting
- `lua/plugins/user.lua` - User plugins
- `lua/polish.lua` - Final configurations and keymaps

## 🐛 Troubleshooting

### Common Issues

1. **Language servers not working**:
   - Check if tools are installed: `:Mason`
   - Restart Neovim after installation

2. **Formatting not working**:
   - Ensure formatters are installed via Mason
   - Check file type detection: `:set filetype?`

3. **Treesitter errors**:
   - Run `:TSUpdate` to update parsers
   - Check if parsers are installed: `:TSInstallInfo`

4. **LSP not starting**:
   - Check LSP status: `:LspInfo`
   - Verify language server installation

### Debug Commands
- `:LspInfo` - Show LSP status
- `:Mason` - Manage tools
- `:TSInstallInfo` - Treesitter info
- `:checkhealth` - Health check

## 📚 Additional Resources

- [AstroNvim Documentation](https://astronvim.com/)
- [AstroCommunity Modules](https://github.com/AstroNvim/astrocommunity)
- [Neovim LSP Configuration](https://neovim.io/doc/user/lsp.html)
- [Treesitter](https://tree-sitter.github.io/tree-sitter/)

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This configuration is based on AstroNvim and follows the same license terms.

---

**Happy Coding! 🎉**
