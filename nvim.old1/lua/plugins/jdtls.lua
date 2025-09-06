return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {
          -- Adjust to your jdtls location below
          cmd = {
            "/Users/puspo/.local/share/jdtls/bin/jdtls",
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("pom.xml", "build.gradle", ".git", ".project")(fname)
              or vim.fn.getcwd()
          end,
        },
      },
    },
  },
}
