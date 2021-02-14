set nocompatible	"不与VI兼容
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
set textwidth=80    "一行显示80个字符
set wrap            "自动折行，太长的行分几行显示
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
set relativenumber
nmap " 0i"<esc>x
set noautoindent
inoremap <c-o> <esc>o
set shiftwidth=4


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
"Plugin 'Valloric/YouCompleteMe'
" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""rainbow 配置"""""""""""""""""

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""



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
"""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""NERDTree 配置"""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
