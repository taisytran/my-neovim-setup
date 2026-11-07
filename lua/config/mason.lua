-- config/mason.lua
local mason_lspconfig = require("mason-lspconfig")

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
		capabilities = require("blink.cmp").get_lsp_capabilities(),
	}, config or {})

	vim.lsp.config(name, config)
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

-- Enable only these servers, after their configuration is registered.
mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "ts_ls", "pyright", "svelte" },
	automatic_enable = { "lua_ls", "ts_ls", "pyright", "svelte" },
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})
