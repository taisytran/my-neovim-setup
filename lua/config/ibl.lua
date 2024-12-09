require("ibl").setup({
  indent = {
    char = "▏",
    smart_indent_cap = true,
    highlight = "IndentBlanklineChar",
  },
  exclude = {
    filetypes = { "help", "dashboard", "packer", "NvimTree", "terminal" },
    buftypes = { "terminal" },
  },
  scope = {
    show_start = false,
    show_end = false,
  }
})

