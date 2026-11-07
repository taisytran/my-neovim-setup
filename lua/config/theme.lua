-- Nord theme configuration (gbprod/nord.nvim)
-- Modern Lua setup with safety check for first-time installation

local status, nord = pcall(require, "nord")
if status then
  nord.setup({
    transparent = true,
    styles = {
      comments = { italic = false },
      bufferline = { modified = { italic = false } },
    },
  })
end

-- Set the colorscheme
-- Wrap in pcall to prevent crash if plugin is not yet installed
local color_status = pcall(vim.cmd.colorscheme, "nord")
if not color_status then
    -- Fallback to a built-in theme or just ignore if it's the first run
    -- vim.cmd.colorscheme("habamax")
end

-- Enable true color support
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- Custom Git Highlights based on Best Practices
-- Yellow = Modified/Dirty (Unstaged)
-- Green  = Staged/New/Added
local function set_git_colors()
  local colors = {
    green  = "#A3BE8C", -- Nord Green (Staged / New)
    yellow = "#EBCB8B", -- Nord Yellow (Modified / Unstaged)
    orange = "#D08770", -- Nord Orange (Merged / Conflict)
    red    = "#BF616A", -- Nord Red (Deleted)
    blue   = "#81A1C1", -- Nord Blue (Untracked)
    white  = "#E5E9F0", -- Nord Snow Storm (Normal)
    gray   = "#4C566A", -- Nord Polar Night (Ignored)
  }

  -- GitSigns (Gutter markers)
  vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = colors.green, bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = colors.yellow, bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = colors.red, bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { fg = colors.orange, bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { fg = colors.red, bold = true })
  vim.api.nvim_set_hl(0, 'GitSignsUntracked', { fg = colors.blue, bold = true })

  -- NvimTree Basic Colors
  vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = colors.white, bold = true })
  vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = colors.white, bold = true })
  vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { fg = colors.white, bold = true })
  vim.api.nvim_set_hl(0, 'NvimTreeNormal', { fg = colors.white })

  -- NvimTree Git Colors (Following Best Practices)
  -- MODIFIED (Unstaged) -> YELLOW
  vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = colors.yellow })
  
  -- STAGED / NEW -> GREEN
  vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { fg = colors.green })
  vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { fg = colors.green })
  
  -- OTHER STATES
  vim.api.nvim_set_hl(0, 'NvimTreeGitMerge', { fg = colors.orange })
  vim.api.nvim_set_hl(0, 'NvimTreeGitRenamed', { fg = "#88C0D0" }) -- Aqua
  vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { fg = colors.red })
  vim.api.nvim_set_hl(0, 'NvimTreeGitIgnored', { fg = colors.gray })
end

set_git_colors()

-- Re-apply on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_git_colors,
})
