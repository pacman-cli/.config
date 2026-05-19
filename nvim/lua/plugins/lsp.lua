return {
  -- Keymaps for code action and hover info
  {
    "neovim/nvim-lspconfig",
    keys = {
      {
        "<leader>la",
        function()
          vim.lsp.buf.code_action()
        end,
        desc = "LSP Code Action",
        mode = { "n", "v" },
      },
      {
        "K",
        function()
          vim.lsp.buf.hover()
        end,
        desc = "LSP Hover Info",
        mode = "n",
      },
    },
  },

  -- Fix refactoring.nvim: add missing async.nvim dependency
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "lewis6991/async.nvim",
    },
  },

  -- Java configuration: use Java 21 for jdtls
  {
    "mfussenegger/nvim-jdtls",
    optional = true,
    opts = function(_, opts)
      opts = opts or {}

      local java21_home = nil
      -- Cross-platform Java 21 detection
      if vim.fn.has("macunix") == 1 then
        if vim.fn.executable("/usr/libexec/java_home") == 1 then
          local result = vim.fn.system("/usr/libexec/java_home -v 21 2>/dev/null")
          if vim.v.shell_error == 0 then
            java21_home = vim.fn.trim(result)
          end
        end
      elseif vim.fn.has("unix") == 1 then
        local java_paths = {
          "/usr/lib/jvm/java-21-openjdk",
          "/usr/lib/jvm/java-21-oracle",
          "/usr/lib/jvm/jdk-21",
          "/opt/java/openjdk",
          "/opt/jdk-21"
        }
        for _, path in ipairs(java_paths) do
          if vim.fn.executable(path .. "/bin/java") == 1 then
            java21_home = path
            break
          end
        end
      elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
        local program_files = os.getenv("ProgramFiles") or "C:\\Program Files"
        local possible_paths = {
          program_files .. "\\Java\\jdk-21",
          "C:\\Program Files\\Java\\jdk-21"
        }
        for _, path in ipairs(possible_paths) do
          if vim.fn.executable(path .. "\\bin\\java.exe") == 1 then
            java21_home = path
            break
          end
        end
      end

      if not java21_home or java21_home == "" then
        return opts
      end

      local java_executable = (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1)
        and java21_home .. "\\bin\\java.exe"
        or java21_home .. "/bin/java"

      if vim.fn.filereadable(java_executable) ~= 1 then
        return opts
      end

      local cmd = vim.deepcopy(opts.cmd or { vim.fn.exepath("jdtls") })
      local has_java_executable = false
      for index, value in ipairs(cmd) do
        if value == "--java-executable" then
          cmd[index + 1] = java_executable
          has_java_executable = true
          break
        end
      end
      if not has_java_executable then
        vim.list_extend(cmd, { "--java-executable", java_executable })
      end

      opts.cmd = cmd
      opts.jdtls = vim.tbl_deep_extend("force", opts.jdtls or {}, {
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-21",
                  path = java21_home,
                  default = true,
                },
              },
            },
          },
        },
      })
      return opts
    end,
  },
}
