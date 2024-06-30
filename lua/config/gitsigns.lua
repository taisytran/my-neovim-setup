-- config/gitsigns.lua
require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
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
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  word_diff = false,
}

-- Define highlights for GitSigns
vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDeleteChange' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitGutterDeleteChange' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitGutterDeleteChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChangeDelete' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitGutterChangeDelete' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitGutterChangeDelete' })
