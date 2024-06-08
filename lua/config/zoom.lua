vim.api.nvim_set_keymap('n', '<C-w>w', ':MaximizerToggle<CR>', { noremap = true, silent = true })

-- Ensure the vim-maximizer plugin is loaded
-- vim.cmd [[packadd vim-maximizer]]

-- Initialize the zoom state
-- _G.is_maximized = false
--
-- -- Function to toggle zoom in and out and trigger a notification
-- function _G.toggle_maximize()
--   if _G.is_maximized then
--     vim.cmd('MaximizerToggle')
--     _G.is_maximized = false
--     -- Trigger Noice notification for zoom out
--     vim.notify("Zoom out", "info", {title = "Vim Maximizer"})
--   else
--     vim.cmd('MaximizerToggle')
--     _G.is_maximized = true
--     -- Trigger Noice notification for zoom in
--     vim.notify("Zoom in", "info", {title = "Vim Maximizer"})
--   end
-- end
--
-- -- Set keymap for Ctrl-w o to toggle maximizer
-- vim.api.nvim_set_keymap('n', '<C-w>w', ':lua _G.toggle_maximize()<CR>', { noremap = true, silent = true })
