require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "lua", "python", "ruby", "typescript" },
  sync_install = false,
  -- ignore_install = { "typescript" },

  auto_install = true,

  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false
  }
}
