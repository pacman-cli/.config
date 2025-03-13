return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" }, -- Use stylua for Lua files
      toml = { "taplo" }, -- Use Taplo for TOML files
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
