require("config.lazy")

vim.schedule(function()
	local variable_groups = {
		"@variable", "TSVariable", "Identifier"
	}
	for _, group in ipairs(variable_groups) do
		vim.api.nvim_set_hl(0, group, { fg = "#8c977d", bold = true })
	end
end)

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local variable_groups = { "@variable", "TSVariable", "Identifier" }
		for _, group in ipairs(variable_groups) do
			vim.api.nvim_set_hl(0, group, { fg = "#8c977d", bold = true })
		end
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
