-- 基础设置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer 插件管理
require("plugins")
-- 主题
require("colorscheme")

-- 插件配置
-- 侧边栏
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.toggleterm")
require("plugin-config.surround")
require("plugin-config.comment")
require("plugin-config.nvim-autopairs")
require("plugin-config.fidget")

-- 自动命令
require("autocmds")

-- LSP
require("lsp.setup")

-- 自动补全
require("cmp.setup")

-- 增强
require("plugin-config.indent-blankline")

-- 格式化
require("format.setup")
