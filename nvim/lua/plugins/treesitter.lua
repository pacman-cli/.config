-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "javascript",
      "typescript",
      "python",
      "go",
      "rust",
      "c",
      "cpp",
      -- "java",
      "html",
      "css",
      "bash",
      "json",
      "yaml",
      "toml",
      "markdown",
      "markdown_inline",
      "php",
      "sql", -- Added SQL language for syntax highlighting
    },
    highlight = {
      enable = true, -- Enable Treesitter highlighting
      additional_vim_regex_highlighting = false, --default:false
    },
  },
  config = function()
    -- Customize function and method calls
    vim.api.nvim_set_hl(0, "@function.call", { italic = true, fg = "#FF5733" })
    vim.api.nvim_set_hl(0, "@method.call", { italic = true, fg = "#FF5733" })

    -- Customize function and method names (italic and color)
    vim.api.nvim_set_hl(0, "@function", { italic = true, fg = "#FF5733" })
    vim.api.nvim_set_hl(0, "@method", { italic = true, fg = "#FF5733" })
    vim.api.nvim_set_hl(0, "Function", { italic = true, fg = "#FF5733" })

    -- Customize punctuation and operator colors (light gray)
    vim.api.nvim_set_hl(0, "@punctuation", { fg = "#F5F5F5" })
    vim.api.nvim_set_hl(0, "@operator", { fg = "#F5F5F5" })

    -- Customize variable and parameter colors
    vim.api.nvim_set_hl(0, "@variable", { fg = "#B0B0B0" }) -- Lighter gray for variables
    vim.api.nvim_set_hl(0, "@parameter", { fg = "#7C4DFF" }) -- Purple for parameters

    -- vim.api.nvim_set_hl(0, "@function.call", { italic = true, fg = "#FF5733" })
    -- vim.api.nvim_set_hl(0, "@method.call", { italic = true, fg = "#FF5733" })
    --
    -- -- Enable italics for function names and change their color
    -- vim.api.nvim_set_hl(0, "@function", { italic = true, fg = "#FF5733" }) -- Function color and italic
    -- vim.api.nvim_set_hl(0, "@method", { italic = true, fg = "#FF5733" }) -- Method color and italic
    -- vim.api.nvim_set_hl(0, "Function", { italic = true, fg = "#FF5733" }) -- Function color and italic
    --
    -- vim.api.nvim_set_hl(0, "@punctuation", { fg = "#E0E0E0" }) -- Light gray for punctuation (including colon)
    -- vim.api.nvim_set_hl(0, "@operator", { fg = "#E0E0E0" }) -- Light gray for operators (including colon)
    -- vim.api.nvim_set_hl(0, "@parameter", { fg = "#7C4DFF" }) -- Parameters color
  end,
}
