# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

LazyVim-based Neovim config. Built on the LazyVim starter template with 46 extras enabled. Plugin manager: lazy.nvim. Lockfile: `lazy-lock.json` (87 plugins pinned).

## Architecture

```
init.lua → require("config.lazy")  → bootstraps lazy.nvim
                                    → imports LazyVim defaults (lazyvim.plugins)
                                    → imports lua/plugins/*.lua (custom specs)

lua/config/       LazyVim standard config modules (options, keymaps, lazy bootstrap)
lua/plugins/      Plugin specs — each file returns lazy.nvim spec table(s)
lua/jira-config.lua  Jira credentials/URLs (reads JIRA_API_TOKEN env var)
lazyvim.json      LazyVim extras selection (46 enabled)
```

Entry flow: `init.lua` → `config.lazy` bootstraps lazy.nvim → loads LazyVim base → loads `lua/plugins/*.lua`.

## Key Patterns

- Plugin specs in `lua/plugins/` follow lazy.nvim format: return table or table-of-tables with `plugin/name` as first element.
- LazyVim extras configured in `lazyvim.json`, not in plugin files. Language servers, formatters, linters enabled there.
- Keymaps: `lua/config/keymaps.lua` for global; plugin-specific keymaps live in their respective plugin spec file.
- UI transparency: `transparent.nvim` in `ui.lua` targets Ghostty terminal. Toggle: `<leader>tt`.
- AI assistant: avante.nvim with Claude (`claude-sonnet-4-20250514`), agentic mode, right sidebar.
- Java: jdtls auto-detects Java 21 cross-platform (macOS/Linux/Windows) in `lsp.lua`.

## Common Commands

```bash
# Format Lua files
stylua lua/

# Syntax check a single file
luac -p lua/plugins/somefile.lua

# Profile startup
nvim --startuptime /tmp/nvim-startup.log

# Update plugins
nvim +Lazy update
```

## Formatting

StyLua config in `stylua.toml`: spaces, indent width 2, column width 120.

## Copilot Integration

Byterover MCP server configured in `.github/copilot-instructions.md`. Two tools: `byterover-store-knowledge` and `byterover-retrieve-knowledge` — use when learning from or searching the codebase.
