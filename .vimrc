" stormaroon's VIM Configuration
" Dependencies:
" Node,
" Jedi,
" Flake8
" Markdown Preview Support:
" sudo npm -g install instant-markdown-d
" sudo apt install xdg-utils crul nodejs-legacy
" CodeFormat:
" Add Python And Js Format
" sudo pip install yapf || Use pep8 to format python
" npm install -g js-beautify || Use js-beautify to format js,css,html
" ============================================================
" Keyboard Shortcats:
" NerdTree: <C-n>
" PasteMode: <F3>
" Tagbar: <F8>
" Folding: <z-o>,<z-c>,<z-r><z-m>
" CodeFormat: <C-f>
" ============================================================
" General
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
"set spell	" Enable spell-checking
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
set encoding=utf-8 " use utf-8 encoding
set cursorline " Highlight the LineNumber

" Advanced
set ruler	" Show row and column ruler information
set clipboard=unnamed " set clipboard to default
autocmd BufEnter * lcd %:p:h " 打开目录是进入当前目录
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set pastetoggle=<F3> " Paste toggle - when pasting something in, don't indent.

let python_highlight_all = 1

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim 自动缩进
Plugin 'vim-scripts/indentpython.vim'

" 自动补全
Plugin 'Shougo/neocomplete.vim'

" Jedi Python补全
" 需要pip安装jedi
Plugin 'davidhalter/jedi-vim'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Dracula
Plugin 'dracula/vim'

" 语法检查
Plugin 'vim-syntastic/syntastic'

" 树形浏览
" 快捷键<C-n>
Plugin 'scrooloose/nerdtree'

" 自动补全括号
Plugin 'Raimondi/delimitMate'

" Tabular
Plugin 'godlygeek/tabular'

" Markdown
" 默认启动代码折叠
" 快捷键<z-o>,<z-c>,<z-r><z-m>
Plugin 'plasticboy/vim-markdown'

" Markdown Preview
Plugin 'suan/vim-instant-markdown'

" 全局搜索
" 快捷键<C-p>
Plugin 'ctrlpvim/ctrlp.vim'

" Tagbar 显示方法
" 快捷键<F8>
" 需要安装ctags
Plugin 'majutsushi/tagbar'

" 无干扰编辑模式
" 输入:Goyo启动
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" Auto Format<C-f>
Plugin 'Chiel92/vim-autoformat'

" Better JSON
Plugin 'elzr/vim-json'

" EasyMotion
Plugin 'easymotion/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Vundle Over

" ============================== NEO Complete ===============================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
	    \ 'default' : '',
	    \ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
	    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions " 设置python使用jedi补全
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Jedi配合配置
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" NeoComplete JavaScript
let g:neocomplete#sources#omni#input_patterns.javascript = '\h\w*\|[^. \t]\.\w*'

" ========================== NEO Complete 结束 ================================

" airline配置
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" colorscheme
syntax on
set t_Co=256
set termguicolors
color dracula

" syntastic 代码纠错
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 配置Python使用flake8进行语法检查
let g:syntasic_python_checkers = ['flake8']
" 配置代码检查符号
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" NERDTree配置
" 设置快捷键
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " 自动关闭 
" 设置符号
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Markdown 配置
let g:vim_markdown_folding_style_pythonic = 1

" Tagbar 配置
nmap <F8> :TagbarToggle<CR>

" 无干扰模式配置
" Goyo模式下自动启用LimeLight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" 代码格式化配置
noremap <C-f> :Autoformat<CR>
let g:formatter_yapf_style = 'pep8' "使用pep8格式化python

" EasyMotion快捷键
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" ==============================================

" GUI配置
if has('gui_running')
    set guifont=Fira\ Code\ Medium\ 10
    color dracula
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif
