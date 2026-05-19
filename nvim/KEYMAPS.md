# Neovim Keymap Reference

> Generated from live Neovim 0.12.2 session — **477 active keymaps** across all modes.
> LazyVim 15.15.0 with 46 extras enabled.

---

## Contents

- [Legend](#legend)
- [Mode Reference](#mode-reference)
- [User Custom Keymaps](#user-custom-keymaps)
- [Core Editing](#core-editing)
- [Window & Tab Management](#window--tab-management)
- [Buffer Management](#buffer-management)
- [File Operations](#file-operations)
- [LSP & Code Actions](#lsp--code-actions)
- [Diagnostics](#diagnostics)
- [Search & Navigation](#search--navigation)
- [Git Integration](#git-integration)
- [Fuzzy Finding (Telescope)](#fuzzy-finding-telescope)
- [Refactoring](#refactoring)
- [Debugging (DAP)](#debugging-dap)
- [AI Assistant (Avante)](#ai-assistant-avante)
- [Code Diffing](#code-diffing)
- [Jira Integration](#jira-integration)
- [Toggle Options](#toggle-options)
- [Trouble Diagnostic List](#trouble-diagnostic-list)
- [Harpoon 2](#harpoon-2)
- [Treesitter Textobjects](#treesitter-textobjects)
- [Surround (mini-surround)](#surround-mini-surround)
- [Completion (nvim-cmp)](#completion-nvim-cmp)
- [Built-in Vim Movements](#built-in-vim-movements)
- [Built-in Vim Operators](#built-in-vim-operators)
- [Built-in Vim Text Objects](#built-in-vim-text-objects)
- [Built-in Vim Insert Mode](#built-in-vim-insert-mode)
- [Built-in Vim Command Mode](#built-in-vim-command-mode)
- [Macros](#macros)
- [Marks](#marks)
- [Registers](#registers)

---

## Legend

| `<leader>` | Space (configured in LazyVim) |
| `<localleader>` | `\` (backslash) |
| `C-` | Ctrl |
| `M-` | Meta/Alt |
| `S-` | Shift |

---

## Mode Reference

| Mode | Name | Default Keymaps |
|------|------|-----------------|
| `n` | Normal | 298 |
| `v` | Visual | 60 |
| `x` | Select | 54 |
| `s` | Select (mode-specific) | 15 |
| `o` | Operator-pending | 16 |
| `i` | Insert | 20 |
| `c` | Command-line | 12 |
| `t` | Terminal | 2 |

---

## User Custom Keymaps

In `lua/config/keymaps.lua`:

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `i` | `jj` | `<Esc>` | Escape insert mode (avoids reaching for Esc) |
| `n` | `<leader>e` | `Neotree toggle` | Explorer: toggle |
| `n` | `<leader>E` | `Neotree reveal` | Explorer: reveal current file |

---

## Core Editing

From `lazyvim/config/keymaps.lua`:

### Movement (smart line navigation)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n`, `x` | `j` / `k` | `gj` / `gk` (expr) | Smart line down/up (wraps lines) |
| `n`, `x` | `<Down>` / `<Up>` | `gj` / `gk` (expr) | Smart line down/up (wraps lines) |

### Search Result Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `n` | `Nn'[searchforward].'zv'` | Next search result (center) |
| `n` | `N` | `'nN'[searchforward].'zv'` | Prev search result (center) |
| `x` | `n` / `N` | Jump only | Next/prev search result |
| `o` | `n` / `N` | Jump only | Next/prev search result |

### Line Movement (Alt+jk)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<A-j>` | `m .+1` | Move line down |
| `n` | `<A-k>` | `m .-2` | Move line up |
| `i` | `<A-j>` | `<Esc>m .+1==gi` | Move line down (insert) |
| `i` | `<A-k>` | `<Esc>m .-2==gi` | Move line up (insert) |
| `v` | `<A-j>` | `m '>+1` | Move selection down |
| `v` | `<A-k>` | `m '<-2` | Move selection up |

### Indentation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `x` | `<` / `>` | `<gv` / `>gv` | Indent and re-select |

### Insert Mode

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `i`, `n`, `s` | `<Esc>` | `noh` + clear hlsearch | Clear highlighted search |
| `i` | `,` / `.` / `;` | `,<c-g>u` / `.<c-g>u` / `;<c-g>u` | Add undo break-point |
| `i`, `n`, `s`, `x` | `<C-s>` | `<cmd>w<cr><esc>` | Save file from any mode |

### Formatting

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n`, `x` | `<leader>cf` | `LazyVim.format({ force = true })` | Format buffer |

### Comments

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `gco` | `O<Esc>Vcx<Esc>normal gcc<CR>fxa<BS>` | Add comment below |
| `n` | `gcO` | `O<Esc>Vcx<Esc>normal gcc<CR>fxa<BS>` | Add comment above |

---

## Window & Tab Management

### Window Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<C-h>` | `<C-w>h` | Go to left window |
| `n` | `<C-j>` | `<C-w>j` | Go to lower window |
| `n` | `<C-k>` | `<C-w>k` | Go to upper window |
| `n` | `<C-l>` | `<C-w>l` | Go to right window |
| `t` | `<C-h/j/k/l>` | `<C-w>h/j/k/l` | Window navigation from terminal |

### Window Resize

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<C-Up>` | `resize +2` | Increase height |
| `n` | `<C-Down>` | `resize -2` | Decrease height |
| `n` | `<C-Left>` | `vertical resize -2` | Decrease width |
| `n` | `<C-Right>` | `vertical resize +2` | Increase width |

### Window Splits & Close

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>-` | `<C-W>s` | Split window below |
| `n` | <code>&lt;leader&gt;\|</code> | `<C-W>v` | Split window right |
| `n` | `<leader>wd` | `<C-W>c` | Delete window |
| `n` | `<leader>wm` | Toggle zoom | Zoom window |
| `n` | `<leader>uz` | Toggle | Zen mode |
| `n` | `<leader>uZ` | Toggle | Zoom |

### Tab Management

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader><tab><tab>` | `tabnew` | New tab |
| `n` | `<leader><tab>d` | `tabclose` | Close tab |
| `n` | `<leader><tab>]` | `tabnext` | Next tab |
| `n` | `<leader><tab>[` | `tabprevious` | Previous tab |
| `n` | `<leader><tab>f` | `tabfirst` | First tab |
| `n` | `<leader><tab>l` | `tablast` | Last tab |
| `n` | `<leader><tab>o` | `tabonly` | Close other tabs |

---

## Buffer Management

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<S-h>` | `bprevious` | Previous buffer |
| `n` | `<S-l>` | `bnext` | Next buffer |
| `n` | `[b` | `bprevious` | Previous buffer |
| `n` | `]b` | `bnext` | Next buffer |
| `n` | `<leader>bb` | `e #` | Switch to other buffer |
| `n` | `<leader>\`` | `e #` | Switch to other buffer |
| `n` | `<leader>bd` | `Snacks.bufdelete()` | Delete buffer |
| `n` | `<leader>bo` | `Snacks.bufdelete.other()` | Delete other buffers |
| `n` | `<leader>bD` | `bd` | Delete buffer and window (force) |
| `n` | `<leader>bp` | `BufferLineTogglePin` | Toggle pin |
| `n` | `<leader>bP` | `BufferLineGroupClose ungrouped` | Delete non-pinned |
| `n` | `<leader>br` | `BufferLineCloseRight` | Delete buffers to the right |
| `n` | `<leader>bl` | `BufferLineCloseLeft` | Delete buffers to the left |
| `n` | `<leader>bj` | `BufferLinePick` | Pick buffer |
| `n` | `[B` | `BufferLineMovePrev` | Move buffer prev |
| `n` | `]B` | `BufferLineMoveNext` | Move buffer next |
| `n` | `<leader>qq` | `qa` | Quit all |

---

## File Operations

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>fn` | `enew` | New file |
| `n` | `<leader>ft` | `Snacks.terminal()` (root dir) | Terminal (root dir) |
| `n` | `<leader>fT` | `Snacks.terminal()` (cwd) | Terminal (cwd) |
| `n`, `t` | `<c-/>` | `Snacks.terminal.focus()` | Terminal focus |
| `n` | `<leader>.` | `Snacks.scratch()` | Toggle scratch buffer |
| `n` | `<leader>S` | `Snacks.scratch.select()` | Select scratch buffer |
| `n` | `<leader>lg` | `LazyGit` | Open LazyGit |
| `n` | `<leader>l` | `Lazy` | Open Lazy plugin manager |
| `n` | `<leader>L` | `LazyVim Changelog` | LazyVim changelog |
| `n` | `<leader>K` | `norm! K` | Keywordprg |

---

## LSP & Code Actions

### Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `gd` | `vim.lsp.buf.definition` | Go to definition |
| `n` | `gr` | `vim.lsp.buf.references` | Show references |
| `n` | `gI` | `vim.lsp.buf.implementation` | Go to implementation |
| `n` | `gy` | `vim.lsp.buf.type_definition` | Go to type definition |
| `n` | `gD` | `vim.lsp.buf.declaration` | Go to declaration |
| `n` | `K` | `vim.lsp.buf.hover()` | Hover info |
| `n` | `gK` | `vim.lsp.buf.signature_help()` | Signature help |
| `i` | `<C-k>` | `vim.lsp.buf.signature_help()` | Signature help |

### Code Actions

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n`, `v` | `<leader>ca` | `vim.lsp.buf.code_action` | Code action |
| `n`, `v` | `<leader>la` | `vim.lsp.buf.code_action` | Code action (user) |
| `n`, `x` | `<leader>cA` | `LazyVim.lsp.action.source` | Source action |

### Refactoring / Renaming

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>cr` | `vim.lsp.buf.rename` | Rename symbol |
| `n` | `<leader>cR` | `Snacks.rename.rename_file()` | Rename file |

### CodeLens

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n`, `x` | `<leader>cc` | `vim.lsp.codelens.run` | Run codelens |
| `n` | `<leader>cC` | `vim.lsp.codelens.refresh` | Refresh & display codelens |

### Organize Imports

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>co` | `LazyVim.lsp.action.source.organizeImports` | Organize imports |

### LSP Info & Mason

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>cl` | `Snacks.picker.lsp_config()` | LSP info |
| `n` | `<leader>cm` | `Mason` | Mason LSP installer |

---

## Diagnostics

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>cd` | `vim.diagnostic.open_float` | Line diagnostics |
| `n` | `]d` | Next diagnostic | Next diagnostic |
| `n` | `[d` | Prev diagnostic | Previous diagnostic |
| `n` | `]e` | Next error | Next error |
| `n` | `[e` | Prev error | Previous error |
| `n` | `]w` | Next warning | Next warning |
| `n` | `[w` | Prev warning | Previous warning |

---

## Search & Navigation

### Search Results / References

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `]]` | `Snacks.words.jump(v.v.count1)` | Next reference |
| `n` | `[[` | `Snacks.words.jump(-v.v.count1)` | Previous reference |
| `n` | `<a-n>` | Jump next (cross-file) | Next reference (cross) |
| `n` | `<a-p>` | Jump prev (cross-file) | Previous reference (cross) |

### Location & Quickfix

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>xl` | Toggle | Location list |
| `n` | `<leader>xq` | Toggle | Quickfix list |
| `n` | `[q` | `cprev` | Previous quickfix |
| `n` | `]q` | `cnext` | Next quickfix |

---

## Git Integration

### Browse & Log

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>gg` | `Snacks.lazygit()` (root dir) | Lazygit (root dir) |
| `n` | `<leader>gG` | `Snacks.lazygit()` (cwd) | Lazygit (cwd) |
| `n` | `<leader>gL` | `Snacks.picker.git_log()` | Git log (cwd) |
| `n` | `<leader>gl` | `Snacks.picker.git_log()` (root dir) | Git log (root dir) |
| `n` | `<leader>gb` | `Snacks.picker.git_log_line()` | Git blame line |
| `n` | `<leader>gf` | `Snacks.picker.git_log_file()` | File history |
| `n`, `x` | `<leader>gB` | `Snacks.gitbrowse()` | Git browse (open) |
| `n`, `x` | `<leader>gY` | `Snacks.gitbrowse({ copy })` | Git browse (copy URL) |

### Status & Stash

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>gs` | Telescope/Fzf git_status | Git status |
| `n` | `<leader>gS` | Telescope/Fzf git_stash | Git stash |
| `n` | `<leader>gc` | Telescope/Fzf git_commits | Git commits |
| `n` | `<leader>gd` | Telescope/Fzf git_diff | Git diff (files) |

---

## Fuzzy Finding (Telescope)

### Files

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader><space>` | `find_files` | Find files (root dir) |
| `n` | `<leader>ff` | `find_files` | Find files (root dir) |
| `n` | `<leader>fF` | `find_files({ root = false })` | Find files (cwd) |
| `n` | `<leader>fg` | `git_files` | Find git files |
| `n` | `<leader>fr` | `oldfiles` | Recent files |
| `n` | `<leader>fR` | `oldfiles({ cwd = cwd })` | Recent files (cwd) |
| `n` | `<leader>fb` | `Telescope buffers` | Buffers |
| `n` | `<leader>fB` | `Telescope buffers (all)` | Buffers (all) |
| `n` | `<leader>fc` | `find_files({ cwd = config })` | Find config file |
| `n` | `<leader>,` | `Telescope buffers sort_mru=true` | Switch buffer |
| `n` | `<leader>fp` | `find_files({ cwd = lazy root })` | Find plugin file |

### Search Text

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>/` | `live_grep` | Grep (root dir) |
| `n` | `<leader>sg` | `live_grep` | Grep (root dir) |
| `n` | `<leader>sG` | `live_grep({ root = false })` | Grep (cwd) |
| `n` | `<leader>sw` | `grep_string({ word_match = '-w' })` | Word (root dir) |
| `n` | `<leader>sW` | `grep_string({ root = false })` | Word (cwd) |
| `x` | `<leader>sw` | `grep_string()` | Selection (root dir) |
| `x` | `<leader>sW` | `grep_string({ root = false })` | Selection (cwd) |

### Symbols

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>ss` | `lsp_document_symbols` | Goto symbol |
| `n` | `<leader>sS` | `lsp_dynamic_workspace_symbols` | Goto symbol (workspace) |
| `n` | `<leader>cs` | `AerialToggle` | Aerial symbols |

### Lists & History

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>:"` | `command_history` | Command history |
| `n` | `<leader>s/` | `search_history` | Search history |
| `n` | `<leader>s"` | `registers` | Registers |
| `n` | `<leader>sb` | `current_buffer_fuzzy_find` | Buffer lines |
| `n` | `<leader>sc` | `command_history` | Command history |
| `n` | `<leader>sC` | `commands` | Commands |
| `n` | `<leader>sd` | `diagnostics` | Diagnostics |
| `n` | `<leader>sD` | `diagnostics bufnr=0` | Buffer diagnostics |
| `n` | `<leader>sh` | `help_tags` | Help pages |
| `n` | `<leader>sH` | `highlights` | Search highlight groups |
| `n` | `<leader>sj` | `jumplist` | Jumplist |
| `n` | `<leader>sk` | `keymaps` | Key maps |
| `n` | `<leader>sl` | `loclist` | Location list |
| `n` | `<leader>sM` | `man_pages` | Man pages |
| `n` | `<leader>sm` | `marks` | Jump to mark |
| `n` | `<leader>so` | `vim_options` | Options |
| `n` | `<leader>sR` | `resume` | Resume |
| `n` | `<leader>sq` | `quickfix` | Quickfix list |
| `n` | `<leader>fk` | `keymaps()` | Show all keybindings |
| `n` | `<leader>uC` | `colorscheme({ preview })` | Colorscheme with preview |

---

## Refactoring

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n`, `x` | `<leader>rs` | `refactoring.select_refactor()` | Refactor picker |
| `n`, `x` | `<leader>ri` | `refactor("Inline Variable")` | Inline variable |
| `n`, `x` | `<leader>rb` | `refactor("Extract Block")` | Extract block |
| `n`, `x` | `<leader>rf` | `refactor("Extract Function")` | Extract function |
| `n`, `x` | `<leader>rF` | `refactor("Extract Function To File")` | Extract function to file |
| `n`, `x` | `<leader>rx` | `refactor("Extract Variable")` | Extract variable |
| `n` | `<leader>rP` | `debug.printf()` | Debug printf |
| `n`, `x` | `<leader>rp` | `debug.print_var()` | Debug print var |
| `n` | `<leader>rc` | `debug.cleanup()` | Debug cleanup |

---

## Debugging (DAP)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>du` | DAP UI | DAP UI |
| `n` | `<leader>dc` | `run/continue` | Run/Continue |
| `n` | `<leader>dt` | `terminate` | Terminate |
| `n` | `<leader>db` | `toggle breakpoint` | Toggle breakpoint |
| `n` | `<leader>dB` | `breakpoint condition` | Breakpoint condition |
| `n` | `<leader>do` | `step over` | Step over |
| `n` | `<leader>dO` | `step over` | Step over (alt) |
| `n` | `<leader>di` | `step into` | Step into |
| `n` | `<leader>dO` | `step over` | -- |
| `n` | `<leader>do` | `step out` | Step out |
| `n` | `<leader>dg` | `go to line` | Go to line (no exec) |
| `n` | `<leader>dC` | `run to cursor` | Run to cursor |
| `n` | `<leader>da` | `run with args` | Run with args |
| `n` | `<leader>dl` | `run last` | Run last |
| `n` | `<leader>dP` | `pause` | Pause |
| `n` | `<leader>dr` | `toggle REPL` | Toggle REPL |
| `n` | `<leader>ds` | DAP session | Session |
| `n` | `<leader>dw` | DAP widgets | Widgets |
| `n` | `<leader>de` | DAP eval | Eval |
| `n` | `<leader>dk` | DAP up | Stack up |

---

## AI Assistant (Avante)

Via `avante.nvim` (provider: claude-sonnet-4-20250514):

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>aa` | Avante Ask | Ask AI about current code |
| `n` | `<leader>ae` | Avante Edit | Edit selected code |
| `n` | `<leader>ar` | Avante Refresh | Refresh AI response |
| `n` | `<leader>af` | Avante Focus | Focus sidebar |
| `n` | `<leader>at` | Avante Toggle | Toggle sidebar |
| `n` | `<leader>ad` | Avante Toggle Debug | Toggle debug |
| `n` | `<leader>aC` | Avante Toggle Selection | Toggle selection |
| `n` | `<leader>as` | Avante Toggle Suggestion | Toggle suggestion |
| `n` | `<leader>aR` | Avante Show Repo Map | Display repo map |
| `n` | `<leader>a?` | Avante Select Model | Select model |
| `n` | `<leader>ah` | Avante Select History | Select history |
| `n` | `<leader>aM` | Avante Select ACP Model | Select ACP model |
| `n` | `<leader>am` | Avante Select ACP Mode | Select ACP mode |
| `n` | `<leader>aB` | Avante Add All Buffers | Add all open buffers |

### Avante Diff View

| Key | Action |
|-----|--------|
| `co` | Accept ours |
| `ct` | Accept theirs |
| `ca` | Accept all theirs |
| `cb` | Accept both |
| `cc` | Cursor |
| `]x` | Next hunk |
| `[x` | Previous hunk |

### Avante Sidebar

| Key | Action |
|-----|--------|
| `A` | Apply all |
| `a` | Apply cursor |
| `r` | Retry |
| `e` | Edit request |
| `d` | Remove file |
| `@` | Add file |
| `<Tab>` | Switch windows |
| `<S-Tab>` | Reverse switch |
| `<Esc>` / `q` | Close |

---

## Code Diffing

From `codediff.nvim`:

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>cdg` | `CodeDiff file` | Diff file vs Git |
| `n` | `<leader>cdf` | `CodeDiff file (prompt)` | Compare with any file |
| `n` | `<leader>cdc` | `diff_clipboard()` | Diff with clipboard |
| `v` | `<leader>cds` | `store_selection()` | Store current selection |
| `v` | `<leader>cdd` | `diff_with_stored()` | Diff with stored selection |

---

## Jira Integration

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>jo` | `JiraOpen` | Open Jira issue |
| `n` | `<leader>js` | `JiraSearch` | Search Jira |
| `n` | `<leader>jm` | `JiraMyIssues` | My Jira issues |

---

## Toggle Options

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>uf` | Toggle | Auto format (global) |
| `n` | `<leader>uF` | Toggle | Auto format (buffer) |
| `n` | `<leader>us` | Toggle | Spell check |
| `n` | `<leader>uw` | Toggle | Word wrap |
| `n` | `<leader>uL` | Toggle | Relative line numbers |
| `n` | `<leader>ul` | Toggle | Line numbers |
| `n` | `<leader>ud` | Toggle | Diagnostics |
| `n` | `<leader>uc` | Toggle | Conceal level |
| `n` | `<leader>uA` | Toggle | Tabline |
| `n` | `<leader>uT` | Toggle | Treesitter highlight |
| `n` | `<leader>ub` | Toggle | Dark/light background |
| `n` | `<leader>uD` | Toggle | Dim |
| `n` | `<leader>ua` | Toggle | Animations |
| `n` | `<leader>ug` | Toggle | Indent guides |
| `n` | `<leader>uS` | Toggle | Scroll animation |
| `n` | `<leader>uh` | Toggle | Inlay hints |
| `n` | `<leader>ux` | Toggle | Illumination |
| `n` | `<leader>un` | Dismiss | Notifications |
| `n` | `<leader>um` | Toggle | Render markdown |
| `n` | `<leader>ui` | Inspect | `vim.show_pos` |
| `n` | `<leader>uI` | Inspect | Treesitter inspect tree |
| `n` | `<leader>tt` | Toggle | Transparency |

---

## Trouble Diagnostic List

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>xx` | `Trouble diagnostics toggle` | Diagnostics |
| `n` | `<leader>xX` | `Trouble diagnostics toggle filter.buf=0` | Buffer diagnostics |
| `n` | `<leader>xL` | `Trouble loclist toggle` | Location list |
| `n` | `<leader>xQ` | `Trouble qflist toggle` | Quickfix list |
| `n` | `<leader>cS` | `Trouble lsp toggle` | LSP references/definitions |
| `n` | `<leader>xt` | `Trouble todo` | TODO |
| `n` | `<leader>xT` | `Trouble todo { keywords = {"TODO","FIX"} }` | TODO/FIX |

---

## Harpoon 2

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `n` | `<leader>H` | `harpoon:list():add()` | Add file to harpoon |
| `n` | `<leader>h` | `harpoon.ui:toggle_quick_menu()` | Quick menu |
| `n` | `<leader>1` | `harpoon:list():select(1)` | File 1 |
| `n` | `<leader>2` | `harpoon:list():select(2)` | File 2 |
| `n` | `<leader>3` | `harpoon:list():select(3)` | File 3 |
| `n` | `<leader>4` | `harpoon:list():select(4)` | File 4 |
| `n` | `<leader>5` | `harpoon:list():select(5)` | File 5 |
| `n` | `<leader>6` | `harpoon:list():select(6)` | File 6 |
| `n` | `<leader>7` | `harpoon:list():select(7)` | File 7 |
| `n` | `<leader>8` | `harpoon:list():select(8)` | File 8 |
| `n` | `<leader>9` | `harpoon:list():select(9)` | File 9 |

---

## Treesitter Textobjects

| Mode | Key | Action |
|------|-----|--------|
| `n`, `x`, `o` | `]f` | Next function start |
| `n`, `x`, `o` | `]c` | Next class start |
| `n`, `x`, `o` | `]a` | Next parameter start |
| `n`, `x`, `o` | `]F` | Next function end |
| `n`, `x`, `o` | `]C` | Next class end |
| `n`, `x`, `o` | `]A` | Next parameter end |
| `n`, `x`, `o` | `[f` | Previous function start |
| `n`, `x`, `o` | `[c` | Previous class start |
| `n`, `x`, `o` | `[a` | Previous parameter start |
| `n`, `x`, `o` | `[F` | Previous function end |
| `n`, `x`, `o` | `[C` | Previous class end |
| `n`, `x`, `o` | `[A` | Previous parameter end |

---

## Surround (mini-surround)

| Mode | Key | Action |
|------|-----|--------|
| `n`, `x` | `gsa` | Add surrounding |
| `n` | `gsd` | Delete surrounding |
| `n` | `gsf` | Find surrounding (right) |
| `n` | `gsF` | Find surrounding (left) |
| `n` | `gsh` | Highlight surrounding |
| `n` | `gsr` | Replace surrounding |
| `n` | `gsn` | Update `n_lines` |

---

## Completion (nvim-cmp)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| `i` | `<C-n>` | `select_next_item` | Next item |
| `i` | `<C-p>` | `select_prev_item` | Previous item |
| `i` | `<C-Space>` | `complete()` | Trigger completion |
| `i` | `<C-y>` | `confirm({ select = true })` | Confirm |
| `i` | `<CR>` | `confirm({ select = auto })` | Confirm |
| `i` | `<S-CR>` | `confirm({ behavior = Replace })` | Confirm (replace) |
| `i` | `<C-CR>` | `abort()` | Cancel |
| `i` | `<C-b>` | `scroll_docs(-4)` | Scroll docs down |
| `i` | `<C-f>` | `scroll_docs(4)` | Scroll docs up |
| `i` | `<Tab>` | Snippet forward / AI accept | Tab |
| `i` | `<S-Tab>` | `jump("prev")` | Snippet prev |

---

## Built-in Vim Movements

### Cursor Movement

| Key | Action |
|-----|--------|
| `h` | Move left |
| `j` | Move down (smart gj with LazyVim) |
| `k` | Move up (smart gk with LazyVim) |
| `l` | Move right |
| `w` | Forward to start of word |
| `W` | Forward to start of WORD |
| `b` | Backward to start of word |
| `B` | Backward to start of WORD |
| `e` | Forward to end of word |
| `E` | Forward to end of WORD |
| `ge` | Backward to end of word |
| `gE` | Backward to end of WORD |
| `0` | Start of line |
| `^` | First non-blank character |
| `$` | End of line |
| `g_` | Last non-blank character |
| `gg` | First line of file |
| `G` | Last line of file |
| `nG` / `:n` | Go to line n |
| `%` | Matching bracket |
| `f{char}` | Forward to {char} on line |
| `F{char}` | Backward to {char} on line |
| `t{char}` | Forward before {char} |
| `T{char}` | Backward before {char} |
| `;` | Repeat last f/t/F/T |
| `,` | Reverse repeat last f/t/F/T |

### Scroll

| Key | Action |
|-----|--------|
| `C-d` | Scroll down half page |
| `C-u` | Scroll up half page |
| `C-f` | Page down (forward) |
| `C-b` | Page up (backward) |
| `zz` | Center cursor |
| `zt` | Cursor to top |
| `zb` | Cursor to bottom |
| `H` | Top of window |
| `M` | Middle of window |
| `L` | Bottom of window |

---

## Built-in Vim Operators

### Delete, Yank, Paste

| Key | Action |
|-----|--------|
| `x` | Delete character under cursor |
| `dd` | Delete line |
| `D` | Delete to end of line |
| `dw` | Delete word |
| `d$` | Delete to end of line |
| `d^` | Delete to start of line |
| `yy` | Yank (copy) line |
| `Y` | Yank to end of line (usually same as `y$`) |
| `yw` | Yank word |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `gp` | Paste and move cursor to end |
| `gP` | Paste before and move cursor to end |
| `.` | Repeat last change |

### Change

| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Append after cursor |
| `I` | Insert at start of line |
| `A` | Append at end of line |
| `o` | Open new line below |
| `O` | Open new line above |
| `cc` | Change (replace) entire line |
| `C` | Change to end of line |
| `cw` | Change word |
| `s` | Substitute character |
| `S` | Substitute entire line |
| `r` | Replace single character |
| `R` | Replace mode (overwrite) |
| `u` | Undo |
| `C-r` | Redo |

### Visual Mode

| Key | Action |
|-----|--------|
| `v` | Start visual selection (character) |
| `V` | Start visual line selection |
| `C-v` | Start visual block selection |
| `gv` | Re-select previous selection |
| `o` | Move cursor to other end of selection |
| `~` | Swap case |
| `U` | Uppercase |
| `u` | Lowercase |

---

## Built-in Vim Text Objects

| Key | Selects |
|-----|---------|
| `iw` | Inner word |
| `aw` | A word (including space) |
| `iW` | Inner WORD |
| `aW` | A WORD |
| `is` | Inner sentence |
| `as` | A sentence |
| `ip` | Inner paragraph |
| `ap` | A paragraph |
| `i'` / `a'` | Inside / around single quotes |
| `i"` / `a"` | Inside / around double quotes |
| `i\`` / `a\`` | Inside / around backticks |
| `i(` / `a(` | Inside / around parentheses |
| `i)` / `a)` | Inside / around parentheses |
| `i[` / `a[` | Inside / around brackets |
| `i]` / `a]` | Inside / around brackets |
| `i{` / `a{` | Inside / around braces |
| `i}` / `a}` | Inside / around braces |
| `i<` / `a<` | Inside / around angle brackets |
| `i>` / `a>` | Inside / around angle brackets |
| `it` | Inside XML/HTML tag |
| `at` | Around XML/HTML tag |

Use with operators: `dip` (delete inside paragraph), `ci"` (change inside quotes), `yap` (yank around paragraph).

---

## Built-in Vim Insert Mode

| Key | Action |
|-----|--------|
| `C-h` | Delete backspace |
| `C-w` | Delete word back |
| `C-u` | Delete line back |
| `C-t` | Indent right |
| `C-d` | Indent left |
| `C-e` | Insert character below cursor |
| `C-y` | Insert character above cursor |
| `C-n` | Complete next (word completion) |
| `C-p` | Complete previous |
| `C-x` | Complete prefix (opens sub-modes) |
| `C-r {reg}` | Insert register contents |
| `C-o` | Execute single normal mode command |
| `C-[` | Escape (same as `<Esc>`) |
| `C-c` | Exit insert mode (no checking) |
| `C-k` | Enter digraph |
| `C-v` | Enter literal character |
| `C-a` | Insert previously inserted text |

---

## Built-in Vim Command Mode

| Key | Action |
|-----|--------|
| `:` | Enter command mode |
| `/` | Search forward |
| `?` | Search backward |
| `*` / `#` | Search word under cursor fwd/bwd |
| `n` / `N` | Repeat search fwd/bwd |
| `<C-c>` | Cancel command |
| `<C-d>` | Show possible completions |
| `<Tab>` | Complete command or option |
| `<C-r><C-w>` | Insert word under cursor |
| `<C-f>` | Open command-line window |

### Common Ex Commands

| Command | Action |
|---------|--------|
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:x` | Save and quit |
| `:q!` | Force quit (discard changes) |
| `:w !sudo tee %` | Save with sudo |
| `:e!` | Reload file |
| `:e {file}` | Open file |
| `:bn` / `:bp` | Next / previous buffer |
| `:bd` | Delete buffer |
| `:ls` | List buffers |
| `:sp` | Split horizontally |
| `:vsp` | Split vertically |
| `:tabnew` | New tab |
| `:!{cmd}` | Run shell command |
| `:r !{cmd}` | Insert command output |
| `:set {option}` | Set option |
| `:help {topic}` | Open help |
| `:checkhealth` | Run health checks |
| `:Lazy` | Open Lazy plugin manager |
| `:Mason` | Open Mason LSP installer |

---

## Macros

### Recording

| Key | Action |
|-----|--------|
| `q{register}` | Start recording macro into register |
| `q` (while recording) | Stop recording |
| `@{register}` | Execute macro from register |
| `@@` | Repeat last macro |

### Usage Pattern

1. `qa` — start recording into register `a`
2. Perform actions (movements, edits, etc.)
3. `q` — stop recording
4. `@a` — execute macro once
5. `100@a` — execute macro 100 times
6. `@@` — repeat last macro

### View / Edit Macros

| Command | Action |
|---------|--------|
| `:reg a` | View contents of register `a` |
| `:reg` | View all registers |
| `"ap` | Paste macro text (normal mode) |
| Edit the pasted text, then `"ay$` to yank back | Edit macro |
| `:normal @a` | Run macro on current line |
| `:'<,'>normal @a` | Run macro on visual selection |
| `:g/pattern/normal @a` | Run macro on lines matching pattern |

### Special Registers for Macros

| Register | Purpose |
|----------|---------|
| `a`-`z` | Named registers (commonly used for macros) |
| `0` | Last yanked text |
| `"` | Unnamed register (last delete/yank) |
| `:` | Last command-line |
| `/` | Last search |
| `.` | Last inserted text |
| `%` | Current filename |
| `#` | Alternate filename |
| `=` | Expression register |

---

## Marks

| Key | Action |
|-----|--------|
| `m{letter}` | Set mark `{letter}` |
| `\`{letter}` | Jump to line of mark |
| `'{letter}` | Jump to line and column of mark |
| `'.` | Jump to last change position |
| `''` | Jump back to previous position |
| `\`\`` | Jump back to previous position |
| `]'` | Jump to next lowercase mark line |
| `['` | Jump to previous lowercase mark line |
| `:marks` | List all marks |
| `:delm {mark}` | Delete mark |
| `:delm!` | Delete all lowercase marks |

---

## Registers

| Key | Action |
|-----|--------|
| `"{reg}{op}` | Use register `{reg}` for operation |
| `"ayy` | Yank line into register `a` |
| `"ap` | Paste from register `a` |
| `:reg` | List all registers |
| `<C-r>{reg}` | Insert register in insert/command mode |

### How Registers Work

- `"0` — Last yank (preserved until next yank)
- `"1`-`"9` — Delete history (1 = most recent)
- `"a`-`"z` — Named registers (append with `"A`-`"Z`)
- `"-` — Small delete (< 1 line)
- `".` — Last inserted text
- `":` — Last command
- `"/` — Last search
- `"*` / `"+` — System clipboard (X11 primary / clipboard)
- `"=` — Expression register (evaluate Lua/Vim expression)
