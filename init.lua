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
-- 添加标签栏
--require("plugin-config.bufferline")
-- 底部状态栏设置
require("plugin-config.lualine")
-- 搜索
-- 模糊查找文件
require("plugin-config.telescope")

-- 开屏导航
--require("plugin-config.dashboard")
-- 项目插件
require("plugin-config.project")
-- 更好的代码高亮,增量选择
--require("plugin-config.nvim-treesitter")
-- indent-blankline 缩进提示线
require("plugin-config.indent-blankline")
-- coc.nvim
require("coc")


vim.cmd [[
augroup MyAutoCmds
    autocmd!
    autocmd BufEnter * if &buftype != 'terminal' | :TSBufEnable highlight | endif
	autocmd BufEnter * if &buftype != 'terminal' | :set signcolumn=yes | endif
	autocmd TermOpen * :set signcolumn=no
augroup END
]]
