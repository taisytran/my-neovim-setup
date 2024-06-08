-- NERDCommenter equivalent configuration for numToStr/Comment.nvim
require('Comment').setup({
  padding = true,
  sticky = true,
  toggler = {
    line = '<leader>/',
  },
  opleader = {
    line = '<leader>/',
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function ()
    vim.opt_local.commentstring = ""
  end
})
