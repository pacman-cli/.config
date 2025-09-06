-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- -- Cursor movement optimizations
-- vim.opt.ttyfast = true  -- Enable fast terminal connection
-- vim.opt.updatetime = 100  -- Faster update time
-- vim.opt.timeout = true
-- vim.opt.timeoutlen = 300  -- Faster key sequence completion
-- vim.opt.ttimeoutlen = 10  -- Very short waiting time for key code sequences
--
-- -- Enable transparency
-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
--
-- -- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
vim.opt.wrap = true
vim.opt.linebreak = true  -- Prevents line breaks in the middle of words
vim.opt.ttyfast = true -- Enable fast terminal connection
vim.opt.updatetime = 100 -- Faster update time
vim.opt.timeout = true
vim.opt.timeoutlen = 300 -- Faster key sequence completion
vim.opt.ttimeoutlen = 10 -- Very short waiting time for key code sequences

-- Enable transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- Enable italics for function names
-- vim.api.nvim_set_hl(0, "@function", { italic = true })
-- vim.api.nvim_set_hl(0, "Function", { italic = true })

-- Italicize more elements for an aesthetic look
vim.api.nvim_set_hl(0, "@function", { italic = true }) -- Function names
vim.api.nvim_set_hl(0, "@method", { italic = true }) -- Methods
vim.api.nvim_set_hl(0, "Function", { italic = true }) -- Standard function highlight
-- vim.api.nvim_set_hl(0, "@keyword", { italic = true }) -- Keywords (if, else, return, etc.)
vim.api.nvim_set_hl(0, "@comment", { italic = true }) -- Comments
-- vim.api.nvim_set_hl(0, "@parameter", { italic = true }) -- Function parameters
-- vim.api.nvim_set_hl(0, "Type", { italic = true }) -- Type definitions
-- vim.api.nvim_set_hl(0, "StorageClass", { italic = true }) -- static, extern, etc.
