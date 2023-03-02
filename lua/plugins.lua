local packer = require("packer")
packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		--------------------- colorschemes --------------------
		-- tokyonight
		use("folke/tokyonight.nvim")
		---------------------- plugins ------------------------
		-- nvim-tree
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- 状态栏
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- 搜索
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use("nvim-telescope/telescope-ui-select.nvim")
		-- 启动页
		use({ "glepnir/dashboard-nvim", commit = "a36b3232c98616149784f2ca2654e77caea7a522" })
		use("ahmedkhalf/project.nvim")
		-- 语法高亮
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		-------------------- LSP -----------------------------
		-- installer
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- Snippet 引擎
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")

		-- 代码格式化
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

		-- UI 增强
		use("onsails/lspkind-nvim")
		use("tami5/lspsaga.nvim")

		-- Lua 增强
		use("folke/neodev.nvim")
		-- JSON 增强
		use("b0o/schemastore.nvim")

		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")

		-------------------------------------------------------------
		use({ "akinsho/toggleterm.nvim" })
		-- surround
		use("ur4ltz/surround.nvim")
		-- Comment
		use("numToStr/Comment.nvim")
		-- nvim-autopairs
		use("windwp/nvim-autopairs")
		-- git
		use({ "lewis6991/gitsigns.nvim" })

		use("j-hui/fidget.nvim")
		--
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
