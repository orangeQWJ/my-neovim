-- 为了配置更清晰干练
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

map("i", "<C-f>", "<Right>", opt)
map("n", "<leader>b", ":Toc<CR>", opt)
map("n", "<leader>f", ":Format<CR>:w<CR>", opt)
-- 在Neovim中按下Ctrl+q时调用外部脚本
map('i', '<C-j>', '<Esc>:silent! !osascript ~/.config/nvim/apple/simulate_keys.scpt<CR>', opt)

