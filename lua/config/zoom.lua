-- Zoom the current window into a temporary tab, preserving its buffer and view.
local function toggle_zoom()
  local origin = vim.t.zoom_origin
  if origin then
    if #vim.api.nvim_list_tabpages() == 1 then
      vim.t.zoom_origin = nil
      return
    end
    -- Close the temporary tab before returning to the original window.
    vim.cmd("tabclose")
    if vim.api.nvim_win_is_valid(origin) then
      vim.api.nvim_set_current_win(origin)
    end
    vim.notify("Zoom Out (Restored)", vim.log.levels.INFO, { title = "Window Zoom" })
    return
  end

  local win = vim.api.nvim_get_current_win()
  -- :tab split also works for unnamed and modified buffers.
  vim.cmd("tab split")
  vim.t.zoom_origin = win
  vim.notify("Zoom In (Maximized)", vim.log.levels.INFO, { title = "Window Zoom" })
end

vim.keymap.set("n", "<C-w>w", toggle_zoom, { silent = true, desc = "Toggle window zoom" })
