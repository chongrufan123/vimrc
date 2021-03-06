syntax on		"语法高亮
set showmode		"在底部显示，当前是命令还是插入
set showcmd		"在底部显示命令
"set mouse=a		"支持使用鼠标
set t_Co=256		"启用256色
set nu			"打开行数显示
filetype indent on	"打开类型检查

set autoindent		"保持缩进一致
set tabstop=4		"按下Tab键后 VIM显示的空格数
set expandtab		"自动将Tab转为空格
set softtabstop=4	"Tab转为4个空格

set cursorline      "光标所在行高亮
set textwidth=120    "一行显示80个字符
set linebreak       "不会在单词内部折行
set wrapmargin=2    "折行初和窗口右边缘空出2个字符
set scrolloff=5     "垂直滑动时光标距离顶部/底部的距离
set laststatus=2    "显示状态栏
set ruler           "在状态栏显示光标位置
:setlocal noautoindent
:setlocal nocindent
:setlocal nosmartindent
:setlocal indentexpr=
set showmatch       "光标遇到括号自动对应另一个
set hlsearch        "搜索时高亮显示匹配
set incsearch       "搜索时每输入一个字符自动跳转
set ignorecase      "搜索时忽略大小写


set clipboard=unnamed   
nnoremap <esc><esc> :noh<return><esc>
nnoremap shengchengmulu :GenTocMarked
nnoremap <c-s> :w<esc>
"set spell    "打开英语拼音拼写检查
set undofile        "保存撤销历史，可以保存上一次的操作历史
set backupdir=~/.vim/.backup//  "备份文件路径
set directory=~/.vim/.swp//     "交换文件路径
set undodir=~/.vim/.undo//      "操作历史文件保存路径
set autochdir                   "自动切换工作目录
set noerrorbells                "出错时不要发出响声
set novisualbell                  "出错时发出视觉提示
set history=1000                "记住1000次历史操作
set autoread                    "打开外部监视
set wildmenu
set wildmode=longest:list,full  "命令模式下底部自动补全

:inoremap jj <ESC>
nmap G Gzz
set fileencoding=utf-8
set guifont=Courier_New:h10:cANSI   "设置字体
set mat=5       "匹配括号时间0.5s
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

inoremap , , 
inoremap >> <esc>>>A
inoremap << <esc><<A
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>
nnoremap 0 ^
nnoremap - g_
set foldmethod=manual
set foldlevelstart=99

set encoding=utf-8
nmap <CR> o<ESC>
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <  <gv
xnoremap >  >gv
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
inoremap :: <esc>:
inoremap <c-s> <esc>:w<cr>a
set relativenumber
set noautoindent
set shiftwidth=4
set backspace=indent,eol,start
let g:vim_markdown_math = 1

" 自动转变中英文输入法
function! Fcitx2en()
    let input_status = system('fcitx-remote')
    if input_status == 2
        let b:inputtoggle = 1
        call system('fcitx-remote -c')
    endif
endfunction
function! Fcitx2zh()
    try
	if b:inputtoggle == 1
	    call system('fcitx-remote -o')
	    let b:inputtoggle = 0
	endif
    catch /inputtoggle/
        let b:inputtoggle = 0
    endtry
endfunction
" Autocmds:
au InsertLeave * call Fcitx2en()
au InsertEnter * call Fcitx2zh()



"新建.md,.py,.sh文件，自动插入文件头 
autocmd BufNewFile *.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func! SetTitle() 
    call setline(1, "###************************************************************************") 
    call append(line("."), "	# File Name: ".expand("%")) 
    call append(line(".")+1, "	# Author: Fan Chongru") 
    call append(line(".")+2, "	# Mail: chongrufan123@gmail.com") 
    call append(line(".")+3, "	# Created Time: ".strftime("%c")) 
    call append(line(".")+4, "  # notes: ") 
    call append(line(".")+5, "###***********************************************************************") 
    call append(line(".")+6, "")
endfunc 

autocmd BufNewFile *.md exec ":call MetTitle()" 
""定义函数SetTitle，自动插入文件头 
func! MetTitle() 
    call setline(1, "---------------------------------------------------------------------------") 
    call append(line("."), "	 File Name: ".expand("%")) 
    call append(line(".")+1, "	 Author: Fan Chongru") 
    call append(line(".")+2, "	 Mail: chongrufan123@gmail.com") 
    call append(line(".")+3, "	 Created Time: ".strftime("%c")) 
    call append(line(".")+4, "	 notes: ") 
    call append(line(".")+5, " --------------------------------------------------------------------------") 
    call append(line(".")+6, "")
endfunc 

autocmd BufNewFile *.sh exec ":call Mdtitle()" 
func! Mdtitle()
    call setline(1, "##########################################################################") 
    call append(line("."), "# File Name: ".expand("%")) 
    call append(line(".")+1, "# Author: Fan Chongru") 
    call append(line(".")+2, "# mail: chongrufan123@gmail.com") 
    call append(line(".")+3, "# Created Time: ".strftime("%c")) 
    call append(line(".")+4, "# notes: ") 
    call append(line(".")+5, "# permission: ") 
    call append(line(".")+6, "#########################################################################") 
    call append(line(".")+7, "#!/bin/Bash")
    call append(line(".")+8, "")
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""vimdle 配置"""""""""""""""""

set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

Plugin 'luochen1990/rainbow'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'preservim/nerdtree'

Plugin 'junegunn/vim-peekaboo'

Plugin 'simnalamburt/vim-mundo'

Plugin 'mzlogin/vim-markdown-toc'
Plugin 'plasticboy/vim-markdown'

Plugin 'iamcco/markdown-preview.nvim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""rainbow 配置"""""""""""""""""

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""YoucompleteMe 配置"""""""""""""""""
" YouCompleteMe
" 使用 Ctrl+Q 来主动触发补全
let g:ycm_key_invoke_completion = '<C-Q>'
" 开启自动语义补全
let g:ycm_semantic_triggers =  {
\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
\ 'cs,lua,javascript': ['re!\w{2}'],
\ }
" 更改补全面板的颜色 
highlight PMenu ctermfg=0 ctermbg=255 guifg=black guibg=Grey93 
highlight PMenuSel ctermfg=255 ctermbg=0 guifg=Grey93 guibg=black
" 禁止自动弹出函数原型窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
" 设置白名单，禁止名单以外的文件格式使用
let g:ycm_filetype_whitelist = { 
\ "c":1,
\ "cpp":1, 
\ "python":1,
\ "objc":1,
\ "sh":1,
\ "zsh":1,
\ "zimbu":1,
\ }          

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""NERDTree 配置"""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""mundo 配置"""""""""""""""""
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""自动运行代码"""""""""""""""""
"一键运行代码
map <c-p> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python3 %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""toc插件""""""""""""""""""""""

function! RToc()
    exe "/-toc .* -->"
    let lstart=line('.')
    exe "/-toc -->"
    let lnum=line('.')
    execute lstart.",".lnum."g/           /d"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""airline插件""""""""""""""""""""""
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 
let g:airline_theme='murmur'  " murmur配色不错

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '>>'
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = '<<'
let g:airline_right_alt_sep = '<'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = 'T'

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""vim-markdown插件""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1     "关闭折叠
let g:vim_markdown_strikethrough = 1        "增加删除线

