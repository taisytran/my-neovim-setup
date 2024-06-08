-- config/gitsigns.lua
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitGutterAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitGutterChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitGutterDeleteChange', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitGutterChangeDelete', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Custom mappings
    map('n', '<leader>hu', gs.reset_hunk, { desc = "Reset Hunk" }) -- Leader + hu to reset hunk
  end,
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  word_diff = false,
  use_internal_diff = true,
}

-- Keymap setup for gitsigns
-- vim.api.nvim_set_keymap('n', '<space>hu', '<cmd>lua require"gitsigns".reset_hunk()<CR>', { noremap = true, silent = true })
