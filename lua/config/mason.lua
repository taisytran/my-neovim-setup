-- config/mason.lua
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "ts_ls", "pyright", "svelte" },
})

local on_attach = function(_client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
end

-- Common flags
local flags = { debounce_text_changes = 150 }

local function setup_server(name, config)
	config = vim.tbl_extend("force", {
		on_attach = on_attach,
		flags = flags,
	}, config or {})

	-- For Neovim 0.11+, use vim.lsp.config if available to avoid deprecation warnings
	if vim.lsp.config then
		vim.lsp.config[name] = config
	else
		-- Fallback for older versions or if lspconfig is still preferred
		local ok, lspconfig = pcall(require, "lspconfig")
		if ok then
			lspconfig[name].setup(config)
		end
	end
end

setup_server("ts_ls")
setup_server("pyright")
setup_server("svelte")
setup_server("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})
