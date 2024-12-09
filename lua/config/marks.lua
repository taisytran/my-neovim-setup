require("marks").setup({
  signs = true,
  force_write_shada = true, -- uppercase store
  excluded_filetypes = { "TelescopePrompt", "NvimTree" },
  mappings = {
    -- delete = "dm",
    delete_buf = "dm-",
    prev = false
  },
  refresh_interval = 250
})
