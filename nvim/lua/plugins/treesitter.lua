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
      "java",
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
      additional_vim_regex_highlighting = false,
    },
  },
  config = function()
    -- Enable italics for function names without changing color
    vim.api.nvim_set_hl(0, "@function", { italic = true }) -- Only italic, no color
    vim.api.nvim_set_hl(0, "@method", { italic = true }) -- Only italic, no color
    vim.api.nvim_set_hl(0, "Function", { italic = true }) -- Only italic, no color
  end,
}
