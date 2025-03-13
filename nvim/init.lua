-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution

-- For init.lua
vim.opt.guifont = "Dank Mono:h14"
vim.opt.swapfile = false
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
    vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- Disable providers you don't actively use
vim.g.loaded_perl_provider = 0 -- Disable Perl provider
vim.g.loaded_ruby_provider = 0 -- Disable Ruby provider if you don't use it

-- Set up formatters for different filetypes
vim.cmd [[
  autocmd FileType json setlocal formatprg=prettier\ --parser\ json
  autocmd FileType html setlocal formatprg=prettier\ --parser\ html
]]

-- Fix dashboard conflict
vim.g.dashboard_disable_at_vimenter = 1

-- Configure treesitter
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "lua",
    "vim",
    "query",
    -- Add other languages you need
  },
  highlight = {
    enable = true,
  },
}
