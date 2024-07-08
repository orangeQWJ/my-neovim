-- 为了配置更清晰干练
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

map("i", "<C-f>", "<Right>", opt)
map("n", "<leader>b", ":Toc<CR>", opt)
map("n", "<leader>f", ":Format<CR>:w<CR>", opt)
