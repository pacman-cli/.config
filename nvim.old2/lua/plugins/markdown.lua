return {
  {
    "iamcco/markdown-preview.nvim",
    event = "User AstroFile",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    opts = function()
      return {
        mkdp_auto_start = 0,
        mkdp_auto_close = 1,
        mkdp_refresh_slow = 0,
        mkdp_command_for_global = 0,
        mkdp_open_to_the_world = 0,
        mkdp_browser = "",
        mkdp_echo_preview_url = 1,
        mkdp_preview_options = {
          mkit = {},
          katex = {},
          uml = {},
          maid = {},
          disable_sync_scroll = 0,
          sync_scroll_type = "middle",
          hide_yaml_meta = 1,
          sequence_diagrams = {},
          flowchart_diagrams = {},
          content_editable = false,
          disable_filename = 0,
        },
        mkdp_markdown_css = "",
        mkdp_highlight_css = "",
        mkdp_port = "",
        mkdp_page_title = "「${name}」",
        mkdp_theme = "dark"
      }
    end,
    config = function(_, opts)
      for k, v in pairs(opts) do
        vim.g[k] = v
      end
      vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Start Markdown Preview" })
      vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop Markdown Preview" })
    end,
  },
}
