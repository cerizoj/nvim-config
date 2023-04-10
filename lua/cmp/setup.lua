-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/onsails/lspkind-nvim
local status, cmp = pcall(require, "cmp")
if not status then
	return
end

local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end

local mapping = {
	-- 出现补全
	["<A-,>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	-- 取消
	["<A-.>"] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),

	-- 确认
	-- Accept currently selected item. If none selected, `select` first item.
	-- Set `select` to `false` to only confirm explicitly selected items.
	["<CR>"] = cmp.mapping.confirm({
		select = true,
		behavior = cmp.ConfirmBehavior.Replace,
	}),
	-- 如果窗口内容太多，可以滚动
	["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
	["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

	-- 上一个
	["<C-k>"] = cmp.mapping.select_prev_item(),
	-- 下一个
	["<C-j>"] = cmp.mapping.select_next_item(),
}

cmp.setup({
	-- 指定 snippet 引擎 luasnip
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	-- 快捷键
	-- mapping = mapping,
	mapping = mapping,
	-- 来源
	sources = cmp.config.sources({
		{
			name = "luasnip",
			group_index = 1,
		},
		{
			name = "nvim_lsp",
			group_index = 1,
		},
		{
			name = "nvim_lsp_signature_help",
			group_index = 1,
		},
		{
			name = "buffer",
			group_index = 2,
		},
		{
			name = "path",
			group_index = 2,
		},
	}),

	-- 使用lspkind-nvim显示类型图标
	formatting = require("cmp.lspkind").formatting,
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { {
		name = "buffer",
	} },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ {
		name = "path",
	} }, { {
		name = "cmdline",
	} }),
})

require("cmp.snippets")
