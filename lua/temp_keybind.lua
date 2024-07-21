-- 为了配置更清晰干练
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

map("i", "<C-f>", "<Right>", opt)
map("n", "<leader>b", ":Toc<CR>", opt)
map("n", "<leader>f", ":Format<CR>:w<CR>", opt)
-- 在Neovim中按下Ctrl+q时调用外部脚本
map('i', '<C-j>', '<Esc>:silent! !osascript ~/.config/nvim/apple/simulate_keys.scpt<CR>', opt)

map("n", "<leader>vd", ":vsp | set nonumber  | set signcolumn=no | terminal  python3 -m ipdb " .. vim.fn.expand('%') .. "<CR>", opt)
map("n", "<leader>ve", ":vsp | set nonumber  | set signcolumn=no | terminal  python3 " .. vim.fn.expand('%') .. "<CR>", opt)

-- 自动读取被外部更改的文件
vim.opt.autoread = true

-- 当获得焦点时自动更新缓冲区
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
  pattern = "*",
  command = "checktime",
})

-- 显示提示信息
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.api.nvim_echo({{"File changed on disk. Buffer reloaded.", "WarningMsg"}}, false, {})
  end,
})

map('n', '<leader>u', ':checktime<CR>', opt)
