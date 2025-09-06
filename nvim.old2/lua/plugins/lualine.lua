return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  opts = function(_, opts)
    local gitsigns = function()
      local git_status = vim.b.gitsigns_status_dict
      if git_status then
        return string.format("+%s ~%s -%s", git_status.added or 0, git_status.changed or 0, git_status.removed or 0)
      end
      return ""
    end

    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        {
          gitsigns,
          icon = "", -- Icon for Git signs
          cond = function() return vim.b.gitsigns_status_dict ~= nil end,
        },
        "diff",
        "diagnostics",
      },
      lualine_c = { "filename" },
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype",
        {
          function()
            local lazy_status = require "lazy.status"
            if lazy_status.has_updates() then return lazy_status.updates() end
            return ""
          end,
          icon = "󰚰 ", -- Icon for Lazy updates
          color = { fg = "#ff9e64" },
        },
        {
          function()
            local registry = require "mason-registry"
            local installed = registry.get_installed_packages()
            local total = #installed
            local pending_updates = 0

            for _, pkg in ipairs(installed) do
              if pkg.name and registry.is_installed(pkg.name) then
                local ok, has_new = pcall(function() return pkg:check_new_version() end)
                if ok and has_new then pending_updates = pending_updates + 1 end
              end
            end

            if pending_updates > 0 then
              return string.format("%d/%d", pending_updates, total)
            elseif total > 0 then
              return tostring(total)
            end
            return ""
          end,
          icon = "󰏔 ", -- Icon for Mason
          color = function()
            local registry = require "mason-registry"
            local installed = registry.get_installed_packages()
            local has_updates = false

            for _, pkg in ipairs(installed) do
              if pkg.name and registry.is_installed(pkg.name) then
                local ok, has_new = pcall(function() return pkg:check_new_version() end)
                if ok and has_new then
                  has_updates = true
                  break
                end
              end
            end

            return has_updates and { fg = "#ff9e64" } or { fg = "#98be65" }
          end,
        },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }

    opts.options = {
      theme = "auto", -- Automatically adapt theme
      icons_enabled = true,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    }
    return opts
  end,
}
