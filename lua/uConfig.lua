local M = {
	config_path = vim.fn.stdpath("config"),
	keys = {
		-- luasnip
		snip_jump_next = "<C-l>",
		snip_jump_prev = "<C-h>",
		snip_next_choice = "<C-j>",
		snip_prev_choice = "<C-k>",
	},
}

return M
