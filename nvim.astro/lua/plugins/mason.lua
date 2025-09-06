-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- Language servers (essential)
        "lua-language-server",
        "clangd",           -- C/C++
        "jdtls",            -- Java
        "gopls",            -- Go
        "pyright",          -- Python
        "marksman",         -- Markdown
        "json-lsp",         -- JSON
        "yaml-language-server", -- YAML
        "dockerls",         -- Docker
        "bash-language-server", -- Bash
        
        -- Formatters (essential)
        "stylua",           -- Lua
        "clang-format",     -- C/C++
        "google-java-format", -- Java
        "gofumpt",          -- Go
        "goimports",        -- Go imports
        "black",            -- Python
        "isort",            -- Python imports
        "prettier",         -- JS/TS/JSON/MD
        "shfmt",            -- Shell scripts
        
        -- Linters (essential)
        "luacheck",         -- Lua
        "cpplint",          -- C++
        "checkstyle",       -- Java
        "golangci-lint",    -- Go
        "flake8",           -- Python
        "shellcheck",       -- Shell scripts
        
        -- Debuggers (essential)
        "debugpy",          -- Python
        "java-debug-adapter", -- Java
        "java-test-adapter", -- Java tests
        "delve",            -- Go
        "codelldb",         -- C/C++ debugger
        
        -- Other tools
        "tree-sitter-cli",  -- Treesitter
        "typescript-language-server", -- TypeScript
        "eslint-lsp",       -- ESLint
        "tailwindcss-language-server", -- Tailwind CSS
      },
    },
  },
}
