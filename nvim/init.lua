require("config.lazy")

vim.schedule(function()
  local variable_groups = {
    "@variable",
    "TSVariable",
    "Identifier",
  }
  for _, group in ipairs(variable_groups) do
    vim.api.nvim_set_hl(0, group, { fg = "#8c977d", bold = false })
  end
  -- Remove italic from all keyword highlight groups
  local keyword_groups = {
    "@keyword",
    "TSKeyword",
    "Keyword",
    "Statement",
  }
  for _, group in ipairs(keyword_groups) do
    vim.api.nvim_set_hl(0, group, { italic = false })
  end
end)

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local variable_groups = { "@variable", "TSVariable", "Identifier" }
    for _, group in ipairs(variable_groups) do
      vim.api.nvim_set_hl(0, group, { fg = "#8c977d", bold = false })
    end
    -- Remove italic from all keyword highlight groups
    -- local keyword_groups = {
    --   "@keyword",
    --   "TSKeyword",
    --   "Keyword",
    --   "Statement",
    -- }
    -- for _, group in ipairs(keyword_groups) do
    --   vim.api.nvim_set_hl(0, group, { italic = false })
    -- end
  end,
})

-- Reapply Java highlights after LSP attaches (Treesitter/LSP can override earlier settings)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    if vim.bo[buf].filetype ~= "java" then
      return
    end
    vim.api.nvim_set_hl(0, "@lsp.type.class.java", { fg = "#64e0cf", bold = false })
    vim.api.nvim_set_hl(0, "@lsp.type.interface.java", { fg = "#64e0cf", bold = false })
    vim.api.nvim_set_hl(0, "@lsp.type.method.java", { fg = "#8F6BD6", bold = true })
    vim.api.nvim_set_hl(0, "@lsp.type.function.java", { fg = "#8F6BD6", bold = true })
    vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.declaration.java", { fg = "#0A5FB6" })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter.java", { fg = "#0A5FB6" })
    vim.cmd([[silent! syntax clear javaStringType]])
    vim.cmd([[syntax match javaStringType /\<String\>/ containedin=ALL]])
    vim.api.nvim_set_hl(0, "javaStringType", { fg = "#C792EA" })
  end,
})

-- Java-specific highlighting: Material Deep Ocean inspired color scheme
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    -- Keywords: Blue (strong contrast to class names)
    local keyword_groups = {
      "@keyword",
      "TSKeyword",
      "Keyword",
      "Statement",
    }
    for _, group in ipairs(keyword_groups) do
      vim.api.nvim_set_hl(0, group, { fg = "#82AAFF", italic = false })
    end

    -- Package and Import: Purple (#C792EA)
    vim.cmd([[
			syntax keyword javaPackageDecl package
			syntax keyword javaImportDecl import
			highlight javaPackageDecl guifg=#C792EA gui=NONE
			highlight javaImportDecl guifg=#C792EA gui=NONE
		]])

    -- Variables: Light gray
    local java_variable_groups = { "@variable", "TSVariable", "Identifier" }
    for _, group in ipairs(java_variable_groups) do
      vim.api.nvim_set_hl(0, group, { fg = "#B0B0B0", bold = false })
    end

    -- Field/Property names: Slightly lighter gray
    vim.api.nvim_set_hl(0, "@field", { fg = "#B8C0C2", bold = false })
    vim.api.nvim_set_hl(0, "@property", { fg = "#B8C0C2", bold = false })

    -- Functions/Methods/Constructors: Dark violet and bold (non-yellow)
    vim.api.nvim_set_hl(0, "@function", { fg = "#8F6BD6", bold = false })
    vim.api.nvim_set_hl(0, "@function.method", { fg = "#8F6BD6", bold = false })
    vim.api.nvim_set_hl(0, "@function.constructor", { fg = "#8F6BD6", bold = false })
    vim.api.nvim_set_hl(0, "Function", { fg = "#8F6BD6", bold = false })

    -- Numbers: Light blue/cyan (same as keywords)
    vim.api.nvim_set_hl(0, "@number", { fg = "#89ddf3" })
    vim.api.nvim_set_hl(0, "Number", { fg = "#89ddf3" })

    -- Parameters: Brighter blue (#0A5FB6)
    vim.api.nvim_set_hl(0, "@parameter", { fg = "#0A5FB6" })

    -- Strings: Yellow/orange
    vim.api.nvim_set_hl(0, "@string", { fg = "#ffcc66" })
    vim.api.nvim_set_hl(0, "String", { fg = "#ffcc66" })

    -- Visibility keywords: Light blue/cyan (same as keywords)
    vim.cmd([[
			syntax keyword javaVisibilityPublic public
			syntax keyword javaVisibilityPrivate private
			syntax keyword javaVisibilityProtected protected
			highlight javaVisibilityPublic guifg=#89ddf3 gui=NONE
			highlight javaVisibilityPrivate guifg=#89ddf3 gui=NONE
			highlight javaVisibilityProtected guifg=#89ddf3 gui=NONE
		]])

    -- Classes and Interfaces: Green and bold for clear separation
    vim.api.nvim_set_hl(0, "@type", { fg = "#7EE787", bold = false })
    vim.api.nvim_set_hl(0, "Type", { fg = "#7EE787", bold = false })
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#7EE787", bold = false })
    vim.api.nvim_set_hl(0, "@type.class", { fg = "#7EE787", bold = true })
    vim.api.nvim_set_hl(0, "@type.interface", { fg = "#7EE787", bold = true })
    -- LSP semantic tokens for classes/interfaces (ensure override when jdtls is active)
    vim.api.nvim_set_hl(0, "@lsp.type.class.java", { fg = "#7EE787", bold = true })
    vim.api.nvim_set_hl(0, "@lsp.type.interface.java", { fg = "#7EE787", bold = true })

    -- Distinguish common Java type token 'String' from other class names
    vim.cmd([[silent! syntax clear javaStringType]])
    vim.cmd([[syntax match javaStringType /\<String\>/ containedin=ALL]])
    vim.api.nvim_set_hl(0, "javaStringType", { fg = "#C792EA" })

    -- Annotations: Red (prominent red as shown in images)
    vim.api.nvim_set_hl(0, "@attribute", { fg = "#ff6b6b", bold = false })
    vim.cmd([[
			syntax match javaAnnotation /@\w\+/
			highlight javaAnnotation guifg=#ff6b6b gui=NONE
		]])

    -- Comments: Faded green-grey
    vim.api.nvim_set_hl(0, "@comment", { fg = "#7f8c8d" })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#7f8c8d" })

    -- Braces and Operators: White
    vim.api.nvim_set_hl(0, "@operator", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "Operator", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#ffffff" })
  end,
})

-- Transparency settings for Ghosty terminal compatibility
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Make background transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SpecialKey", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
  end,
})

-- Apply transparency immediately
vim.schedule(function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "SpecialKey", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
end)
