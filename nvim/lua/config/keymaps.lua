vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
-- Neo-tree explorer keymaps
vim.keymap.set("n", "<leader>E", function()
  require("neo-tree.command").execute({
    source = "filesystem",
    toggle = true,
    reveal = true,
    reveal_force_cwd = true,
  })
end, { desc = "Neo-tree Explorer (Reveal Current File)" })
vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({ source = "filesystem", toggle = true })
end, { desc = "Neo-tree Explorer Toggle" })

-- Code actions and hover
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
