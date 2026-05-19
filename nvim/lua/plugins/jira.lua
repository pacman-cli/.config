-- Jira integration
return {
  {
    "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>jo", "<cmd>JiraOpen<cr>", desc = "Open Jira Issue" },
      { "<leader>js", "<cmd>JiraSearch<cr>", desc = "Search Jira" },
      { "<leader>jm", "<cmd>JiraMyIssues<cr>", desc = "My Jira Issues" },
    },
    config = function()
      local ok, jira_config = pcall(require, "jira-config")
      local base_url = ok and jira_config.jira_url or "https://your-company.atlassian.net"
      -- Ensure trailing slash is handled
      base_url = base_url:gsub("/$", "")

      vim.api.nvim_create_user_command("JiraOpen", function(opts)
        local issue_key = opts.args
        if issue_key == "" then
          issue_key = vim.fn.input("Enter Jira issue key: ")
        end
        if issue_key ~= "" then
          local url = base_url .. "/browse/" .. issue_key
          vim.ui.open(url)
        end
      end, { nargs = "?" })

      vim.api.nvim_create_user_command("JiraSearch", function()
        local query = vim.fn.input("Enter JQL query: ")
        if query ~= "" then
          local url = base_url .. "/issues/?jql=" .. vim.uri_encode(query)
          vim.ui.open(url)
        end
      end, {})

      vim.api.nvim_create_user_command("JiraMyIssues", function()
        local url = base_url .. "/issues/?filter=-1"
        vim.ui.open(url)
      end, {})
    end,
  },
}
