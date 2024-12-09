-- Set Python 3 provider
vim.g.python3_host_prog = vim.fn.trim(vim.fn.system('which python3'))

-- Disable Perl provider (optional)
vim.g.loaded_perl_provider = 0

-- Vim git fugitive
vim.g.fugitive_hg_cmd = 'hg'

-- Essential settings
vim.opt.encoding = 'utf-8'
--vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8, latin1' }
vim.opt.compatible = false
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.background = 'dark'

vim.g.mapleader = ' '

vim.opt.clipboard = 'unnamedplus'

-- Copy to the system clipboard in visual mode
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
-- Paste from the system clipboard in normal mode
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
-- Paste from the system clipboard in visual mode
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })
-- Copy the current line to the system clipboard in normal mode
vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true, silent = true })
-- Paste without auto-indenting
vim.api.nvim_set_keymap('n', 'P', ':set paste<CR>"+P:set nopaste<CR>', { noremap = true, silent = true })

-- Use the system clipboard for all yank, delete, change, and put operations
-- vim.opt.clipboard = 'unnamedplus'


-- Yank current line to system clipboard
-- vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true })

-- Paste from system clipboard
-- vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'P', '"+P', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'P', '"+P', { noremap = true })

-- Pane navigation mappings
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })

-- Enable search highlighting
vim.opt.hlsearch = true
-- Make search case insensitive unless it contains uppercase characters
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Enable incremental search
vim.opt.incsearch = true

vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR><Esc>', { noremap = true })

-- Shift + Arrow keys mappings (placeholders)
vim.api.nvim_set_keymap('n', '<S-Left>', '...', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Right>', '...', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Up>', '...', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Down>', '...', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-Left>', '...', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-Right>', '...', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-Up>', '...', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-Down>', '...', { noremap = true })

-- Automatically reload the file if it changed outside of Neovim and notify
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
  command = "checktime",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
})

vim.api.nvim_create_user_command('Path', function()
  local filepath = vim.fn.expand("%:.")
  vim.fn.setreg('+', filepath)
  print(filepath)

  require('noice').notify(filepath, 'info', { title = 'File Path (Copied)' })
end, {})

vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabnext<CR>', { noremap = true, silent = true })
