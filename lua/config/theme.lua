-- Enable true color support
if vim.fn.has("termguicolors") then
  vim.opt.termguicolors = true
end

-- Set the colorscheme to Nord
vim.cmd('colorscheme nord')

-- Optional: Customize Nord theme settings
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_cursorline_transparent = true
vim.g.nord_enable_sidebar_background = true
vim.g.nord_italic = false
