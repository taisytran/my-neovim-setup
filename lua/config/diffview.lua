local actions = require("diffview.actions")

require("diffview").setup({
  diff_binaries = false,
  use_icons = true,
  enhanced_diff_hl = false,
  view = {
    merge_tool = { layout = "diff3_mixed", winbar_info = true },
    file_history = { layout = "diff2_horizontal", winbar_info = false },
  },
  -- Tab navigation in view and panels is already provided by the defaults.
  keymaps = {
    option_panel = {
      { "n", "<Tab>", actions.select_entry, { desc = "Select option" } },
      { "n", "q", actions.close, { desc = "Close panel" } },
    },
  },
})
