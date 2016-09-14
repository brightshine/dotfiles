""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = '/usr/bin/python2'
set nocompatible               " be iMproved
filetype off                   " required!

"" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let iCanHazVundle=0
endif
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)


" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'EduardoBautista/grb256'

" Better file browser
Plugin 'scrooloose/nerdtree'

"Plugin 'scrooloose/syntastic.git'

"Plugin 'Valloric/YouCompleteMe'

" Improved C++11/14 STL syntax highlighting 
Plugin 'Mizuchi/STL-Syntax'

" Swtich between source files and header files quickly."
Plugin 'vim-scripts/a.vim'

" Use gtags to trace c++ code
Plugin 'aceofall/gtags.vim'

Plugin 'rking/ag.vim'
call vundle#end()  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=";"
set history=50		" keep 50 lines of command line history
set cf " enable error files and error jumping
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set ffs=unix,dos,mac " support all three, in this order
"call pathogen#runtime_append_all_bundles()
filetype plugin indent on " detect the type of file and load indent files
"set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=light		" we are using a dark background
syntax on				" syntax highlighting on
color  grb256			" my theme
if ! has("gui_running")
	set t_Co=256
endif 
augroup filetypedetect
	au! BufRead,BufNewFile *.shtml setfiletype php
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set backup			  				 " make backup file
"set backupdir=~/backup/vim/ " where to put backup file
"set directory=$VIM\vimfiles\temp	 " directory is the directory for temp file
"set makeef=error.err				 " When using make, where should it dump the file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim/UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler							" Always show current positions along the bottom
set showcmd							" display incomplete commands
set backspace=2						" make backspace work normal
set backspace=indent,eol,start		" allow backspacing over everything in insert mode
set lz								" do not redraw while running macros (much faster) (LazyRedraw)
set nocursorline 		"no high light current row
"set cursorcolumn	"high light current column
"set wildmenu						" turn on wild menu
"set hid							" you can change buffer without saving
"set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
"set report=0 " tell us when anything is changed via :...
"set noerrorbells " don't make noise
" make the splitters between windows be blank
"set fillchars=vert:\ ,stl:\ ,stlnc:\
"set guifont=Lucida_Console:h11
"autocmd GUIEnter * :simalt ~x		"having it auto maximize the screen is annoying

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch						" show matching brackets
set hlsearch						" do highlight searched for phrases
set incsearch						" BUT do highlight as you type you search phrase
"set mat=5 " how many tenths of a second to blink matching brackets for

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tabstop=4						" tab spacing (settings below are just to unify it)
"set softtabstop=4					" unify
"set shiftwidth=4					" unify 
"set cindent							" do c-style indenting
"set autoindent						" always set autoindenting on
"set smartindent						"always set smartindenting on
"set noexpandtab						" real tabs please!
set formatoptions=mtcql				" 方便中文重排設定
"set smarttab						" use tabs at the start of a line, spaces elsewhere

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
"set termencoding=big5
"set encoding=utf-8
"set termencoding=utf-8
"set fileencodings=ucs-bom,utf-8,taiwan,latin1
set fileencodings=utf-8,big5,gbk,latin1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldenable " Turn on folding
"set foldmethod=indent " Make folding indent sensitive
"set foldlevel=100 " Don't autofold anything (but I can still fold manually)
"set foldopen-=search " don't open folds when you search into them
"set foldopen-=undo " don't open folds when you undo stuff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" terminal 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_ti= t_te= " Not erase terminal content 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkey mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Screen fix for map
if &term =~ '^screen'
	set t_k1=^[[11~
	set t_k2=^[[12~
	set t_k3=^[[13~
	set t_k4=^[[14~
endif

map <F1> :make -C %:h <CR>
map <F2> :up<CR>
map <F3> :up<CR>:q<CR>
map <F4> :q!<CR>
"map <F5> :bp<CR> "previous buffer
nnoremap <silent> <F5> :NERDTree<CR>
map <F6> :SyntasticToggleMode<CR>
"" 單鍵 <F7> 控制 syntax on/off。倒斜線是 Vim script 的折行標誌
" 按一次 <F7> 是 on 的話，再按一次則是 off，再按一次又是 on。
" " 原因是有時候顏色太多會妨礙閱讀。
map <F7> :if exists("syntax_on") <BAR>
			\   syntax off <BAR><CR>
			\ else <BAR>
			\   syntax enable <BAR>
			\ endif <CR>
" 按 F8 會在 searching highlight 及非 highlight 間切換
map <F8> :set hls!<BAR>set hls?<CR>
" " Toggle on/off paste mode
map <F9> :set paste!<BAr>set paste?<CR>
set pastetoggle=<F9>
"map <silent> <F10> :call U8Big5()<CR>
map <F10> :set foldmethod=syntax<CR>
map <F11> :set foldmethod=indent<CR>
"map <F11> :set fileencoding=utf-8<CR>echo "FILE Encoding -> UTF-8"
map <F12> :%!xxd -r<CR>    " 回復正常顯示

"quickly resize windows with a vertical split
:map - <C-W>-
:map + <C-W>+ 
"quickly resize windows with a horizontal split
:map <M-<> <C-W><
:map <M->> <C-W>> 
"map alt+a/alt+x as adding/decresing number
":nmap <A-a> <C-a>
":nmap <A-x> <C-x>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Special
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nomodeline "avoid the possibility of trojaned text files.
set nocompatible "(簡寫 set nocp) 設定複製文字存入buffer, 於離開再開啟時可直接貼上(yy,p)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Programming language
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1


" fix for screen
if match($TERM, "screen")!=-1
	set term=xterm
endif
if match($TERM, "tmux")!=-1
	set term=xterm-256color
endif


"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

func B5()
	set enc=big5
	set fileencoding=big5
endf

func U8()
	set enc=utf8
	set fileencoding=utf8
endf

func U8Big5()
	if &encoding == "big5"
		call U8()
		redraw | echohl ModeMsg | echo "UTF-8 Encoding" | echohl None
	else
		call B5()
		redraw | echohl ModeMsg | echo "Big-5 Encoding" | echohl None
	endif
endf

let perl_extended_vars=1 " highlight advanced perl vars inside strings

" 解決一些寬字元被解釋成單字元的問題
if exists("&ambiwidth")
	set ambiwidth=double
endif


set path=./,/home/daniel/src/SUM/scebioscfg_lib/src/,/home/daniel/src/SUM/scebioscfg/src/,/home/daniel/src/SUM/libBase/src/,/home/daniel/src/SUM/libBiosCfg/src
set csprg=gtags-cscope
if executable("gtags-cscope") == 1
	cs add GTAGS
endif
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"execute pathogen#infect()
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_include_dirs = [ '.' ,'/home/daniel/src/SUM/libBase/src/' , '/home/daniel/src/SUM/libBiosCfg/src/' ,  '/home/daniel/src/SUM/scebioscfg_lib/src/' , '/home/daniel/src/SUM/scebioscfg/src/' , '/home/daniel/src/SUM/SUM_Cute_Test/src' ]
"let g:syntastic_cpp_auto_refresh_includes = 1
"let g:syntastic_disabled_filetypes=['cpp']

" --- YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion=['<S-TAB>']

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
"let g:ycm_collect_identifiers_from_tags_files = 1

let @s='cwconst string&2b'
let @v='cwconst vector&2b'
let @e='^wdwhxf_i^M^[j^dt"$hxDddkkpA,^[kJJIthrow ^[jdd'
let @a='s/\.assign(\(.[^)]*\))/ = \1 /g'
let @p='s/\.append(\(.[^)]*\))/ += \1 /g'

augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END
