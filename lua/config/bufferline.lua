-- Bufferline configuration
-- Navigation: <S-Tab> to cycle next, <Tab>q to pick close

require("bufferline").setup({
  options = {
    mode = "buffers",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
    separator_style = "slant",
    diagnostics = false,
  }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCycleNext<cr>', opts)
vim.keymap.set('n', '<Tab>q', '<cmd>BufferLinePickClose<cr>', opts)
vim.keymap.set('n', '<Tab>c', '<cmd>BufferLineCloseOthers<cr>', opts)
