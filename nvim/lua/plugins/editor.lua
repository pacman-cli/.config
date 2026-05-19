return {
  -- LazyGit integration
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Terminal management
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({})
      vim.keymap.set("n", "<leader>ft", function()
        require("toggleterm").toggle(1, nil, nil, "float")
      end, { desc = "Floating Terminal" })
    end,
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview", ft = "markdown" },
      { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Preview Stop", ft = "markdown" },
      { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview Toggle", ft = "markdown" },
    },
  },

  -- Markdown rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante" },
    opts = { file_types = { "markdown", "Avante" } },
  },

  -- WakaTime
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  -- Performance profiling
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
}
