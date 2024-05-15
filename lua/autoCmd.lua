vim.cmd [[
augroup MyAutoCmds
    autocmd!
    autocmd BufEnter * if &buftype != 'terminal' | :TSBufEnable highlight | endif
	autocmd BufEnter * if &buftype != 'terminal' | :set signcolumn=yes | endif
	autocmd TermOpen * :set signcolumn=no
	autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

augroup END
]]
