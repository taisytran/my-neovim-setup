-- init.lua
if vim.loader then
	vim.loader.enable()
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	-- Core dependencies
	"nvim-lua/plenary.nvim",

	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Fuzzy Finder
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = "nvim-telescope/telescope.nvim",
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
	},

	-- Git integration
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	"numToStr/Comment.nvim",

	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufRead", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
	},

	-- Nord color scheme
	"gbprod/nord.nvim",

	-- LSP Configuration
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- Autocompletion (Upgraded to blink.cmp)
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},

	-- modify multiple lines
	{
		"mg979/vim-visual-multi",
		event = "BufRead",
	},

	-- Snacks.nvim (Modern Dashboard, Indent, Zen, etc.)
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		-- config is moved to lua/config/snacks.lua
	},

	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- notice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	},

	-- tab & bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Marks
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
	},
})

-- Load configurations
require("config.basic")
require("config.theme")
require("config.zoom")
require("config.lualine")
require("config.comment")
require("config.nvim-tree")
require("config.telescope")
require("config.mason")
require("config.blink")
require("config.nvim-treesitter")
require("config.nvim-ts-autotag")
require("config.gitsigns")
require("config.vim-fugitive")
require("config.diffview")
require("config.noice")
require("config.conform")
require("config.bufferline")
require("config.marks")
require("config.snacks") -- New config file
