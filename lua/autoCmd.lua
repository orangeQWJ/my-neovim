vim.cmd [[
augroup MyAutoCmds
    autocmd!
    autocmd BufEnter * if &buftype != 'terminal' | :TSBufEnable highlight | endif
	autocmd BufEnter * if &buftype != 'terminal' | :set signcolumn=yes | endif
	autocmd TermOpen * :set signcolumn=no
	autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

augroup END
]]
-- 仅在 Markdown 文件中设置自动换行
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal textwidth=80 formatoptions+=t"
})
