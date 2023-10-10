let mapleader=" "
inoremap jj <Esc>`^
inoremap jk <Esc>`^

inoremap zz <Esc>zza
inoremap <c-l> <Esc>la
"inoremap <c-o> <Esc>o
inoremap <c-a> <Esc>A

map <leader><c-d> :CocDisable<CR>
map <leader><c-e> :CocEnable<CR>
map <leader>a  ggVG"+y<c-o>
"map <leader><c-g>  :colorscheme gruvbox<CR>:AirlineTheme base16_gruvbox_dark_hard<CR>
map <leader><c-g>  :colorscheme gruvbox<CR>:AirlineTheme apprentice<CR>
map <leader><c-k>  :colorscheme darkblue<CR>:AirlineTheme apprentice<CR>
map <leader><c-t>  :!typora %&<CR><CR>


set tags=/home/orange/Lab/MIT/xv6-labs-2020/tags

"基础配置
set nocompatible "不与vi兼容"
"set autoread "当文件被修改时自动读入"

"视觉
"set number "行号
"set ruler   "光标坐标

"查找配置
set hlsearch  "高亮搜索结果

set ignorecase "忽视大小写
set smartcase  "如果搜索的字符中有大写则认为区分大小写，否则不区分大小写
set incsearch "根据已经在查找域中输入的文本，预览第一处匹配目标

"tab制表键
set clipboard+=unnamedplus
syntax enable
syntax on
filetype indent on
filetype plugin on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
"set cursorline
set ruler
"set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoread

set nofoldenable
"set foldmethod=syntax
set foldmethod=indent
set foldlevel=1
"set foldmethod=manual


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
        exec ":!go build %<"
        exec "!time go run %"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    endif
endfunc

map <leader>i :call Format()<CR>
func! Format()
    exec "w"
    if &filetype == 'python'
        exec "!python3 -m black %"
    elseif &filetype == 'cpp'
        exec "!clang-format -style=WebKit -i %"
        "exec "!clang-format -style=LLVM -i %"
    elseif &filetype == 'c'
        exec "!clang-format -style=WebKit -i %"
    elseif &filetype == 'ino'
        exec "!clang-format -style=WebKit -i %"
    endif
endfunc





"""""""""""""""""""""""""""""""""""""""
""##### auto fcitx  ###########
"let g:input_toggle = 1
"function! Fcitx2en()
"   let s:input_status = system("fcitx-remote")
"   if s:input_status == 2
"      let g:input_toggle = 1
"      let l:a = system("fcitx-remote -c")
"   endif
"endfunction
"
"function! Fcitx2zh()
"   let s:input_status = system("fcitx-remote")
"   if s:input_status != 2 && g:input_toggle == 1
"      let l:a = system("fcitx-remote -o")
"      let g:input_toggle = 0
"   endif
"endfunction
"
"set ttimeoutlen=150
""退出插入模式
"autocmd InsertLeave * call Fcitx2en()
""进入插入模式
"autocmd InsertEnter * call Fcitx2zh()
""##### auto fcitx end ######
"
"""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"开屏工具
Plug 'mhinz/vim-startify'

"文件内快速跳转
Plug 'easymotion/vim-easymotion'

"------------------
"括号匹配
Plug 'jiangmiao/auto-pairs'
"--------------
"符号对齐
Plug 'junegunn/vim-easy-align'
"
"
"python jedi-vim
"Plug 'davidhalter/jedi-vim'
"let g:jedi#completions_command = "<C-N>"
"jeid-vim 关闭预览界面，取消帮助文档的提示
"Goto assignments: <leader>g (typical goto function)
"跳转到定义： <leader>d
"显示Python文档(Pydoc)： K
"重命名：<leader>r
"展示某个变量的使用方法：<leader>n (shows all the usages of a name)
"打开某个模块：:Pyimport os (打开 os 模块)utocmd FileType python setlocal completeopt-=preview
"
"
Plug 'scrooloose/nerdtree'

Plug 'lervag/vimtex'
"主题安装
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

Plug 'connorholyday/vim-snazzy' "主题安装
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'W0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"vim翻译插件
Plug 'voldikss/vim-translator'
"状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"彩虹括号"
Plug 'luochen1990/rainbow'
"开启?
let g:rainbow_active = 1
"coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"ctags
"Plug 'majutsushi/tagbar'
"缩进可视化
Plug 'Yggdroot/indentLine'
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

"ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
let g:ranger_map_keys = 0
map <leader>f :Ranger<CR>
"
"模糊搜索插件ctrlp
"Plug 'ctrlpvim/ctrlp.vim'

"
"------------------------------------------------------------------------
"vimwiki
Plug 'vimwiki/vimwiki'
nmap <leader>xs <Plug>VimwikiToggleListItem`
let wiki_1 = {}
let wiki_1.path = '~/Nutstore Files/我的坚果云/Obsidian/我的笔记'
let wiki_1.path_html = "/temp"
let wiki_1.name = "main"
let wiki_1.syntax = "markdown"
let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}

let g:vimwiki_list = [ wiki_1 ]
"
"
"
"
"
"
"
"
"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" [Tags] 生成标签文件的命令
let g:fzf_tags_command = 'ctags -R'


call plug#end()

nmap ss <Plug>(easymotion-s2)
colors gruvbox
"colors darkblue
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"voldikss/vim-translator
"按键映射前缀: <leader>t。
"nmap <leader>t <Plug>Translate
"let g:translator_window_type = 'popup'                     "弹出窗口中显示。
"let g:translator_target_lang = 'zh'                        "目标语言为中文。
"let g:translator_source_lang = 'auto'                      "源语言自动识别。
""使用的翻译工具。
""let g:translator_default_engines = [ 'youdao','bing', 'google', 'haici']
"
""翻译Window的高亮配置
"hi def link TranslatorQuery             Identifier
"hi def link TranslatorDelimiter         Special
"hi def link TranslatorExplain           Statement
"
""窗口背景
"hi def link Translator                  Normal
"hi def link TranslatorBorder            NormalFloat
""hello world
"
"voldikss/vim-translator
"普通模式下翻译光标下英文字符串，在命令行显示翻译结果。
nmap <silent> <Leader>tt <Plug>Translate
"可视模式下翻译选中英文字符串，在命令行显示翻译结果。
vmap <silent> <Leader>tt <Plug>TranslateV
"普通模式下翻译光标下英文字符串，在窗口显示翻译结果。
nmap <silent> <Leader>tw <Plug>TranslateW
"可视模式下翻译光标下英文字符串，在窗口显示翻译结果。
vmap <silent> <Leader>tw <Plug>TranslateWV

"hello



"======================================================================================
"" Plug 'scrooloose/nerdtree'  目录树
"当启动Vim未指定文件时，启动NEARDTree
"autocmd StdinReadPre * let s:std_in = 1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"指定目录启动Vim时启动NEARDTree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

""快捷键
nnoremap <leader>m :NERDTree<CR>
nnoremap <leader>M :NERDTreeClose<CR>


"======================================================================================
"vim-airline/vim-airline
""
""let g:airline_theme = "base16_gruvbox_dark_hard"                          "选择配色风格。
let g:airline_theme = "apprentice"                          "选择配色风格。
"let g:airline#extensions#tabline#enabled = 1               "显示窗口的tab和buffer。
let g:airline_powerline_fonts = 1                          "开启支持powerline字体。
"let g:airline#extensions#tabline#formatter = 'unique_tail' "顶部缓存只显示文件名。

"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.colnr = '℅'            "列标志，默认标志乱码。
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.dirty = '⚡'
