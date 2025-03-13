-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Core Language Support
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.java" },

  -- Motion and Navigation
  -- Hop: Quick navigation with hints
  -- Keymaps:
  -- s{char}{char} - Jump to word starting with chars
  -- S{char}{char} - Jump to word before cursor
  -- gs{char}{char} - Select until jump point
  { import = "astrocommunity.motion.hop-nvim" },

  -- Flash: Enhanced f/t motion
  -- Keymaps:
  -- s - Flash forward
  -- S - Flash backward
  -- r - Remote flash (jump to another window)
  -- R - Treesitter search
  { import = "astrocommunity.motion.flash-nvim" },

  -- Mini Surround: Quick surround operations
  -- Keymaps:
  -- sa - Add surrounding (e.g., saiw( to surround word with parentheses)
  -- sd - Delete surrounding
  -- sr - Replace surrounding
  { import = "astrocommunity.motion.mini-surround" },

  -- Editing Enhancements
  -- Multi Cursor: Edit multiple locations simultaneously
  -- Keymaps:
  -- <C-n> - Select current word/next occurrence
  -- <C-Up/Down> - Create cursors vertically
  -- q - Skip current and get next occurrence
  { import = "astrocommunity.editing-support.vim-visual-multi" },

  -- Auto Save: Automatically save files when leaving insert mode
  -- Commands:
  -- :ASToggle - Toggle auto-save
  { import = "astrocommunity.editing-support.auto-save-nvim" },

  -- Git Integration
  -- Diffview: Advanced diff viewer
  -- Keymaps:
  -- <leader>gd - Open diff view
  -- <leader>gh - File history
  { import = "astrocommunity.git.diffview-nvim" },

  -- Mini Git: Lightweight git features
  -- Keymaps:
  -- ]c/[c - Next/previous change
  -- <leader>hs - Stage hunk
  -- <leader>hr - Reset hunk
  -- <leader>hp - Preview hunk
  -- <leader>gb - Blame line
  { import = "astrocommunity.git.mini-git" },

  -- AI and Completion
  -- { import = "astrocommunity.completion.codeium-vim" },  -- Disabled AI completion
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },  -- Disabled AI completion

  -- UI Enhancements
  -- Zen Mode: Distraction-free coding
  -- Keymaps:
  -- <leader>z - Toggle zen mode
  -- Features:
  -- - Centers content
  -- - Hides UI elements
  -- - Optional transparency
  { import = "astrocommunity.editing-support.zen-mode-nvim" },

  -- Mini Indentscope: Show indent scope
  -- Visual guide for indent levels
  -- Automatically shows indent guides
  --{ import = "astrocommunity.indent.mini-indentscope" },

  -- Markdown Preview: Live preview markdown files
  -- Commands:
  -- :MarkdownPreview - Start preview
  -- :MarkdownPreviewStop - Stop preview
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

  -- Colorful Window Separators
  -- Features:
  -- - Beautiful window separators
  -- - Automatic colors based on colorscheme
  -- - Smooth animations
  { import = "astrocommunity.split-and-window.colorful-winsep-nvim" },

  -- Mini Map: Code minimap like VSCode
  -- Keymaps:
  -- <leader>mm - Toggle minimap
  -- Features:
  -- - Shows code overview
  -- - Highlights current location
  { import = "astrocommunity.split-and-window.mini-map" },

  -- Trouble: Better quickfix list
  -- Keymaps:
  -- <leader>xx - Toggle trouble
  -- <leader>xw - Workspace diagnostics
  -- <leader>xd - Document diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- Themes
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  --TODO: Terminal Integration
  -- Toggle Term Manager: Better terminal integration with session management
  -- Keymaps:
  -- <C-\> - Toggle terminal
  -- <leader>tf - Float terminal
  -- <leader>th - Horizontal terminal
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },

  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  -- Note Taking
  -- Obsidian: Note management
  -- Keymaps:
  -- <leader>on - New note
  -- <leader>of - Find note
  -- <leader>ob - Back links
  { import = "astrocommunity.note-taking.obsidian-nvim" },

  -- Indentation
  --{ import = "astrocommunity.indent.indent-blankline-nvim" },
  --{ import = "astrocommunity.indent.indent-rainbowline-nvim" },
  --{ import = "astrocommunity.indent.indent-tools-nvim" },
  --{ import = "astrocommunity.indent.mini-indentscope" },
  -- { import = "astrocommunity.indent" }, -- Commented out generic import

  -- Smooth scrolling
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  -- { import = "astrocommunity.scrolling.mini-animate" }, -- Removed to avoid conflicts
  { import = "astrocommunity.icon.mini-icons" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  -- { import = "astrocommunity.colorscheme.aurora" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.color.nvim-highlight-colors" },
  { import = "astrocommunity.snippet" },
  { import = "astrocommunity.remote-development" },
  { import = "astrocommunity.register" },
  { import = "astrocommunity.programming-language-support" },
  --TODO: pack
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.html-css" },
  -- { import = "astrocommunity.pack.laravel" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },

  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.note-taking.global-note-nvim" },
  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.note-taking.venn-nvim" },
  { import = "astrocommunity.motion" },
  -- { import = "astrocommunity.media" },
  -- { import = "astrocommunity.lsp" },
  { import = "astrocommunity.markdown-and-latex" },
  { import = "astrocommunity.diagnostics.error-lens-nvim" },
  { import = "astrocommunity.docker.lazydocker" },
  --TODO: Test
  { import = "astrocommunity.test.neotest" },
  --TODO: Syntax
  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.syntax.vim-easy-align" },
  --TODO: Quickfix
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.quickfix.quicker-nvim" },
  --TODO: motion

  { import = "astrocommunity.motion.flash-nvim" },
}
