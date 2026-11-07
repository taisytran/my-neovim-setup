-- Load editor options and the leader before plugins register their mappings.
require("config.basic")
require("config.zoom")

if vim.loader then
	vim.loader.enable()
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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

local function configure(name)
	return function()
		require("config." .. name)
	end
end

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = configure("theme"),
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		config = configure("snacks"),
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		keys = {
			{ "-", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
			{ "<leader>N", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file" },
		},
		dependencies = "nvim-tree/nvim-web-devicons",
		config = configure("nvim-tree"),
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>p", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>f", "<cmd>Telescope live_grep<cr>", desc = "Find text" },
			{ "<leader>m", "<cmd>Telescope marks<cr>", desc = "Find marks" },
			{ "<leader>o", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = configure("telescope"),
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = configure("lualine"),
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G", "Gblame" },
		keys = { { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" } },
		config = configure("vim-fugitive"),
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile", "FileType" },
		config = configure("gitsigns"),
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile", "FileType" },
		config = configure("comment"),
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = configure("nvim-treesitter"),
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile", "FileType" },
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = configure("nvim-ts-autotag"),
	},
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile", "FileType" },
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = configure("mason"),
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>=", mode = { "n", "x" }, desc = "Format with Conform" },
		},
		config = configure("conform"),
	},
	{
		"saghen/blink.cmp",
		version = "*",
		event = "InsertEnter",
		dependencies = "rafamadriz/friendly-snippets",
		config = configure("blink"),
	},
	{ "mg979/vim-visual-multi", event = { "BufReadPost", "BufNewFile" } },
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "folke/snacks.nvim" },
		config = configure("noice"),
	},
	{
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewFileHistory",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
		},
		dependencies = "nvim-lua/plenary.nvim",
		config = configure("diffview"),
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = configure("bufferline"),
	},
	{ "chentoast/marks.nvim", event = "VeryLazy", config = configure("marks") },
})
