-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- Highlight function names and 'return' keyword in bold
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "@function", { bold = true })
    vim.api.nvim_set_hl(0, "@keyword.return", { bold = true })
  end,
})
return {
  -- Keymaps for code action and hover info
  {
    "neovim/nvim-lspconfig",
    keys = {
      {
        "<leader>la",
        function()
          vim.lsp.buf.code_action()
        end,
        desc = "LSP Code Action",
        mode = { "n", "v" },
      },
      {
        "K",
        function()
          vim.lsp.buf.hover()
        end,
        desc = "LSP Hover Info",
        mode = "n",
      },
    },
  },

  -- Java LSP (jdtls) setup for LazyVim
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local mason_registry = require("mason-registry")
      local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
      local jdtls_bin = jdtls_path .. "/bin/jdtls"
      local home = vim.fn.expand("~")
      local workspace_dir = home .. "/.local/share/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      -- Configure environment to use Java 21 for jdtls
      local java21_home = vim.fn.getenv("JAVA_HOME") or "/usr/lib/jvm/java-21-openjdk"
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          -- Set JAVA_HOME for jdtls to use Java 21
          local original_java_home = vim.fn.getenv("JAVA_HOME")
          vim.fn.setenv("JAVA_HOME", java21_home)
          require("jdtls").start_or_attach({
            cmd = { jdtls_bin },
            root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
            settings = {
              java = {
                home = java21_home,
                configuration = {
                  runtimes = {
                    {
                      name = "JavaSE-17",
                      path = vim.fn.getenv("JAVA_17_HOME") or "/usr/lib/jvm/java-17-openjdk",
                    },
                    {
                      name = "JavaSE-21",
                      path = java21_home,
                    },
                  },
                },
              },
            },
            init_options = {
              bundles = {},
            },
          })

          -- Restore original JAVA_HOME after jdtls starts
          if original_java_home then
            vim.fn.setenv("JAVA_HOME", original_java_home)
          end
        end,
      })
    end,
  },
  -- -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  -- -- Configure LazyVim to load gruvbox
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox",
  --   },
  -- },
  -- -- change trouble config
  -- {
  --   "folke/trouble.nvim",
  --   -- opts will be merged with the parent spec
  --   opts = { use_diagnostic_signs = true },
  -- },
  -- -- disable trouble
  -- { "folke/trouble.nvim", enabled = false },
  -- -- override nvim-cmp and add cmp-emoji
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "emoji" })
  --   end,
  -- },

  -- Duplicate telescope configuration removed - using the one below
  -- change some telescope options and add keymaps to browse plugin files and show keybindings
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fk",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "Show All Keybindings",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- -- add pyright to lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   ---@class PluginLspOpts
  --   opts = {
  --     ---@type lspconfig.options
  --     servers = {
  --       -- pyright will be automatically installed with mason and loaded with lspconfig
  --       pyright = {},
  --     },
  --   },
  -- },

  -- Rainbow delimiters for colored brackets
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({})
    end,
  },

  -- TypeScript setup with proper inlay hints - includes vtsls, treesitter, mason, and typescript.nvim
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Auto close and rename HTML/XML tags
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {},
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- Duplicate treesitter configuration removed - using the one above

  -- WakaTime plugin for coding activity tracking
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  -- Premium lualine config with icons and separators
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Add icons to default sections, keep default pattern/layout
      opts.sections.lualine_a = { { "mode", icon = "" } }
      opts.sections.lualine_b = {
        { "branch", icon = "" },
        { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        {
          function()
            return "󰊢"
          end,
          color = { fg = "#fabd2f" },
        }, -- Git icon
      }
      opts.sections.lualine_c = {
        { "filename", icon = "" },
      }
      opts.sections.lualine_x = {
        { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
        { "encoding", icon = "" },
        { "fileformat" },
        { "filetype", icon = "" },
        {
          function()
            return "󰍛"
          end,
          color = { fg = "#d3869b" },
        }, -- Tools icon
      }
      opts.sections.lualine_y = {
        { "progress", icon = "" },
        {
          function()
            return "󰔟"
          end,
          color = { fg = "#b8bb26" },
        }, -- Eye icon for progress
      }
      opts.sections.lualine_z = {
        { "location", icon = "" },
        {
          function()
            return "󰃢"
          end,
          color = { fg = "#fe8019" },
        }, -- Position icon
        {
          function()
            return ""
          end,
          color = { fg = "#fabd2f" },
        }, -- Game controller icon
      }
      opts.sections.lualine_z2 = {
        {
          function()
            return "󰄛"
          end,
          color = { fg = "#fabd2f" },
        }, -- Pacman icon
      }
      return opts
    end,
  },

  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- UI Enhancements
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- Productivity Plugins
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- Session & Project Management
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({})
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
  },

  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({})
      vim.keymap.set("n", "<leader>ft", function()
        require("toggleterm").toggle(1, nil, nil, "float")
      end, { desc = "Floating Terminal" })
    end,
  },
  -- Markdown & Docs
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview", ft = "markdown" },
      { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Preview Stop", ft = "markdown" },
      { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview Toggle", ft = "markdown" },
    },
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ""
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ""
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
      }
      vim.g.mkdp_markdown_css = ""
      vim.g.mkdp_highlight_css = ""
      vim.g.mkdp_port = ""
      vim.g.mkdp_page_title = "「${name}」"
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    config = true,
  },

  -- Cursor & UI Effects

  -- Performance & Profiling
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },

  -- Completion & Snippets
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = true,
  },
  {
    "rafamadriz/friendly-snippets",
    event = "VeryLazy",
  },

  -- LazyGit integration
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Simple Jira integration (custom implementation)
  {
    "nvim-lua/plenary.nvim", -- We'll use this for HTTP requests
    config = function()
      -- Simple Jira integration using curl
      vim.api.nvim_create_user_command("JiraOpen", function(opts)
        local issue_key = opts.args
        if issue_key == "" then
          issue_key = vim.fn.input("Enter Jira issue key: ")
        end
        if issue_key ~= "" then
          local jira_url = vim.fn.getenv("JIRA_URL") or "https://your-company.atlassian.net"
          local url = jira_url .. "/browse/" .. issue_key
          vim.fn.system("open " .. url) -- macOS
        end
      end, { nargs = "?" })

      vim.api.nvim_create_user_command("JiraSearch", function()
        local query = vim.fn.input("Enter JQL query: ")
        if query ~= "" then
          local jira_url = vim.fn.getenv("JIRA_URL") or "https://your-company.atlassian.net"
          local url = jira_url .. "/issues/?jql=" .. vim.fn.escape(query, " ")
          vim.fn.system("open '" .. url .. "'")
        end
      end, {})

      vim.api.nvim_create_user_command("JiraMyIssues", function()
        local jira_url = vim.fn.getenv("JIRA_URL") or "https://your-company.atlassian.net"
        local url = jira_url .. "/issues/?filter=-1"
        vim.fn.system("open " .. url)
      end, {})
    end,
    keys = {
      { "<leader>jo", "<cmd>JiraOpen<cr>", desc = "Open Jira Issue" },
      { "<leader>js", "<cmd>JiraSearch<cr>", desc = "Search Jira" },
      { "<leader>jm", "<cmd>JiraMyIssues<cr>", desc = "My Jira Issues" },
    },
  },

  -- Transparency plugin for Ghosty compatibility
  {
    "xiyaowong/transparent.nvim",
    opts = {
      groups = {
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorColumn",
        "CursorLine",
        "TabLine",
        "TabLineFill",
        "StatusLine",
        "StatusLineNC",
        "Search",
        "IncSearch",
        "Pmenu",
        "PmenuSel",
        "PmenuSbar",
        "PmenuThumb",
        "Question",
        "SpecialKey",
        "VertSplit",
        "Visual",
        "VisualNOS",
        "WarningMsg",
        "WildMenu",
        "Folded",
        "FoldColumn",
        "DiffAdd",
        "DiffChange",
        "DiffDelete",
        "DiffText",
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
        "TelescopeNormal",
        "TelescopeBorder",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "WhichKeyFloat",
      },
      extra_groups = {},
      exclude_groups = {},
    },
    keys = {
      { "<leader>tt", "<cmd>TransparentToggle<cr>", desc = "Toggle Transparency" },
    },
  },

  -- Neo-tree file explorer with auto-close on file open
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_default",
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            -- Auto close neo-tree when a file is opened
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
}
