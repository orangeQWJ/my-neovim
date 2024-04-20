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
--require("plugin-config.project")
-- 更好的代码高亮,增量选择
--require("plugin-config.nvim-treesitter")
-- indent-blankline 缩进提示线
--require("plugin-config.indent-blankline")
require("plugin-config.new-indent-blankline")
-- coc.nvim
require("coc")
-- markdown
--require("plugin-config.telekasten")
--telekasten
-- require("plugin-config.telekasten")



vim.cmd [[
augroup MyAutoCmds
    autocmd!
    autocmd BufEnter * if &buftype != 'terminal' | :TSBufEnable highlight | endif
	autocmd BufEnter * if &buftype != 'terminal' | :set signcolumn=yes | endif
	autocmd TermOpen * :set signcolumn=no
	autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

augroup END
]]

--autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
--
vim.g.vim_markdown_conceal = 2
vim.g.vim_markdown_toc_autofit = 1

-- 定义一个函数来获取光标下的单词并执行命令
function speakWord()
	-- 获取当前光标下的单词
	local word = vim.fn.expand('<cword>')
	-- 使用 vim.cmd 执行外部命令，传递单词作为参数
	vim.cmd('!trans -sp :zh > /dev/null ' .. word)
end

-- 取消插入模式下的 Tab 映射
--vim.api.vim_del_keymap('i', '<Tab>')
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_keymap('t', '<Tab>', '<Tab>', {noremap = true})
    end
})

