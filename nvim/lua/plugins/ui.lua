return {
  -- Premium lualine config with icons and separators
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_a = { { "mode", icon = "" } }
      opts.sections.lualine_b = {
        { "branch", icon = "" },
        { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        { function() return "󰊢" end, color = { fg = "#fabd2f" } },
      }
      opts.sections.lualine_c = { { "filename", icon = "" } }
      opts.sections.lualine_x = {
        { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
        { "encoding", icon = "" },
        { "fileformat" },
        { "filetype", icon = "" },
        { function() return "󰍛" end, color = { fg = "#d3869b" } },
      }
      opts.sections.lualine_y = {
        { "progress", icon = "" },
        { function() return "󰔟" end, color = { fg = "#b8bb26" } },
      }
      opts.sections.lualine_z = {
        { "location", icon = "" },
        { function() return "󰃢" end, color = { fg = "#fe8019" } },
        { function() return "" end, color = { fg = "#fabd2f" } },
        { function() return "󰄛" end, color = { fg = "#fabd2f" } },
      }
      return opts
    end,
  },

  -- Transparency plugin for Ghosty compatibility
  {
    "xiyaowong/transparent.nvim",
    opts = {
      groups = {
        "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
        "Statement", "PreProc", "Type", "Underlined", "Todo", "String",
        "Function", "Conditional", "Repeat", "Operator", "Structure", "LineNr",
        "NonText", "SignColumn", "CursorColumn", "CursorLine", "TabLine",
        "TabLineFill", "StatusLine", "StatusLineNC", "Search", "IncSearch",
        "Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb", "Question", "SpecialKey",
        "VertSplit", "Visual", "VisualNOS", "WarningMsg", "WildMenu", "Folded",
        "FoldColumn", "DiffAdd", "DiffChange", "DiffDelete", "DiffText",
        "GitSignsAdd", "GitSignsChange", "GitSignsDelete", "TelescopeNormal",
        "TelescopeBorder", "NeoTreeNormal", "NeoTreeNormalNC", "WhichKeyFloat",
      },
    },
    keys = {
      { "<leader>tt", "<cmd>TransparentToggle<cr>", desc = "Toggle Transparency" },
    },
  },

  -- Telescope customization
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fk",
        function() require("telescope.builtin").keymaps() end,
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

  -- Neo-tree customization
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.close_if_last_window = true
      opts.window = opts.window or {}
      opts.window.width = 30
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.follow_current_file = { enabled = true }
      opts.filesystem.hijack_netrw_behavior = "open_default"
      
      opts.event_handlers = opts.event_handlers or {}
      table.insert(opts.event_handlers, {
        event = "file_opened",
        handler = function()
          vim.defer_fn(function()
            local ok, manager = pcall(require, "neo-tree.sources.manager")
            if not ok then return end
            local state = manager.get_state("filesystem")
            if state and state.winid and vim.api.nvim_win_is_valid(state.winid) then
              local wins = vim.api.nvim_list_wins()
              if #wins > 1 then pcall(vim.cmd, "Neotree close filesystem") end
            end
          end, 100)
        end,
      })
      return opts
    end,
  },
}
