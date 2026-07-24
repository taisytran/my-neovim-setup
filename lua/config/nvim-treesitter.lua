local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
  configs = require("nvim-treesitter")
end

configs.setup({
        ensure_installed = { 
          "javascript", "lua", "python", "ruby", "typescript", 
          "markdown", "markdown_inline", "html", "css",
          "latex", "norg", "scss", "svelte", "typst", "vue"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
        },
        indent = {
                enable = true,
        },
})

-- Force nvim-treesitter to use its own queries instead of Neovim's built-in ones
-- which are currently broken in 0.12.2 HEAD for Lua
vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/lazy/nvim-treesitter")
