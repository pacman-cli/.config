return {
  "epwalsh/obsidian.nvim",
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/Documents/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Documents/**.md",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian Vault", -- Change this to your vault path
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    new_notes_location = "current_dir",
    wiki_link_func = function(opts)
      if opts.id == nil then
        return string.format("[[%s]]", opts.label)
      elseif opts.label ~= opts.id then
        return string.format("[[%s|%s]]", opts.id, opts.label)
      else
        return string.format("[[%s]]", opts.id)
      end
    end,
    mappings = {
      -- Overwrite the default mappings
      ["<leader>on"] = {
        action = function() return require("obsidian").new_note() end,
        opts = { desc = "New Obsidian note" },
      },
      ["<leader>of"] = {
        action = function() return require("obsidian").find_notes() end,
        opts = { desc = "Find Obsidian notes" },
      },
      ["<leader>ob"] = {
        action = function() return require("obsidian").show_backlinks() end,
        opts = { desc = "Show Obsidian backlinks" },
      },
    },
  },
}
