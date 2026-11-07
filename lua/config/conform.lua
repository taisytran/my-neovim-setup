local conform = require("conform")

-- health check :ConformInfo

conform.setup({
	formatters_by_ft = {
		javascript = { "oxfmt" },
		typescript = { "oxfmt" },
		javascriptreact = { "oxfmt" },
		typescriptreact = { "oxfmt" },
		json = { "oxfmt" },
		html = { "prettier" },
		css = { "prettier" },
		svelte = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		python = { "black" },
		lua = { "stylua" },
		sql = { "pg_format" },
		pgsql = { "pg_format" },
	},
	formatters = {
		pg_format = {
			command = "pg_format",
			stdin = true,
			args = { "-L", "-s", "2", "-u", "2", "-" },
		},
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 1000,
	},
	notify_on_error = true,
})

vim.keymap.set("n", "<leader>=", function()
	local line = vim.api.nvim_win_get_cursor(0)[1]
	require("conform").format({
		async = true,
		lsp_format = "fallback",
		range = {
			start = { line, 0 },
			["end"] = { line, #vim.api.nvim_get_current_line() },
		},
	})
end, { desc = "Format current line with Conform" })

-- Conform reads the active visual selection and normalizes its byte columns.
vim.keymap.set("x", "<leader>=", function()
	conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format visual selection with Conform" })
