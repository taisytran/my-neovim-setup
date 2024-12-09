require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
    separator_style = "slant",
    -- diagnostics = "nvim_lsp",
    diagnostics = false,
  }
})


vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>q', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>c', ':BufferLineCloseOthers<CR>', { noremap = true, silent = true })

