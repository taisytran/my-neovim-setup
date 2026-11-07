local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- Custom mappings
	vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical Split")) -- Custom mapping for vertical split
	vim.keymap.set("n", "-", ":NvimTreeToggle<CR>", opts("Toggle NvimTree")) -- Custom mapping to toggle NvimTree
	vim.keymap.set("n", "<S-R>", api.tree.reload, opts("Reload")) -- Custom mapping for Shift + R to reload
	vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab")) -- Open file in new tab
	vim.keymap.set("n", "I", function()
		api.tree.toggle_hidden_filter()
		api.tree.toggle_custom_filter({})
		api.tree.toggle_gitignore_filter()
	end, opts("Toggle Dotfiles"))
end

-- Configure nvim-tree
require("nvim-tree").setup({
	on_attach = my_on_attach, -- Use custom on_attach function
	disable_netrw = true,
	hijack_netrw = true,
	auto_reload_on_write = true,
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = { "node_modules", "^.git$", "yarn.lock", "package-lock.json", ".next" },
		git_ignored = false,
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	renderer = {
		root_folder_label = false,
		highlight_git = true, -- Highlights the icon/name based on git status
		highlight_opened_files = "none",
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "󰄱", -- Yellow (Dirty)
					staged = "󰱒", -- Green (Staged)
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "󰇘",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
})
