# AGENTS.md — Neovim Config

## Stack
- **Framework**: LazyVim (extends `LazyVim/LazyVim`). Init: `init.lua` → `config.lazy` → lazy.nvim imports `lazyvim.plugins` then `plugins/`.
- **Formatting**: StyLua — 2-space indent, 120 col width (`stylua.toml`).
- **Provider**: Claude (`claude-sonnet-4-20250514`) via avante.nvim.

## Layout
| Path | Purpose |
|------|---------|
| `lua/config/options.lua` | Neovim options (wrap, transparency, etc.) |
| `lua/config/keymaps.lua` | Global keymaps (`jj`→Esc, Neo-tree, etc.) |
| `lua/config/autocmds.lua` | Autocommands |
| `lua/config/lazy.lua` | lazy.nvim bootstrap + plugin spec import |
| `lua/plugins/*.lua` | Plugin specs (LazyVim format). Each file returns a table of plugin specs. |
| `lazyvim.json` | LazyVim extras enabled (languages, editor, ui, util, etc.) |

## Key Conventions
- **Plugin specs**: Follow LazyVim plugin spec format (`return { { "plugin/name", opts = {}, keys = {}, ... } }`).
- **Don't edit `init.lua`** — it's 1 line. Config goes in `lua/config/` or `lua/plugins/`.
- **Java LSP**: Forced to Java 21 via `nvim-jdtls` opts in `lua/plugins/lsp.lua`.
- **Jira**: API token required in `JIRA_API_TOKEN` env var; config in `lua/jira-config.lua` (committed with placeholder creds).

## Keymaps (non-default)
| Key | Action |
|-----|--------|
| `jj` (insert) | Escape |
| `<leader>e` | Neo-tree toggle |
| `<leader>E` | Neo-tree reveal current file |
| `<leader>la` | LSP code action |
| `K` | LSP hover |
| `<leader>lg` | LazyGit |
| `<leader>ft` | Floating terminal |
| `<leader>mp`/`ms`/`mt` | Markdown preview |
| `<leader>tt` | Toggle transparency |
| `<leader>fp` | Telescope: find plugin file |
| `<leader>fk` | Telescope: show keymaps |
| `<leader>aa`/`ae`/`ar`/`af`/`at` | Avante AI commands |
| `<leader>jo`/`js`/`jm` | Jira open/search/my |
| `<leader>cdg`/`cdf`/`cdc`/`cds`/`cdd` | CodeDiff |

## Git Notes
- `.gitignore` explicitly ignores AI tool rule files (byterover, clinerules, cursor, windsurf, roo, kilocode, kiro, qoder, augment).
- Only nvim config committed — this is a dotfiles-style repo.

## Dev
- **Test a plugin spec**: `nvim --headless "+Lazy! sync" +qa`
- **Check Lua syntax**: `luac -p file.lua`
- All code is Lua. No tests, no CI.
