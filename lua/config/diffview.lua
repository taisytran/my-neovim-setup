-- lua/config/diffview.lua
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  use_icons = true,         -- Requires nvim-web-devicons
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  view = {
    -- default = {
    --   layout = "diff3_mixed",  -- Use the three-way diff layout
    --   winbar_info = true,      -- Show file info in the winbar
    -- },
    merge_tool = {
      -- Config for changed files, and staged files in diff views.
      layout = "diff3_mixed",
      winbar_info = true,
    },
    file_history = {
      -- Config for changed files in file history views.
      layout = "diff2_horizontal",
      winbar_info = false,          -- See ':h diffview-config-view.x.winbar_info'
    },
  },
  key_bindings = {
    view = {
      ["<tab>"] = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"] = cb("select_prev_entry"),  -- Open the diff for the previous file
      -- ["gf"] = cb("goto_file"),      -- Open the file in a new split in the previous tabpage
      -- ["<C-w><C-f>"] = cb("goto_file_split"),  -- Open the file in a new split
      -- ["<C-w>gf"] = cb("goto_file_tab"),    -- Open the file in a new tabpage
      -- ["<leader>e"] = cb("focus_files"),    -- Bring focus to the files panel
      -- ["<leader>b"] = cb("toggle_files"),   -- Toggle the files panel.
    },
    file_panel = {
      -- ["j"] = cb("next_entry"),      -- Bring the cursor to the next file entry
      -- ["<down>"] = cb("next_entry"),
      -- ["k"] = cb("prev_entry"),      -- Bring the cursor to the previous file entry.
      -- ["<up>"] = cb("prev_entry"),
      -- ["<cr>"] = cb("select_entry"),   -- Open the diff for the selected entry.
      -- ["o"] = cb("select_entry"),
      -- ["R"] = cb("refresh_files"),    -- Update stats and entries in the file list.
      ["<tab>"] = cb("select_next_entry"),
      ["<s-tab>"] = cb("select_prev_entry"),
      -- ["gf"] = cb("goto_file"),
      -- ["<C-w><C-f>"] = cb("goto_file_split"),
      -- ["<C-w>gf"] = cb("goto_file_tab"),
      -- ["i"] = cb("listing_style"),    -- Toggle between 'list' and 'tree' views
      -- ["f"] = cb("toggle_flatten_dirs"),  -- Flatten empty subdirectories in tree listing style.
      -- ["<leader>e"] = cb("focus_files"),
      -- ["<leader>b"] = cb("toggle_files"),
    },
    file_history_panel = {
      -- ["g!"] = cb("options"),      -- Open the option panel
      -- ["<C-A-d>"] = cb("open_in_diffview"),  -- Open the entry under the cursor in a diffview
      -- ["y"] = cb("copy_hash"),     -- Copy the commit hash of the entry under the cursor
      -- ["zR"] = cb("open_all_folds"),
      -- ["zM"] = cb("close_all_folds"),
      -- ["j"] = cb("next_entry"),
      -- ["<down>"] = cb("next_entry"),
      -- ["k"] = cb("prev_entry"),
      -- ["<up>"] = cb("prev_entry"),
      -- ["<cr>"] = cb("select_entry"),
      -- ["o"] = cb("select_entry"),
      ["<tab>"] = cb("select_next_entry"),
      ["<s-tab>"] = cb("select_prev_entry"),
      -- ["gf"] = cb("goto_file"),
      -- ["<C-w><C-f>"] = cb("goto_file_split"),
      -- ["<C-w>gf"] = cb("goto_file_tab"),
      -- ["<leader>e"] = cb("focus_files"),
      -- ["<leader>b"] = cb("toggle_files"),
    },
    option_panel = {
      ["<tab>"] = cb("select"),
      ["q"] = cb("close"),
    },
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
}
