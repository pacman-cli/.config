-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up additional keymaps for development
local function setup_dev_keymaps()
  -- Language-specific keymaps
  local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  -- General development keymaps
  map("n", "<leader>tt", ":Neotest run<CR>", { desc = "Run tests" })
  map("n", "<leader>tf", ":Neotest run file<CR>", { desc = "Run tests in file" })
  map("n", "<leader>tl", ":Neotest run last<CR>", { desc = "Run last test" })
  map("n", "<leader>to", ":Neotest output<CR>", { desc = "Show test output" })
  map("n", "<leader>ts", ":Neotest summary<CR>", { desc = "Show test summary" })

  -- Code actions and refactoring
  map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
  map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
  map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
  map("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>", { desc = "Find references" })
  map("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
  map("n", "<leader>gt", ":lua vim.lsp.buf.type_definition()<CR>", { desc = "Go to type definition" })

  -- Formatting and linting
  map("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { desc = "Format buffer" })
  map("n", "<leader>F", ":lua vim.lsp.buf.format({ async = true })<CR>", { desc = "Format buffer async" })

  -- File navigation
  map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
  map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
  map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
  map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })

  -- Git operations
  map("n", "<leader>gs", ":Telescope git_status<CR>", { desc = "Git status" })
  map("n", "<leader>gc", ":Telescope git_commits<CR>", { desc = "Git commits" })
  map("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Git branches" })

  -- Language-specific keymaps
  local function setup_lang_keymaps()
    -- Java keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        map("n", "<leader>jm", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Java code actions" })
        map("n", "<leader>jt", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Java test actions" })
        map("n", "<leader>jn", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Java organize imports" })
      end,
    })

    -- Go keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        map("n", "<leader>gt", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Go test actions" })
        map("n", "<leader>gf", ":lua vim.lsp.buf.format()<CR>", { desc = "Go fmt" })
        map("n", "<leader>gi", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Go import actions" })
        map("n", "<leader>gl", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Go lint actions" })
        map("n", "<leader>gr", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Go run actions" })
        map("n", "<leader>gb", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Go build actions" })
      end,
    })

    -- Python keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        map("n", "<leader>pr", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Python test actions" })
        map("n", "<leader>pc", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Python class actions" })
      end,
    })

    -- C/C++ keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp" },
      callback = function()
        map("n", "<leader>cb", ":lua vim.lsp.buf.code_action()<CR>", { desc = "C++ code actions" })
        map("n", "<leader>cc", ":lua vim.lsp.buf.code_action()<CR>", { desc = "C++ AST actions" })
      end,
    })
  end

  setup_lang_keymaps()
end

-- Set up additional options for better development experience
local function setup_dev_options()
  -- Enable line numbers and relative line numbers
  vim.wo.number = true
  vim.wo.relativenumber = true

  -- Enable cursor line
  vim.wo.cursorline = true

  -- Set up better search
  vim.opt.incsearch = true
  vim.opt.hlsearch = true
  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  -- Set up better indentation
  vim.opt.expandtab = true
  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2

  -- Language-specific indentation
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java", "cpp", "c" },
    callback = function()
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
      vim.opt.shiftwidth = 8
      vim.opt.tabstop = 8
      vim.opt.softtabstop = 8
      vim.opt.expandtab = false
    end,
  })

  -- Enable mouse support
  vim.opt.mouse = "a"

  -- Set up better completion
  vim.opt.completeopt = "menu,menuone,noselect"

  -- Set up better splits
  vim.opt.splitbelow = true
  vim.opt.splitright = true

  -- Set up better terminal
  vim.opt.termguicolors = true

  -- Additional options for better development
  vim.opt.wrap = false
  vim.opt.scrolloff = 8
  vim.opt.sidescrolloff = 8
  vim.opt.updatetime = 100
  vim.opt.timeoutlen = 300
  vim.opt.clipboard = "unnamedplus"
  vim.opt.undofile = true
  vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
  vim.opt.backup = false
  vim.opt.writebackup = false
  vim.opt.swapfile = false
end

-- Initialize development setup with error handling
local function safe_setup()
  local ok, err = pcall(function()
    setup_dev_options()
    setup_dev_keymaps()
  end)
  
  if not ok then
    vim.notify("Error in polish.lua: " .. tostring(err), vim.log.levels.ERROR, {
      title = "Configuration Error",
      timeout = 5000,
    })
  end
end

-- Run setup
safe_setup()

-- Print success message
vim.api.nvim_create_autocmd("User", {
  pattern = "AstroNvimStarted",
  callback = function()
    vim.schedule(function()
      vim.notify("🚀 Enhanced AstroNeovim configuration loaded for Java, C++, Go, and Python development!", vim.log.levels.INFO, {
        title = "AstroNeovim Enhanced",
        timeout = 3000,
      })
    end)
  end,
})
