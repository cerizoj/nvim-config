-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
	noremap = true,
	silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

map("i", "<C-s>", "<ESC>:w<CR>", opt)
map("n", "<C-s>", "<ESC>:w<CR>", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "<leader>tv", ":vsp<CR>", opt)
map("n", "<leader>th", ":sp<CR>", opt)
-- 关闭当前
map("n", "<C-w>", "<C-w>c", opt)
-- 关闭其他
map("n", "<C-o>", "<C-w>o", opt) -- close others

-- bufferline
-- 左右Tab切换
map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<M-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<M-l>", ":BufferLineCycleNext<CR>", opt)

-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "n", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<ESC>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	mapbuf(
		"n",
		"<leader>d",
		"<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>",
		opt
	)
	mapbuf("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	--mapbuf("n", "<leader>f", "<cmd>Lspsaga lsp_finder<CR>", opt)
	--[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
	-- diagnostic
	mapbuf("n", "<leader>ds", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	-- 未用
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "gcc", -- 行注释
		block = "gbc", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "gc",
		bock = "gb",
	},
}
-- ctrl + /
map("n", "<M-/>", "gcc", { noremap = false })
map("n", "<A-/>", "gcc", { noremap = false })
map("v", "<M-/>", "gcc", { noremap = false })
map("v", "<A-/>", "gcc", { noremap = false })

-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>ta 浮动
-- <leader>tb 右侧
-- <leader>tc 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
	vim.keymap.set({ "n", "t" }, "<leader>ta", toggleterm.toggleA)
	vim.keymap.set({ "n", "t" }, "<leader>tb", toggleterm.toggleB)
	vim.keymap.set({ "n", "t" }, "<leader>tc", toggleterm.toggleC)
	vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end

-- gitsigns
pluginKeys.gitsigns_on_attach = function(bufnr)
	local gs = package.loaded.gitsigns

	local function gmap(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	-- Navigation
	gmap("n", "<leader>gj", function()
		if vim.wo.diff then
			return "]c"
		end
		vim.schedule(function()
			gs.next_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	gmap("n", "<leader>gk", function()
		if vim.wo.diff then
			return "[c"
		end
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	gmap({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
	gmap("n", "<leader>gS", gs.stage_buffer)
	gmap("n", "<leader>gu", gs.undo_stage_hunk)
	gmap({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
	gmap("n", "<leader>gR", gs.reset_buffer)
	gmap("n", "<leader>gp", gs.preview_hunk)
	gmap("n", "<leader>gb", function()
		gs.blame_line({ full = true })
	end)
	gmap("n", "<leader>gd", gs.diffthis)
	gmap("n", "<leader>gD", function()
		gs.diffthis("~")
	end)
	-- toggle
	gmap("n", "<leader>gtd", gs.toggle_deleted)
	gmap("n", "<leader>gtb", gs.toggle_current_line_blame)
	-- Text object
	gmap({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
end

return pluginKeys
