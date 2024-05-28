local function speakWord()
    local word = vim.fn.expand('<cword>')
    local cmd = 'trans'
    local args = {'-sp', ':zh', vim.fn.shellescape(word, true)}

    -- 使用 vim.loop.spawn 来异步执行命令
    vim.loop.spawn(cmd, {
        args = args,
        stdio = {nil, nil, nil}  -- 可以通过这里控制 stdout, stderr 的输出
    }, function(code, signal)
        -- 这个回调函数会在命令执行完成后调用
        -- code 是进程退出码，signal 是结束信号
        if code == 0 then
            print("Translation and speech done successfully.")
        else
            print("Failed with exit code " .. code .. " and signal " .. signal)
        end
    end)
end

-- 设置键位映射，将 <leader>d 映射到 speakWord 函数
vim.keymap.set('n', '<leader>d', speakWord, {desc = "Translate and speak word under cursor"})


---- 格式化c/c++
--pcall(
--	vim.cmd,
--	[[
--	map <leader>i :call Format()<CR><CR>
--	func! Format()
--		exec "w"
--		if &filetype == 'c'
--			exec "!clang-format -style=WebKit -i % "
--		endif
--		if &filetype == 'cpp'
--			exec "!clang-format -style=WebKit -i %"
--		endif
--	endfunc
--
--	let mapleader=" "  "设置空格作为<leader>健
--	set autoreade
--  ]]
--)

--pcall(
--	vim.cmd,
--	[[
--	map <leader>i :call Format()<CR><CR>
--	func! Format()
--		exec "w"
--		if &filetype == 'c'
--			exec "!clang-format -style=WebKit -i % "
--		endif
--		if &filetype == 'cpp'
--			exec "!clang-format -style=WebKit -i %"
--		endif
--		if &filetype == 'go'
--			exec "!go fmt"
--		endif
--	endfunc
--
--	let mapleader=" "  "设置空格作为<leader>健
--	set autoreade
--  ]]
--)

-- 换行自动缩进
--pcall(
--	vim.cmd,
--	[[
--	syntax enable
--	syntax on
--	filetype indent on
--	filetype plugin on
--	set autoindent
--  ]]
--)


-- 定义 CompileRunGcc 函数
local function CompileRunGcc()
    -- 保存当前缓冲区
    vim.cmd('w')
    -- 清除终端
    vim.cmd('!clear')
    
    -- 根据文件类型执行不同的编译和运行命令
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%:p')
    local filename_without_ext = vim.fn.expand('%:p:r')
    
    if filetype == 'c' then
        vim.cmd('!g++ ' .. filename .. ' -o ' .. filename_without_ext)
        vim.cmd('!time ./' .. filename_without_ext)
    elseif filetype == 'cpp' then
        vim.cmd('!g++ ' .. filename .. ' -o ' .. filename_without_ext)
        vim.cmd('!time ./' .. filename_without_ext)
    elseif filetype == 'java' then
        vim.cmd('!time java ' .. filename_without_ext)
    elseif filetype == 'sh' then
        vim.cmd('!time bash ' .. filename)
    elseif filetype == 'python' then
        vim.cmd('!time python3 ' .. filename)
    elseif filetype == 'html' then
        vim.cmd('!firefox ' .. filename .. ' &')
    elseif filetype == 'go' then
        vim.cmd('!go build ' .. filename .. ' && time ./' .. filename_without_ext)
    elseif filetype == 'markdown' then
        vim.cmd('MarkdownPreview')
    end
end

-- 设置键映射
--vim.keymap.set('n', '<leader>x', CompileRunGcc, {desc = "一键运行"})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------------------------------------
-- 为了配置更清晰干练
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
map("n", "<leader>x", ":!python3 % <CR>", opt)
