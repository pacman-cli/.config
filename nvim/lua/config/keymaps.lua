vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
-- Neo-tree explorer keymaps
vim.keymap.set('n', '<leader>E', function()
	require('neo-tree.command').execute({ source = 'filesystem', dir = vim.fn.getcwd(), reveal = true, toggle = true, position = 'left', cwd = '/' })
end, { desc = 'Neo-tree Explorer (Root Dir)' })
vim.keymap.set('n', '<leader>e', function()
	require('neo-tree.command').execute({ source = 'filesystem', dir = vim.fn.getcwd(), reveal = true, toggle = true, position = 'left' })
end, { desc = 'Neo-tree Explorer (CWD)' })
