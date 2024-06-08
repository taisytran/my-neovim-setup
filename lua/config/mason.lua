-- config/mason.lua
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require('lspconfig')

mason.setup()

mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "pyright", "tsserver" }, -- Replace these with the servers you need
  automatic_installation = true,
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Key mappings
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- Add more key mappings as needed
end

-- Default handler to setup all installed LSP servers
mason_lspconfig.setup_handlers {
  function (server_name) -- default handler (optional)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end,
  -- Example of a specific handler
  ["tsserver"] = function ()
    lspconfig.tsserver.setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end,
  ["lua_ls"] = function ()
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      },
      flags = {
        debounce_text_changes = 150,
      }
    }
  end,
  -- Add specific handlers for other LSP servers if needed
}
