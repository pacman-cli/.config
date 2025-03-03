-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"

    -- Ensure opts.sources exists
    opts.sources = opts.sources or {}

    -- Add formatters and linters
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Lua
      null_ls.builtins.formatting.stylua,

      -- JavaScript, TypeScript, HTML, CSS, JSON
      null_ls.builtins.formatting.prettier,
      -- null_ls.builtins.diagnostics.eslint_d,

      -- PHP
      null_ls.builtins.formatting.phpcsfixer,
      null_ls.builtins.diagnostics.phpstan,
      null_ls.builtins.diagnostics.phpcs,

      -- Go
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.diagnostics.golangci_lint,

      -- Python
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.diagnostics.pylint,

      -- Rust
      -- null_ls.builtins.formatting.rustfmt,

      -- C, C++
      null_ls.builtins.formatting.clang_format,

      -- Shell Scripts
      -- null_ls.builtins.formatting.shfmt,
      -- null_ls.builtins.diagnostics.shellcheck,
    })
  end,
}
