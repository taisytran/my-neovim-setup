require('noice').setup({
  lsp = {
    progress = {
      enabled = true,
      -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
      -- See the section on formatting for more details on how to customize.
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 1000 / 30, -- frequency to update lsp progress message
      view = "mini",
    },
    override = {
      -- override the default lsp markdown formatter with Noice
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      -- override the lsp markdown formatter with Noice
      ["vim.lsp.util.stylize_markdown"] = true,
      -- override cmp documentation with Noice (needs the other options to work)
      ["cmp.entry.get_documentation"] = true,
      -- ["vim.lsp.util.open_floating_preview"] = true,
    },
    hover = {
      enabled = true,
      silent = false, -- set to true to not show a message if hover is not available
      view = nil, -- when nil, use defaults from documentation
      opts = {}, -- merged with defaults from documentation
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
        luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
        throttle = 50, -- Debounce lsp signature help request by 50ms
      },
      view = nil, -- when nil, use defaults from documentation
      opts = {}, -- merged with defaults from documentation
    },
    message = {
      -- Messages shown by lsp servers
      enabled = true,
      view = "notify",
      opts = {},
    },
    -- defaults for hover and signature help
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },
  },
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  -- cmdline = {
  --   view = "cmdline", -- Use the default cmdline view at the bottom
  -- },
  messages = {
    enabled = true,
    view = "notify",
    view_warn = "mini",
    view_error = "notify",
    filter = {
      { find = "E%d+:%s+" },  -- Example regex to match error messages
    },
  },
  -- messages = {
  --   -- NOTE: If you enable messages, then the cmdline is enabled automatically.
  --   -- This is a current Neovim limitation.
  --   enabled = true, -- enables the Noice messages UI
  --   view = "notify", -- default view for messages
  --   view_error = "notify", -- view for errors
  --   view_warn = "notify", -- view for warnings
  --   view_history = "messages", -- view for :messages
  --   view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  -- },
  popupmenu = {
    enabled = true,
    backend = "nui",
  },
  notify = {
    enabled = true,
    view = "notify",
    replace = true,
    merge = true
  },
  redirect = {
    view = "popup",
    filter = { event = "msg_show" },
  },
  -- Ensure popup cmdline does not show in the middle
  views = {
    cmdline_popup = {
      position = {
        row = "50%", -- Position at the bottom
        col = "50%", -- Centered horizontally
      },
      size = {
        width = "auto",
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 8,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",  -- This filters only echo messages.
        find = "written",
      },
      view = "mini",
    },
    {
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
      },
      opts = { skip = true },
    },
    -- {
    --   filter = {
    --     event = "msg_show",
    --     kind = "echo",
    --     pattern = "Pattern not found",  -- Adjust the pattern if needed
    --   },
    --   view = "notify",
    --   opts = {
    --     replace = true,
    --     merge = true,
    --   },
    -- },
  },
})
