-- Enhanced user plugins for Java, C++, Go, and Python development

---@type LazySpec
return {
  -- == Development Enhancements ==
  
  -- Better comments with language-specific support
  {
    "numToStr/Comment.nvim",
    opts = {
      -- Add language-specific comment patterns
      toggler = { line = '<leader>cc', block = '<leader>cb' },
      opleader = { line = '<leader>c', block = '<leader>b' },
    },
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
  },

  -- == Language-Specific Enhancements ==

  -- Java development (Spring Boot, etc.)
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    opts = {
      -- Java-specific configurations will be handled by AstroLSP
    },
  },

  -- Go development
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    config = function()
      require("go").setup({
        -- Go-specific settings
        lsp_cfg = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },
        -- Enable gofmt on save
        lsp_inlay_hints = {
          enable = true,
        },
        -- Enable goimports on save
        lsp_document_formatting = true,
        -- Enable gopls features
        lsp_document_codeaction = true,
        -- Enable go test
        test_efm = true,
        -- Enable go mod tidy
        run_in_floaterm = true,
      })
    end,
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },

  -- Python debugging
  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    config = function()
      require("dap-python").setup("python")
    end,
  },

  -- == Code Quality & Formatting ==

  -- Prettier for various file types
  {
    "MunifTanjim/prettier.nvim",
    opts = {
      bin = "prettier",
      args = { "--stdin-filepath", "$FILENAME" },
    },
    ft = { "javascript", "typescript", "json", "markdown", "yaml", "html", "css" },
  },

  -- == Testing & Debugging ==

  -- Test runner
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-go"),
          require("neotest-python"),
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
        quickfix = {
          open = function()
            if require("astronvim").is_available "trouble.nvim" then
              require("trouble").open { mode = "quickfix", focus = false }
            else
              vim.cmd "copen"
            end
          end,
        },
      })
    end,
  },

  -- == Productivity Tools ==

  -- Better escape
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk", "jj" },
      timeout = 200,
      clear_empty_lines = false,
    },
  },

  -- Auto pairs with language-specific rules
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts)
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")

      -- Add language-specific rules
      npairs.add_rules({
        -- Java/C++ style
        Rule("(", ")", { "java", "cpp", "c", "go", "python" })
          :with_pair(cond.not_before_regex("%s*[%)%]%}]*"))
          :with_move(cond.none())
          :with_del(cond.none()),
        
        -- String quotes
        Rule('"', '"', { "java", "cpp", "c", "go", "python" })
          :with_pair(cond.not_before_regex("%s*[%)%]%}]*"))
          :with_move(cond.none()),
        
        Rule("'", "'", { "java", "cpp", "c", "go", "python" })
          :with_pair(cond.not_before_regex("%s*[%)%]%}]*"))
          :with_move(cond.none()),
      })
    end,
  },

  -- Enhanced snippets
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require("astronvim.plugins.configs.luasnip")(plugin, opts)
      local luasnip = require("luasnip")
      
      -- Add language-specific snippet filetypes
      luasnip.filetype_extend("java", { "java" })
      luasnip.filetype_extend("cpp", { "cpp", "c" })
      luasnip.filetype_extend("go", { "go" })
      luasnip.filetype_extend("python", { "python" })
    end,
  },

  -- == UI Enhancements ==

  -- Dashboard customization
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  },

  -- == LSP Enhancements ==

  -- LSP signature hints
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        handler_opts = {
          border = "rounded",
        },
        hint_enable = false,
        hint_prefix = "🐼 ",
        hint_scheme = "String",
        hi_parameter = "Search",
        max_height = 12,
        max_width = 120,
        padding = " ",
        toggle_key = "<C-k>",
      })
    end,
  },

  -- == File Navigation ==

  -- Telescope enhancements
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    },
  },

  -- == Additional Development Tools ==

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "│",
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      use_treesitter = true,
      show_current_context = true,
      show_current_context_start = true,
    },
  },

  -- Better status line
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require("astronvim.utils.status")
      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        status.component.file_info(),
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        status.component.mode({ surround = { separator = "right" } }),
      }
      return opts
    end,
  },
}
