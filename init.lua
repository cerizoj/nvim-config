-- 基础设置
require('basic')
-- 快捷键映射
require("keybindings")
-- Packer 插件管理
require("plugins")
-- 主题
require("colorscheme")


-- 插件配置
-- 侧边栏
require("plugin-config.nvim-tree")
-- 状态栏
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
-- 启动页
require("plugin-config.dashboard")
require("plugin-config.project")
-- 语法高亮
require("plugin-config.nvim-treesitter")

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
