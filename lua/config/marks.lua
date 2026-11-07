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

-- Keep bookmark notifications with the mark mappings, independent of the UI.
for char = 97, 122 do
  local key = string.char(char)
  vim.keymap.set("n", "m" .. key, function()
    vim.cmd.normal({ "m" .. key, bang = true })
    vim.schedule(function()
      vim.notify("Mark set: " .. key, vim.log.levels.INFO, { title = "Bookmark" })
    end)
  end, { silent = true, desc = "Set mark " .. key })
end
