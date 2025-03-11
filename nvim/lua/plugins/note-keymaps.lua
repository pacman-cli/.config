return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>n"] = { name = "Notes" },
        -- Markdown Preview
        ["<leader>np"] = { "<cmd>MarkdownPreview<cr>", "Preview Markdown" },
        ["<leader>nP"] = { "<cmd>MarkdownPreviewStop<cr>", "Stop Preview" }, -- Changed ns to nP
        -- Obsidian additional keymaps
        ["<leader>ni"] = { "<cmd>ObsidianTemplate<cr>", "Insert Template" }, -- Changed nt to ni
        ["<leader>nS"] = { "<cmd>ObsidianSearch<cr>", "Search Notes" }, -- Changed ns to nS
        ["<leader>nl"] = { "<cmd>ObsidianLink<cr>", "Create Link" },
        ["<leader>no"] = { "<cmd>ObsidianOpen<cr>", "Open in Obsidian" },
        ["<leader>nb"] = { "<cmd>ObsidianBacklinks<cr>", "Show Backlinks" },
        ["<leader>nT"] = { "<cmd>ObsidianTags<cr>", "Search Tags" }, -- Changed nt to nT
      },
    },
  },
}
