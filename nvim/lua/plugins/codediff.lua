-- Helper functions for advanced diffing
local stored_selection = nil

local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  if #lines == 0 then return {} end
  return lines
end

local function diff_clipboard()
  local clipboard_content = vim.fn.getreg('+')
  if clipboard_content == "" then clipboard_content = vim.fn.getreg('*') end
  if clipboard_content == "" then
    vim.notify("Clipboard is empty!", vim.log.levels.WARN, { title = "CodeDiff" })
    return
  end

  local temp_path = vim.fn.tempname()
  local ext = vim.fn.expand('%:e')
  if ext ~= "" then temp_path = temp_path .. "." .. ext end

  local lines = vim.split(clipboard_content, "\n")
  local f = io.open(temp_path, "w")
  if f then
    for _, line in ipairs(lines) do f:write(line .. "\n") end
    f:close()
  end

  local current_file = vim.fn.expand('%:p')
  if current_file == "" then
    local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    current_file = vim.fn.tempname() .. "_current"
    if ext ~= "" then current_file = current_file .. "." .. ext end
    local cf = io.open(current_file, "w")
    if cf then
      for _, l in ipairs(buf_lines) do cf:write(l .. "\n") end
      cf:close()
    end
  end

  vim.cmd(string.format("CodeDiff file %s %s", vim.fn.fnameescape(temp_path), vim.fn.fnameescape(current_file)))
  vim.defer_fn(function()
    pcall(vim.fn.delete, temp_path)
    if current_file ~= vim.fn.expand('%:p') then
      pcall(vim.fn.delete, current_file)
    end
  end, 1000)
  vim.notify("Diffing against Clipboard", vim.log.levels.INFO, { title = "CodeDiff" })
end

local function store_selection()
  vim.cmd('noau normal! ' .. vim.keycode('<Esc>'))
  stored_selection = get_visual_selection()
  vim.notify("Selection stored (" .. #stored_selection .. " lines)", vim.log.levels.INFO, { title = "CodeDiff" })
end

local function diff_with_stored()
  if not stored_selection then
    vim.notify("No selection stored! Use <leader>cds first.", vim.log.levels.WARN, { title = "CodeDiff" })
    return
  end

  vim.cmd('noau normal! ' .. vim.keycode('<Esc>'))
  local current_selection = get_visual_selection()

  local t1 = vim.fn.tempname() .. "_stored"
  local t2 = vim.fn.tempname() .. "_current"
  local ext = vim.fn.expand('%:e')
  if ext ~= "" then
    t1 = t1 .. "." .. ext
    t2 = t2 .. "." .. ext
  end

  local f1 = io.open(t1, "w")
  if f1 then
    for _, l in ipairs(stored_selection) do f1:write(l .. "\n") end
    f1:close()
  end

  local f2 = io.open(t2, "w")
  if f2 then
    for _, l in ipairs(current_selection) do f2:write(l .. "\n") end
    f2:close()
  end

  vim.cmd(string.format("CodeDiff file %s %s", vim.fn.fnameescape(t1), vim.fn.fnameescape(t2)))
  vim.defer_fn(function()
    pcall(vim.fn.delete, t1)
    pcall(vim.fn.delete, t2)
  end, 1000)
end

-- Plugin Spec
return {
  "esmuellert/codediff.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  cmd = { "CodeDiff" },
  keys = {
    { "<leader>cdg", function() vim.cmd("CodeDiff file") end, desc = "CodeDiff: Diff file vs Git" },
    { "<leader>cdf", function()
        vim.ui.input({ prompt = "File to compare: ", completion = "file" }, function(input)
          if input and input ~= "" then vim.cmd("CodeDiff file " .. input) end
        end)
      end, desc = "CodeDiff: Compare file..."
    },
    { "<leader>cdc", diff_clipboard, desc = "CodeDiff: Diff with Clipboard" },
    { "<leader>cds", store_selection, mode = "v", desc = "CodeDiff: Store selection" },
    { "<leader>cdd", diff_with_stored, mode = "v", desc = "CodeDiff: Diff with stored block" },
  },
  opts = {
    highlights = {
      line_insert = "DiffAdd",
      line_delete = "DiffDelete",
    },
    diff = {
      disable_inlay_hints = true,
      max_computation_time_ms = 5000,
    },
    explorer = {
      position = "left",
      width = 35,
      icons = {
        folder_closed = "📁",
        folder_open = "📂",
      },
      keymaps = {
        select = "<CR>",
      },
    },
    keymaps = {
      view = {
        quit = "q",
        next_hunk = "]c",
        prev_hunk = "[c",
      },
    },
  },
}
