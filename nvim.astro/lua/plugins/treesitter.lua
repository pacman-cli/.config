-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- Core languages
      "lua",
      "vim",
      "vimdoc",
      
      -- Target languages
      "java",
      "cpp",
      "c",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "python",
      
      -- Web development
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "scss",
      "json",
      "yaml",
      "toml",
      
      -- Markup and config
      "markdown",
      "markdown_inline",
      "bash",
      "dockerfile",
      "gitignore",
      "git_config",
      "git_rebase",
      "git_commit",
      "gitattributes",
      
      -- Additional useful languages
      "rust",
      "sql",
      "xml",
      "ini",
      "cmake",
      "make",
    },
    -- Enable additional features
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    -- Additional treesitter modules
    modules = {
      -- Enable additional treesitter modules
      "treesitter-query",
    },
  },
}
