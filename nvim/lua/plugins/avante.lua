-- Avante.nvim — Cursor-like AI coding assistant
-- https://github.com/yetone/avante.nvim
--
-- Keymaps (set automatically by avante):
--   <leader>aa  — Ask AI about current code / open sidebar
--   <leader>ae  — Edit selected code with AI
--   <leader>ar  — Refresh AI response
--   <leader>af  — Focus the Avante sidebar
--   <leader>at  — Toggle the Avante sidebar
--
-- Commands:
--   :AvanteAsk [question]    — Ask the AI a question
--   :AvanteChat              — Open chat mode
--   :AvanteClear             — Clear chat history
--   :AvanteToggle            — Toggle sidebar
--   :AvanteSwitchProvider    — Switch AI provider
--   :AvanteModels            — List available models
--
-- API Keys (set in your shell profile):
--   Claude:  export ANTHROPIC_API_KEY=your-key
--   OpenAI:  export OPENAI_API_KEY=your-key
--   Gemini:  export GEMINI_API_KEY=your-key

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this to "*"! Always use latest git commit.
    -- Build the native Rust tokenizer (requires cargo, or uses prebuilt binary via curl/tar)
    build = "make",
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- Default AI provider
      provider = "claude",

      -- Interaction mode: "agentic" uses tools for automatic code gen, "legacy" uses planning
      mode = "agentic",

      -- Provider configurations
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-20250514",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
      },

      -- Behaviour settings
      behaviour = {
        auto_suggestions = false, -- Experimental; enable later if desired
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true,
        enable_token_counting = true,
        auto_add_current_file = true,
      },

      -- Key mappings (defaults shown — customize as needed)
      mappings = {
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        cancel = {
          normal = { "<C-c>", "<Esc>", "q" },
          insert = { "<C-c>" },
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          retry_user_request = "r",
          edit_user_request = "e",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
          remove_file = "d",
          add_file = "@",
          close = { "<Esc>", "q" },
        },
      },

      -- Sidebar window settings
      windows = {
        position = "right",
        wrap = true,
        width = 30,
        sidebar_header = {
          enabled = true,
          align = "center",
          rounded = true,
        },
        input = {
          prefix = "> ",
          height = 8,
        },
        edit = {
          border = "rounded",
          start_insert = true,
        },
        ask = {
          floating = false,
          start_insert = true,
          border = "rounded",
          focus_on_apply = "ours",
        },
      },

      -- Diff settings
      diff = {
        autojump = true,
        list_opener = "copen",
        override_timeoutlen = 500,
      },
    },

    -- Required and optional dependencies
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- File selector providers (telescope already in your config)
      "nvim-telescope/telescope.nvim",
      -- Completion for avante commands and mentions
      "hrsh7th/nvim-cmp",
      -- Icons
      "nvim-tree/nvim-web-devicons",
      -- Image pasting support
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
    },
  },
}
