require'nvim-treesitter.configs'.setup {
  ensure_installed = { "regex", "bash", "css", "html", "javascript", "json", "lua", "python", "ruby", "typescript", "yaml", "svelte" },
  sync_install = false,
  -- ignore_install = { "typescript" },

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
