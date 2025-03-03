--
-- ---@type LazySpec
-- return {
--   "AstroNvim/astrolsp",
--   opts = {
--     formatting = {
--       format_on_save = {
--         enabled = true,
--         allow_filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact","go" }, -- For Next.js
--       },
--     },
--     servers = {
--       eslint = {
--         settings = {
--           codeActionOnSave = {
--             enable = true,
--             mode = "all",
--           },
--           format = true,
--           nodePath = vim.fn.getcwd() .. "/node_modules/.bin",
--         },
--       },
--       gopls={},
--     },
--   },
-- }

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  opts = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "javascript", "typescript", "typescriptreact", "javascriptreact", "go", "dart" 
        }, -- Added "dart" for auto-formatting Dart files
      },
    },
    servers = {
      eslint = {
        settings = {
          codeActionOnSave = {
            enable = true,
            mode = "all",
          },
          format = true,
          nodePath = vim.fn.getcwd() .. "/node_modules/.bin",
        },
      },
      gopls = {}, -- Go LSP
      dartls = { -- Dart LSP
        cmd = { "dart", "language-server", "--protocol=lsp" }, -- Manually set Dart LSP command
        filetypes = { "dart" },
        root_dir = require("lspconfig").util.root_pattern("pubspec.yaml"),
        settings = {
          dart = {
            completeFunctionCalls = true,
            analysisExcludedFolders = {
              vim.fn.expand "$HOME/.pub-cache",
              vim.fn.expand "$HOME/flutter",
            },
          },
        },
      },
    },
  },
}
