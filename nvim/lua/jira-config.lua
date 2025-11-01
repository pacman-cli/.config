-- Jira Configuration
-- Copy this file and rename to jira-config.lua
-- Fill in your Jira credentials and uncomment the lines

return {
  -- REQUIRED: Your Jira instance URL (without trailing slash)
  jira_url = "https://sk1969363-1758355746781.atlassian.net/",

  -- REQUIRED: Your Jira username/email
  username = "mpuspo2310304@bscse.uiu.ac.bd",

  -- REQUIRED: Your Jira API token (generate at: https://id.atlassian.com/manage-profile/security/api-tokens)
  api_token = "ATATT3xFfGF0f-qOjVMSZNnLSqQFXvvptqMounpv272PEcV0Onmy8d36uxGa7VxF7X4ueqW5KwCP4kzFwypm6w28w0eV3Z-xOvBDJOvMhEv4t5zr-dYiMaXlOLCyf2J07OcNU2ber6HBa8LtKzRCALWyW3e0-BFce6CQlZqIcu0Jj4txCiXvvU0=4A7EA4D",

  -- OPTIONAL: Default project key
  default_project = "PROJECT",

  -- OPTIONAL: Default issue type
  default_issue_type = "Task",

  -- OPTIONAL: Custom fields mapping
  custom_fields = {},

  -- OPTIONAL: JQL queries for quick access
  saved_queries = {
    my_issues = "assignee = currentUser() AND status != Done",
    recent_issues = "updated >= -7d ORDER BY updated DESC",
    in_progress = "status = 'In Progress' AND assignee = currentUser()",
  },
}
