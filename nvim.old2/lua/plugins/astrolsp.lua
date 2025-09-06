-- -- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- -- Configuration documentation can be found with `:h astrolsp`
-- -- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
-- --       as this provides autocomplete and documentation while editing
--
-- ---@type LazySpec
-- return {
--   "AstroNvim/astrolsp",
--   ---@type AstroLSPOpts
--   opts = {
--     -- Configuration table of features provided by AstroLSP
--     features = {
--       codelens = true, -- enable/disable codelens refresh on start
--       inlay_hints = false, -- enable/disable inlay hints on start
--       semantic_tokens = true, -- enable/disable semantic token highlighting
--     },
--     -- customize lsp formatting options
--     formatting = {
--       -- control auto formatting on save
--       format_on_save = {
--         enabled = true, -- enable or disable format on save globally
--         allow_filetypes = { -- enable format on save for specified filetypes only
--           "go",
--         },
--         ignore_filetypes = { -- disable format on save for specified filetypes
--           -- "python",
--         },
--       },
--       disabled = { -- disable formatting capabilities for the listed language servers
--         -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
--         -- "lua_ls",
--       },
--       timeout_ms = 1000, -- default format timeout
--       -- filter = function(client) -- fully override the default formatting function
--       --   return true
--       -- end
--     },
--     -- enable servers that you already have installed without mason
--     servers = {
--       gopls = {
--         cmd = { "gopls" },
--         filetypes = { "go", "gomod", "gowork", "gotmpl" },
--         root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
--         settings = {
--           gopls = {
--             analyses = {
--               unusedparams = true,
--               shadow = true,
--             },
--             staticcheck = true,
--           },
--         },}
--       -- "pyright"
--     },
--     -- customize language server configuration options passed to `lspconfig`
--     ---@diagnostic disable: missing-fields
--     config = {
--       ["*"] = {
--         capabilities = {
--           textDocument = {
--             completion = {
--               completionItem = {
--                 snippetSupport = true,
--                 preselectSupport = false,
--                 insertReplaceSupport = false,
--                 labelDetailsSupport = true,
--                 deprecatedSupport = false,
--                 commitCharactersSupport = false,
--                 documentationFormat = { "markdown" },
--                 resolveSupport = {
--                   properties = { "documentation", "detail" },
--                 },
--               },
--               contextSupport = false,
--             },
--           },
--         },
--         handlers = {
--           ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", max_width = 80 }),
--           ["textDocument/signatureHelp"] = vim.lsp.with(
--             vim.lsp.handlers.signature_help,
--             { border = "rounded", max_width = 80 }
--           ),
--         },
--       },
--       "neovim/nvim-lspconfig",
--       opts = {
--         servers = {
--           -- PHP LSP Configuration
--           intelephense = {
--             settings = {
--               intelephense = {
--                 files = {
--                   maxSize = 5000000, -- Increase file size limit if needed
--                 },
--               },
--             },
--           },
--         },
--       },
--       config = function()
--         -- Enable auto-formatting on save for PHP
--         vim.api.nvim_create_autocmd("BufWritePre", {
--           pattern = "*.php",
--           callback = function() vim.lsp.buf.format() end,
--         })
--       end,
--       -- Add Java LSP configuration
--       jdtls = {
--         cmd = {
--           "java",
--           "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--           "-Dosgi.bundles.defaultStartLevel=4",
--           "-Declipse.product=org.eclipse.jdt.ls.core.product",
--           "-Dlog.protocol=true",
--           "-Dlog.level=ALL",
--           "-Xmx1g",
--           "--add-modules=ALL-SYSTEM",
--           "--add-opens",
--           "java.base/java.util=ALL-UNNAMED",
--           "--add-opens",
--           "java.base/java.lang=ALL-UNNAMED",
--           "-jar",
--           vim.fn.glob "/opt/homebrew/Cellar/jdtls/*/libexec/plugins/org.eclipse.equinox.launcher_*.jar",
--           "-configuration",
--           "/opt/homebrew/Cellar/jdtls/*/libexec/config_mac",
--           "-data",
--           vim.fn.expand "~/.cache/jdtls-workspace" .. vim.fn.getcwd(),
--         },
--         -- Modified root_dir configuration
--         root_dir = function(fname)
--           local root = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
--           -- If no project root found, use the file's directory as root
--           return root or vim.fn.expand "%:p:h"
--         end,
--         settings = {
--           java = {
--             home = "/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home",
--             configuration = {
--               runtimes = {
--                 {
--                   name = "JavaSE-17",
--                   path = "/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home",
--                 },
--               },
--             },
--           },
--         },
--       },
--     },
--     -- customize how language servers are attached
--     handlers = {
--       -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
--       -- function(server, opts) require("lspconfig")[server].setup(opts) end
--
--       -- the key is the server that is being setup with `lspconfig`
--       -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
--       -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
--     },
--     -- Configure buffer local auto commands to add when attaching a language server
--     autocmds = {
--       -- first key is the `augroup` to add the auto commands to (:h augroup)
--       lsp_codelens_refresh = {
--         -- Optional condition to create/delete auto command group
--         -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
--         -- condition will be resolved for each client on each execution and if it ever fails for all clients,
--         -- the auto commands will be deleted for that buffer
--         cond = "textDocument/codeLens",
--         -- cond = function(client, bufnr) return client.name == "lua_ls" end,
--         -- list of auto commands to set
--         {
--           -- events to trigger
--           event = { "InsertLeave", "BufEnter" },
--           -- the rest of the autocmd options (:h nvim_create_autocmd)
--           desc = "Refresh codelens (buffer)",
--           callback = function(args)
--             if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
--           end,
--         },
--       },
--     },
--     -- mappings to be set up on attaching of a language server
--     mappings = {
--       n = {
--         -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
--         gD = {
--           function() vim.lsp.buf.declaration() end,
--           desc = "Declaration of current symbol",
--           cond = "textDocument/declaration",
--         },
--         ["<Leader>uY"] = {
--           function() require("astrolsp.toggles").buffer_semantic_tokens() end,
--           desc = "Toggle LSP semantic highlight (buffer)",
--           cond = function(client)
--             return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
--           end,
--         },
--       },
--     },
--     -- A custom `on_attach` function to be run after the default `on_attach` function
--     -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
--     on_attach = function(client, bufnr)
--       -- this would disable semanticTokensProvider for all clients
--       -- client.server_capabilities.semanticTokensProvider = nil
--     end,
--   },
-- }
--
--
--
--
-- ---@type LazySpec
-- return {
--   "AstroNvim/astrolsp",
--   ---@type AstroLSPOpts
--   opts = {
--     features = {
--       codelens = true,
--       inlay_hints = false,
--       semantic_tokens = true,
--     },
--     formatting = {
--       format_on_save = {
--         enabled = true,
--         allow_filetypes = { "go", "java","php" },
--         ignore_filetypes = {},
--       },
--       disabled = {},
--       timeout_ms = 1000,
--     },
--     servers = {
--       gopls = {
--         cmd = { "gopls" },
--         filetypes = { "go", "gomod", "gowork", "gotmpl" },
--         root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
--         settings = {
--           gopls = {
--             analyses = {
--               unusedparams = true,
--               shadow = true,
--             },
--             staticcheck = true,
--           },
--         },
--       },
--       jdtls = {
--         cmd = {
--           "java",
--           "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--           "-Dosgi.bundles.defaultStartLevel=4",
--           "-Declipse.product=org.eclipse.jdt.ls.core.product",
--           "-Dlog.protocol=true",
--           "-Dlog.level=ALL",
--           "-Xmx1g",
--           "--add-modules=ALL-SYSTEM",
--           "--add-opens",
--           "java.base/java.util=ALL-UNNAMED",
--           "--add-opens",
--           "java.base/java.lang=ALL-UNNAMED",
--           "-jar",
--           vim.fn.glob "/opt/homebrew/Cellar/jdtls/*/libexec/plugins/org.eclipse.equinox.launcher_*.jar",
--           "-configuration",
--           "/opt/homebrew/Cellar/jdtls/*/libexec/config_mac",
--           "-data",
--           vim.fn.expand "~/.cache/jdtls-workspace" .. vim.fn.getcwd(),
--         },
--         root_dir = function(fname)
--           local root = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
--           return root or vim.fn.expand "%:p:h"
--         end,
--         settings = {
--           java = {
--             home = "/opt/homebrew/opt/openjdk@24/libexec/openjdk.jdk/Contents/Home", -- JDK 24 path
--             configuration = {
--               runtimes = {
--                 {
--                   name = "JavaSE-24",
--                   path = "/opt/homebrew/opt/openjdk@24/libexec/openjdk.jdk/Contents/Home", -- JDK 24 path
--                 },
--               },
--             },
--           },
--         },
--       },
--     },
--     config = {
--       ["*"] = {
--         capabilities = {
--           textDocument = {
--             completion = {
--               completionItem = {
--                 snippetSupport = true,
--                 preselectSupport = false,
--                 insertReplaceSupport = false,
--                 labelDetailsSupport = true,
--                 deprecatedSupport = false,
--                 commitCharactersSupport = false,
--                 documentationFormat = { "markdown" },
--                 resolveSupport = {
--                   properties = { "documentation", "detail" },
--                 },
--               },
--               contextSupport = false,
--             },
--           },
--         },
--         handlers = {
--           ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", max_width = 80 }),
--           ["textDocument/signatureHelp"] = vim.lsp.with(
--             vim.lsp.handlers.signature_help,
--             { border = "rounded", max_width = 80 }
--           ),
--         },
--       },
--     },
--     autocmds = {
--       lsp_codelens_refresh = {
--         cond = "textDocument/codeLens",
--         {
--           event = { "InsertLeave", "BufEnter" },
--           desc = "Refresh codelens (buffer)",
--           callback = function(args)
--             if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
--           end,
--         },
--       },
--     },
--     auto_install_java_deps = {
--       {
--         event = "BufWritePost",
--         pattern = { "pom.xml", "build.gradle", "build.gradle.kts" },
--         desc = "Automatically install Java dependencies",
--         callback = function()
--           if vim.fn.filereadable "mvnw" == 1 or vim.fn.filereadable "pom.xml" == 1 then
--             vim.cmd "!./mvnw dependency:resolve || mvn dependency:resolve"
--           elseif vim.fn.filereadable "gradlew" == 1 or vim.fn.filereadable "build.gradle" == 1 then
--             vim.cmd "!./gradlew build || gradle build"
--           end
--         end,
--       },
--     },
--     mappings = {
--       n = {
--         gD = {
--           function() vim.lsp.buf.declaration() end,
--           desc = "Declaration of current symbol",
--           cond = "textDocument/declaration",
--         },
--         ["<Leader>uY"] = {
--           function() require("astrolsp.toggles").buffer_semantic_tokens() end,
--           desc = "Toggle LSP semantic highlight (buffer)",
--           cond = function(client)
--             return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
--           end,
--         },
--       },
--     },
--     on_attach = function(client, bufnr)
--       -- Disable semanticTokensProvider for all clients
--       -- client.server_capabilities.semanticTokensProvider = nil
--     end,
--   },
-- }
--
--
------------------------------------------------------------------------------------------------------------
---

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = { "go", "java", "php" }, -- Added PHP here
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {
      gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          },
        },
      },
      jdtls = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          vim.fn.glob "/opt/homebrew/Cellar/jdtls/*/libexec/plugins/org.eclipse.equinox.launcher_*.jar",
          "-configuration",
          "/opt/homebrew/Cellar/jdtls/*/libexec/config_mac",
          "-data",
          vim.fn.expand "~/.cache/jdtls-workspace" .. vim.fn.getcwd(),
        },
        root_dir = function(fname)
          local root = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
          return root or vim.fn.expand "%:p:h"
        end,
        settings = {
          java = {
            home = "/opt/homebrew/opt/openjdk@24/libexec/openjdk.jdk/Contents/Home",
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-24",
                  path = "/opt/homebrew/opt/openjdk@24/libexec/openjdk.jdk/Contents/Home",
                },
              },
            },
          },
        },
      },
      intelephense = {
        filetypes = { "php" },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("composer.json", ".git")(fname) or vim.fn.getcwd() -- fallback to current working directory
        end,
        settings = {
          intelephense = {
            files = {
              maxSize = 1000000,
            },
          },
        },
      },
    },
    config = {
      ["*"] = {
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = true,
                preselectSupport = false,
                insertReplaceSupport = false,
                labelDetailsSupport = true,
                deprecatedSupport = false,
                commitCharactersSupport = false,
                documentationFormat = { "markdown" },
                resolveSupport = {
                  properties = { "documentation", "detail" },
                },
              },
              contextSupport = false,
            },
          },
        },
        handlers = {
          ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", max_width = 80 }),
          ["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            { border = "rounded", max_width = 80 }
          ),
        },
      },
    },
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    auto_install_java_deps = {
      {
        event = "BufWritePost",
        pattern = { "pom.xml", "build.gradle", "build.gradle.kts" },
        desc = "Automatically install Java dependencies",
        callback = function()
          if vim.fn.filereadable "mvnw" == 1 or vim.fn.filereadable "pom.xml" == 1 then
            vim.cmd "!./mvnw dependency:resolve || mvn dependency:resolve"
          elseif vim.fn.filereadable "gradlew" == 1 or vim.fn.filereadable "build.gradle" == 1 then
            vim.cmd "!./gradlew build || gradle build"
          end
        end,
      },
    },
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
    on_attach = function(client, bufnr)
      -- Disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
