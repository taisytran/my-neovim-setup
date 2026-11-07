local treesitter = require("nvim-treesitter")

treesitter.setup({})

local languages = {
  "vim", "vimdoc", "query", "bash", "regex", "javascript", "lua", "python", "ruby", "typescript", "tsx", "json",
  "markdown", "markdown_inline", "html", "css", "latex",
  "scss", "svelte", "typst", "vue",
}

local function attach(buf)
  if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].buftype ~= "" then
    return
  end
  local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
  if not lang or not pcall(vim.treesitter.start, buf, lang) then
    return
  end
  vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("ConfigTreesitter", { clear = true }),
  callback = function(event) attach(event.buf) end,
})

-- Parser compilation requires the CLI, including when a parser.c is shipped.
-- Existing parsers can still be used when this dependency is unavailable.
if vim.fn.executable("tree-sitter") ~= 1 then
  vim.schedule(function()
    vim.notify("Treesitter parser installation requires tree-sitter-cli (brew install tree-sitter-cli).", vim.log.levels.WARN)
  end)
  return
end

-- Install missing parsers asynchronously; attach buffers once they are ready.
treesitter.install(languages):await(function()
  vim.schedule(function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        attach(buf)
      end
    end
  end)
end)
