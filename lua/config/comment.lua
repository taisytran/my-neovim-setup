-- Comment.nvim configuration
-- Keybinds: <leader>/ to toggle comment

require('Comment').setup({
  toggler = {
    line = '<leader>/',
    block = '<leader>bc',
  },
  opleader = {
    line = '<leader>/',
    block = '<leader>b',
  },
})

-- Additional keybindings for visual mode using modern API
vim.keymap.set('v', '<leader>/', function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true, desc = "Toggle comment in visual mode" })
