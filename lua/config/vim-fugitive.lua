vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true, silent = true })

-- Define an alias :Gblame to run :Git blame
vim.api.nvim_command('command! Gblame Git blame')
