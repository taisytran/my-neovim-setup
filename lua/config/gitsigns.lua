-- config/gitsigns.lua
require('gitsigns').setup {
  signs = {
    add          = { text = '▎' },
    change       = { text = '▎' },
    delete       = { text = '' },
    topdelete    = { text = '' },
    changedelete = { text = '▎' },
    untracked    = { text = '▎' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.nav_hunk("next") end)
      return '<Ignore>'
    end, { expr = true, desc = "Next Hunk" })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.nav_hunk("prev") end)
      return '<Ignore>'
    end, { expr = true, desc = "Prev Hunk" })

    -- Actions
    map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage Hunk" })
    map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset Hunk" })
    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage Hunk" })
    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset Hunk" })
    map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage Buffer" })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
    map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset Buffer" })
    map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview Hunk" })
    map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Blame Line" })
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle Blame" })
    map('n', '<leader>hd', gs.diffthis, { desc = "Diff This" })
    map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff This (previous)" })
    map('n', '<leader>td', gs.preview_hunk_inline, { desc = "Preview Hunk Inline" })

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select Hunk" })
  end,
  watch_gitdir = {
    follow_files = true
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
  },
  current_line_blame_formatter = ' <author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  word_diff = false,
}
