
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " get out of horrible vi-compatible mode
set history=50		" keep 50 lines of command line history
set cf " enable error files and error jumping
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set ffs=unix,dos,mac " support all three, in this order
call pathogen#runtime_append_all_bundles()
filetype plugin indent on " detect the type of file and load indent files
"set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark		" we are using a dark background
syntax on				" syntax highlighting on
"color oceandeep			" my theme
if ! has("gui_running")
	set t_Co=256
	set guifont=Consolas:h12:cANSI
endif 
"colorscheme peaksea			" my theme
colorscheme grb256
augroup filetypedetect
	au! BufRead,BufNewFile *.shtml setfiletype php
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup			  				 " make backup file
set backupdir=~/backup/vim/ " where to put backup file
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

map <F1> :make<CR>
map <F2> :up<CR>
map <F3> :up<CR>:q<CR>
map <F4> :q!<CR>
"map <F5> :bp<CR> "previous buffer
nnoremap <silent> <F5> :NERDTree<CR>
"map <F6> :bn<CR> "next buffer
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


set runtimepath^=~/.vim/bundle/ctrlp.vim
