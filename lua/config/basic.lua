-- Set Python 3 provider
vim.g.python3_host_prog = vim.fn.trim(vim.fn.system("which python3"))

-- Disable Perl provider (optional)
vim.g.loaded_perl_provider = 0

-- Vim git fugitive
vim.g.fugitive_hg_cmd = "hg"

-- Essential settings
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "latin1" }
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"

-- Mappings (Preserved)
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Copy/Paste system clipboard
keymap("v", "y", '"+y', opts)
keymap("n", "p", '"+p', opts)
keymap("v", "p", '"+p', opts)
keymap("n", "yy", '"+yy', opts)
keymap("n", "P", ':set paste<CR>"+P:set nopaste<CR>', opts)

-- Pane navigation
keymap("n", "<C-h>", "<C-W>h", { noremap = true })
keymap("n", "<C-j>", "<C-W>j", { noremap = true })
keymap("n", "<C-k>", "<C-W>k", { noremap = true })
keymap("n", "<C-l>", "<C-W>l", { noremap = true })

-- Search settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true })

-- Automatically reload the file if it changed outside of Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	command = "checktime",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
	callback = function()
		vim.schedule(function()
			vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
		end)
	end,
})

vim.api.nvim_create_user_command("Path", function()
	local filepath = vim.fn.expand("%:.")
	vim.fn.setreg("+", filepath)
	vim.notify("Copied path: " .. filepath, vim.log.levels.INFO)
end, {})

-- Tab navigation (if not using bufferline)
-- keymap("n", "<S-Tab>", ":tabnext<CR>", opts)
