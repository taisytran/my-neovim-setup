local function my_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split')) -- Custom mapping for vertical split
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '-', ':NvimTreeToggle<CR>', opts('Toggle NvimTree')) -- Custom mapping to toggle NvimTree
  vim.keymap.set('n', '<S-R>', api.tree.reload, opts('Reload')) -- Custom mapping for Shift + R to reload
end

-- Configure nvim-tree
require('nvim-tree').setup({
  on_attach = my_on_attach, -- Use custom on_attach function
})

-- Set the key mapping to toggle nvim-tree globally in Neovim
vim.api.nvim_set_keymap('n', '-', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>N', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
