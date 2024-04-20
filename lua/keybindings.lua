vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------------------------------------
-- 为了配置更清晰干练
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

--------------------------------------------------------------------------------
-- 插件无关快捷键配置
map("n", "s", "", opt)
-- 选中代码后上下移动代码
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- Terminal相关
-- map("n", "<leader>t", ":sp | set nonumber | set nonumber | set signcolumn=no | terminal <CR>i", opt)
map("n", "<leader>t", ":sp | set nonumber | set nonumber | set signcolumn=no | terminal <CR>", opt)
--map("n", "<leader>vt", ":vsp | set nonumber | set nonumber | set signcolumn=no | terminal <CR>i", opt)
map("n", "<leader>vt", ":vsp | set nonumber | set nonumber | set signcolumn=no | terminal <CR>", opt)

map("t", "<C-k>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-w>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-w>l", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<C-w>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-w>k", [[ <C-\><C-N><C-w>k ]], opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
--map("n", "<C-u>", "9k", opt)
--map("n", "<C-d>", "9j", opt)

-- 左右比例控制
map("n", "sh", ":vertical resize -5<CR>", opt)
map("n", "sl", ":vertical resize +5<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +5<CR>", opt)
map("n", "sk", ":resize -5<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- 个人偏好
map("i", "jk", "<ESC>`^", opt)
map("i", "zz", "<ESC>zza", opt)
map("i", "<C-l>", "<ESC>la", opt)
--map("i", "<C-a>", "<ESC>A", opt)
--map("i", "<C-k>", "<Up>", opt)
--map("i", "<C-j>", "<Down>", opt)
--map("i", "<C-l>", "<Right>", opt)
--map("i", "<C-i>", "<Left>", opt)
map("n", "<leader>0", ":vsplit hint.md <CR>", opt)
--
----[[
--sdkfjsdfkj]]
--sdkkrfdfkj]]
--sdkfjsdfkj]]
--sdkfjsdfkj]]
--sdkfjsdfkj]]
--
--local function switch_to_english()
--    os.execute("osascript /Users/orange/.config/nvim/switch_to_english.scpt")
--end
---- 在正常模式下，按下 Ctrl + i 进入插入模式并执行脚本
--vim.api.nvim_set_keymap('n', '<C-i>', '', {
--    noremap = true, 
--    silent = true, 
--    callback = function()
--        switch_to_english()
--        vim.api.nvim_command('startinsert')
--    end
--})
--
---- 在插入模式下，按下 Ctrl + i 返回正常模式并执行脚本
--vim.api.nvim_set_keymap('i', '<C-i>', '', {
--    noremap = true, 
--    silent = true, 
--    callback = function()
--        switch_to_english()
--        vim.api.nvim_command('stopinsert')
--    end
--})

--------------------------------------------------------------------------------
--插件相关配置

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- <leader> + m 键打开关闭tree
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)

--g? 查看案件映射
---- 列表快捷键
--pluginKeys.nvimTreeList = {
--	-- 打开文件或文件夹
--	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
--	-- 分屏打开文件
--	{ key = "v",                              action = "vsplit" },
--	{ key = "h",                              action = "split" },
--	-- 显示隐藏文件
--	--{ key = "i",                              action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
--	{ key = ".",                              action = "toggle_dotfiles" }, -- Hide (dotfiles)
--	-- 文件操作
--	{ key = "<F5>",                           action = "refresh" },
--	{ key = "a",                              action = "create" },
--	{ key = "d",                              action = "remove" },
--	{ key = "r",                              action = "rename" },
--	{ key = "x",                              action = "cut" },
--	{ key = "y",                              action = "copy" },
--	{ key = "p",                              action = "paste" },
--	{ key = "s",                              action = "system_open" },
--}

-- treesitter 语法高亮增强
--map("n", "<leader>h", ":TSBufEnable highlight <CR>" ,opt)
map("n", "<leader>h", ":TSBufEnable highlight <CR>" ,opt)

-- bufferline
-- 左右Tab切换
-- map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
-- map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
-- map("n", "<leader>bq", ":Bdelete!<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
--

-- Telescope
-- 查找文件
map("n", "<leader><C-f>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader><C-g>", ":Telescope live_grep<CR>", opt)
-- 查看打开的buffer
map("n", "<leader><C-o>", ":Telescope buffers<CR>", opt)
-- 查看git文件状态变更
map("n", "<leader>gs", ":Telescope git_status<CR>", opt)
-- 查看git提交记录
map("n", "<leader>gc", ":Telescope git_commits<CR>", opt)
-- 查看 man 版主
map("n", "<leader><C-m>", ":Telescope man_pages<CR>", opt)

pluginKeys.telescopeList = {
	i = {
		-- 上下移动
			["<C-j>"] = "move_selection_next",
			["<C-k>"] = "move_selection_previous",
		-- 历史记录
			["<C-n>"] = "cycle_history_next",
			["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
			["<C-c>"] = "close",
		-- 预览窗口上下滚动
			["<C-u>"] = "preview_scrolling_up",
			["<C-d>"] = "preview_scrolling_down",
	},
}

-- 悬浮终端快捷键

vim.g.floaterm_position = "topright"
vim.g.floaterm_width = 0.4
vim.g.floaterm_height = 0.85
--vim.g.floaterm_title = " 🤖 $1|$2)"
vim.g.floaterm_title = "$1|$2"


map("t", "<C-i>h", [[<C-\><C-N> :FloatermHide <CR>]], opt)
map("t", "<C-i>p", [[<C-\><C-N> :FloatermPrev <CR>]], opt)
map("t", "<C-i>n", [[<C-\><C-N> :FloatermNext <CR>]], opt)
--map("t", "<C-h>x", [[<C-\><C-N> :FloatermKill <CR>]], opt)
map("t", "<C-i>c", [[<C-\><C-N> :FloatermNew <CR>]], opt)

--map("t", "<C-h>0", [[<C-\><C-N> :FloatermUpdate --width=0.4 --hight=0.85<CR>]], opt)

--map("t", "<C-h>p3", [[<C-\><C-N> :FloatermUpdate --width=0.3 <CR>]], opt)
--map("t", "<C-h>p4", [[<C-\><C-N> :FloatermUpdate --width=0.4 <CR>]], opt)
--map("t", "<C-h>p5", [[<C-\><C-N> :FloatermUpdate --width=0.5 <CR>]], opt)
--map("t", "<C-h>p6", [[<C-\><C-N> :FloatermUpdate --width=0.6 <CR>]], opt)
--map("t", "<C-h>p7", [[<C-\><C-N> :FloatermUpdate --width=0.7 <CR>]], opt)
--map("t", "<C-h>p8", [[<C-\><C-N> :FloatermUpdate --width=0.8 <CR>]], opt)
--map("t", "<C-h>p9", [[<C-\><C-N> :FloatermUpdate --width=0.9 <CR>]], opt)
--map("t", "<C-h>p1", [[<C-\><C-N> :FloatermUpdate --width=0.99 <CR>]], opt)
--
--map("t", "<C-h>v3", [[<C-\><C-N> :FloatermUpdate --height=0.3 <CR>]], opt)
--map("t", "<C-h>v4", [[<C-\><C-N> :FloatermUpdate --height=0.4 <CR>]], opt)
--map("t", "<C-h>v5", [[<C-\><C-N> :FloatermUpdate --height=0.5 <CR>]], opt)
--map("t", "<C-h>v6", [[<C-\><C-N> :FloatermUpdate --height=0.6 <CR>]], opt)
--map("t", "<C-h>v7", [[<C-\><C-N> :FloatermUpdate --height=0.7 <CR>]], opt)
--map("t", "<C-h>v8", [[<C-\><C-N> :FloatermUpdate --height=0.8 <CR>]], opt)
--map("t", "<C-h>v9", [[<C-\><C-N> :FloatermUpdate --height=0.9 <CR>]], opt)
--map("t", "<C-h>v1", [[<C-\><C-N> :FloatermUpdate --height=0.99 <CR>]], opt)
map("n", "<leader>1", ":FloatermNew <CR>", opt)
--map("n", "<leader>2", ":FloatermNext <CR>", opt)
map("n", "<leader>9", ":FloatermShow <CR>", opt)
--map("n", "<leader>4", ":FloatermHide <CR>", opt)
-- map("n", "<leader>5", ":FloatermSend <CR>", opt)

--map("n", "<leader>A", ":FloatermNew python3 ~/.config/nvim/AI.py   <CR>", opt)
--map("n", "<leader>R", ":FloatermNew python3 ~/.config/nvim/AI.py % <CR>", opt)
--map("n", "<leader>1", ":FloatermNew python3 ~/.config/nvim/AI_ONE_QUESTION.py % <CR>", opt)
--
--GPT
map("n", "<leader>gt", ":ChatGPT <CR>", opt)
map("n", "<leader>ge", ":ChatGPTEditWithInstructions <CR>", opt)

-- 格式化c/c++
pcall(
	vim.cmd,
	[[
	map <leader>i :call Format()<CR><CR>
	func! Format()
		exec "w"
		if &filetype == 'c'
			exec "!clang-format -style=WebKit -i % "
		endif
		if &filetype == 'cpp'
			exec "!clang-format -style=WebKit -i %"
		endif
	endfunc

	let mapleader=" "  "设置空格作为<leader>健
	set autoreade
  ]]
)

pcall(
	vim.cmd,
	[[
	map <leader>i :call Format()<CR><CR>
	func! Format()
		exec "w"
		if &filetype == 'c'
			exec "!clang-format -style=WebKit -i % "
		endif
		if &filetype == 'cpp'
			exec "!clang-format -style=WebKit -i %"
		endif
		if &filetype == 'go'
			exec "!go fmt"
		endif
	endfunc

	let mapleader=" "  "设置空格作为<leader>健
	set autoreade
  ]]
)

-- 换行自动缩进
pcall(
	vim.cmd,
	[[
	syntax enable
	syntax on
	filetype indent on
	filetype plugin on
	set autoindent
  ]]
)


pcall(
	vim.cmd,
	[[
	map <leader>x :call CompileRunGcc()<CR>
	func! CompileRunGcc()
		exec "w"
		exec "!clear"
		if &filetype == 'c'
			exec "!g++ % -o %<"
			exec "!time ./%<"
		elseif &filetype == 'cpp'
			exec "!g++ % -o %<"
			exec "!time ./%<"
		elseif &filetype == 'java'
			exec "!time java %<"
		elseif &filetype == 'sh'
			:!time bash %
			elseif &filetype == 'python'
			exec "!time python3 %"
		elseif &filetype == 'html'
			exec "!firefox % &"
		elseif &filetype == 'go'
			exec ":!go build % && time ./%< "
		elseif &filetype == 'markdown'
			exec "MarkdownPreview"
		endif
	endfunc
  ]]
)

return pluginKeys
