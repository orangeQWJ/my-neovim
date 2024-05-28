--- 基础设置
require("basic")
-- 快捷键设置
require("keybindings")
-- 插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 配置侧边栏目录树
require("plugin-config.nvim-tree")
-- 底部状态栏设置
require("plugin-config.lualine")
-- 模糊查找
require("plugin-config.telescope")
-- 更好的语法增强
require("plugin-config.nvim-treesitter")
-- 缩进提示线
require("plugin-config.indent-blankline")
--neorim-markdown
require("plugin-config.neovim-markdown")
-- 补全coc.nvim
require("coc")
-- 一些自动命令
require("autoCmd")
-- 自制插件
require("app")
-- 尝试性键位绑定
require("temp_keybind")
-- rainbow
--require("plugin-config.rainbow")
-- 开屏导航
--require("plugin-config.dashboard")
-- 项目插件
--require("plugin-config.project")
-- 添加标签栏
--require("plugin-config.bufferline")
require("keybindings")


vim.o.foldlevel = 99
