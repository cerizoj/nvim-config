local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = true,
	sources = {
		-- Formatting ---------------------
		-- StyLua
		formatting.stylua,
		-- golang
		formatting.gofmt,
		formatting.goimports,
		-----------------------------------------------------
		-- diagnostics
		-- code actions ---------------------
		code_actions.gomodifytags,
	},
	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	diagnostics_format = "[#{c}] #{m} (#{s})",
	on_attach = function(client)
		-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting_sync()']])
		if client.name ~= "null-ls" then
			client.resolved_capabilities.document_formatting = false
		end
	end,
})
