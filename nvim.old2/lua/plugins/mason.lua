return {
  -- Configure Mason for LSP servers
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "tailwindcss",
        "jdtls",
        "clangd",
        "kotlin_language_server",
        "volar",
        "angularls",
        "html",
        "dockerls",
        "sqlls", -- Fix: "sqls" → "sqlls" (correct LSP name for SQL)
      },
    },
  },
  -- Configure Mason for Formatters and Linters
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua", -- Lua formatter
        "prettier", -- JS/TS/CSS/HTML formatter
        "eslint_d", -- JS/TS linter
        "black", -- Python formatter
        "flake8", -- Python linter
        "clang-format", -- C/C++ formatter
        "shellcheck", -- Shell script linter
      },
      automatic_installation = true, -- Auto install missing tools
    },
  },
  -- Configure Mason for Debuggers (DAP)
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
