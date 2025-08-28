local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    python = { "black" },
    lua = { "stylua" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 1000,
  },
  notify_on_error = true,
})

vim.keymap.set("n", "<leader>=", function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  require("conform").format({
    async = true,
    lsp_fallback = true,
    range = {
      start = { line, 0 },
      ["end"] = { line + 1, 0 },
    },
  })
end, { desc = "Format current line with Conform" })

vim.keymap.set("v", "<leader>=", function()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  require("conform").format({
    async = true,
    lsp_fallback = true,
    range = {
      start = { start_pos[2], start_pos[3] },
      ["end"] = { end_pos[2] + 1, 0 }, -- +1 vì end exclusive
    },
  })
end, { desc = "Format visual selection with Conform" })
