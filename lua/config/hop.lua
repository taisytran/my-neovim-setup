-- EasyMotion configuration for Hop.nvim
require'hop'.setup()
vim.api.nvim_set_keymap('n', '<Leader><Leader>f', "<cmd>lua require'hop'.hint_char1()<cr>", {})

vim.api.nvim_set_keymap('n', '\\w', ":HopWord<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '\\w', ":HopWord<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', '\\w', ":HopWord<CR>", { noremap = true, silent = true })
