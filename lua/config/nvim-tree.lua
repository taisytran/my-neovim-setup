local function my_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split')) -- Custom mapping for vertical split
  vim.keymap.set('n', '-', ':NvimTreeToggle<CR>', opts('Toggle NvimTree')) -- Custom mapping to toggle NvimTree
  vim.keymap.set('n', '<S-R>', api.tree.reload, opts('Reload')) -- Custom mapping for Shift + R to reload
end

-- Configure nvim-tree
require'nvim-tree'.setup {
  on_attach = my_on_attach, -- Use custom on_attach function
  -- disable_netrw       = true,
  -- hijack_netrw        = true,
  auto_reload_on_write = true,
  -- update_cwd          = true,
  -- diagnostics = {
  --   enable = true,
  --   show_on_dirs = true,
  --   icons = {
  --     hint = "",
  --     info = "",
  --     warning = "",
  --     error = "",
  --   },
  -- },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
}

-- Set the key mapping to toggle nvim-tree globally in Neovim
vim.api.nvim_set_keymap('n', '-', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>N', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
