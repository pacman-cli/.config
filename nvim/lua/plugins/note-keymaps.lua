return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>n"] = { name = "Notes" },
        -- Markdown Preview
        ["<leader>np"] = { "<cmd>MarkdownPreview<cr>", "Preview Markdown" },
        ["<leader>ns"] = { "<cmd>MarkdownPreviewStop<cr>", "Stop Preview" },
        -- Obsidian additional keymaps
        ["<leader>nt"] = { "<cmd>ObsidianTemplate<cr>", "Insert Template" },
        ["<leader>ns"] = { "<cmd>ObsidianSearch<cr>", "Search Notes" },
        ["<leader>nl"] = { "<cmd>ObsidianLink<cr>", "Create Link" },
        ["<leader>no"] = { "<cmd>ObsidianOpen<cr>", "Open in Obsidian" },
        ["<leader>nb"] = { "<cmd>ObsidianBacklinks<cr>", "Show Backlinks" },
        ["<leader>nt"] = { "<cmd>ObsidianTags<cr>", "Search Tags" },
        -- Changed conflicting mappings
        ["<leader>nS"] = { "<cmd>ObsidianSearch<cr>", "Search Notes" }, -- Changed ns to nS
        ["<leader>nT"] = { "<cmd>ObsidianTags<cr>", "Search Tags" }, -- Changed nt to nT
      },
    },
  },
}
