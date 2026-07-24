-- Native Lua Window Zoom (Replacing vim-maximizer)
-- Keybind: <C-w>w to toggle maximize window

local function toggle_zoom()
    if vim.t.maximized_window then
        -- Restore
        vim.api.nvim_set_current_win(vim.t.maximized_window)
        vim.cmd("tabclose")
        vim.t.maximized_window = nil
        vim.notify("Zoom Out (Restored)", vim.log.levels.INFO, { title = "Window Zoom" })
    else
        -- Maximize using a temporary tab
        local cur_win = vim.api.nvim_get_current_win()
        local cur_buf = vim.api.nvim_get_current_buf()
        local cursor = vim.api.nvim_win_get_cursor(cur_win)
        
        vim.cmd("tabedit %")
        vim.t.maximized_window = cur_win
        vim.api.nvim_win_set_cursor(0, cursor)
        
        vim.notify("Zoom In (Maximized)", vim.log.levels.INFO, { title = "Window Zoom" })
    end
end

vim.keymap.set('n', '<C-w>w', toggle_zoom, { noremap = true, silent = true, desc = "Toggle window zoom" })
