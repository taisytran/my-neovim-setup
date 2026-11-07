-- config/blink.lua
-- Modern autocompletion powered by Rust
require("blink.cmp").setup({
	enabled = function()
		return true
	end,

	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	cmdline = {
		enabled = false,
	},

	signature = { enabled = false },

	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		ghost_text = { enabled = false },
	},
})
