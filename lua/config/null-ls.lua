local null_ls = require("null-ls")

local biome_formatting = {
  method = null_ls.methods.FORMATTING,
  filetypes = { "javascript", "typescript", "css", "json", "html", "svelte" },
  generator = null_ls.generator({
    command = "biome",
    args = { "format", "--stdin-filepath", "$FILENAME" },
    to_stdin = true,
  }),
}

local biome_diagnostics = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "javascript", "typescript", "css", "json", "html", "svelte" },
  generator = null_ls.generator({
    command = "biome",
    args = { "check", "--stdin-filepath", "$FILENAME" },
    to_stdin = true,
    from_stderr = true,
    format = "json",
    on_output = function(params)
      local diagnostics = {}
      for _, diagnostic in ipairs(params.output.diagnostics) do
        table.insert(diagnostics, {
          row = diagnostic.range.start.line + 1,
          col = diagnostic.range.start.character + 1,
          end_row = diagnostic.range["end"].line + 1,
          end_col = diagnostic.range["end"].character + 1,
          source = "biome",
          message = diagnostic.message,
          severity = diagnostic.severity,
        })
      end
      return diagnostics
    end,
  }),
}

null_ls.setup({
  sources = {
    biome_formatting,
    biome_diagnostics,
  },
})

-- Auto-format on save
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.svelte,*.js,*.ts,*.css,*.json,*.html lua vim.lsp.buf.format({async = true})
  augroup END
]])
