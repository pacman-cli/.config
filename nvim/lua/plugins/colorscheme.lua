-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     opts = {
--       flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
--       background = { light = "latte", dark = "mocha" },
--       transparent_background = true,
--       term_colors = true,
--       dim_inactive = {
--         enabled = true,
--         shade = "dark",
--         percentage = 0.15,
--       },
--       styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = { "italic" },
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = { "italic" },
--         properties = {},
--         types = {},
--         operators = {},
--       },
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         treesitter = true,
--         notify = true,
--         mini = false,
--         native_lsp = {
--           enabled = true,
--           virtual_text = {
--             errors = { "italic" },
--             hints = { "italic" },
--             warnings = { "italic" },
--             information = { "italic" },
--           },
--           underlines = {
--             errors = { "underline" },
--             hints = { "underline" },
--             warnings = { "underline" },
--             information = { "underline" },
--           },
--         },
--       },
--       color_overrides = {},
--       custom_highlights = {},
--     },
--   },
-- }
--
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- dark theme variant
      background = {
        dark = "mocha",
      },
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.20,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      integrations = {
        telescope = true,
        treesitter = true,
        cmp = true,
        gitsigns = true,
        mason = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
        },
      },
    },
  },
}
