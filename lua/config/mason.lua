-- config/mason.lua
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "ts_ls", "pyright", "svelte" },
  automatic_enable = true,
})

local on_attach = function(_client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
})

vim.lsp.config("pyright", {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
})

vim.lsp.config("svelte", {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
})

vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
  flags = { debounce_text_changes = 150 },
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
})
