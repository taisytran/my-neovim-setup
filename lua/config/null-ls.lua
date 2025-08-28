local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Prettier formatting
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "json",
        "css",
        "html",
        "svelte",
        "markdown",
        "yaml",
      },
    }),
  },
})

-- Auto-format on save
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.svelte,*.js,*.ts,*.tsx,*.css,*.json,*.html lua vim.lsp.buf.format({ async = true })
  augroup END
]])
