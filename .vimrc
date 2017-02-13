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
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-scripts/a.vim'
Plugin 'aceofall/gtags.vim'
Plugin 'rking/ag.vim'
Plugin 'rdnetto/YCM-Generator'

call vundle#end()  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=50				" keep 50 lines of command line history
set cf 					" enable error files and error jumping
set clipboard+=unnamed 			" turns out I do like is sharing windows clipboard
set ffs=unix,dos,mac 			" support all three, in this order
filetype plugin indent on 		" detect the type of file and load indent files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=light			" we are using a dark background
syntax on				" syntax highlighting on
color  grb256				" my theme
if ! has("gui_running")
	set t_Co=256
endif 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set backup			  	" make backup file
"set backupdir=~/backup/vim/		" where to put backup file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim/UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler				" Always show current positions along the bottom
set showcmd				" display incomplete commands
set backspace=2				" make backspace work normal
set backspace=indent,eol,start		" allow backspacing over everything in insert mode
set lz					" do not redraw while running macros (much faster) (LazyRedraw)
set nocursorline 			" no high light current row
"set cursorcolumn			" high light current column
set wildmenu				" turn on wild menu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch				" show matching brackets
set hlsearch				" do highlight searched for phrases
set incsearch				" BUT do highlight as you type you search phrase


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tabstop=4				" tab spacing (settings below are just to unify it)
"set softtabstop=4			" unify
"set shiftwidth=4			" unify 
"set cindent				" do c-style indenting
"set autoindent				" always set autoindenting on
"set smartindent			" always set smartindenting on
"set noexpandtab			" real tabs please!
set formatoptions=mtcql			" re-format for chinese 
"set smarttab				" use tabs at the start of a line, spaces elsewhere


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8,big5,gbk,latin1
if exists("&ambiwidth")
	set ambiwidth=double
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldenable 			" Turn on folding
"set foldmethod=indent 			" Make folding indent sensitive
"set foldlevel=100 			" Don't autofold anything (but I can still fold manually)
"set foldopen-=search 			" don't open folds when you search into them
"set foldopen-=undo 			" don't open folds when you undo stuff
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" terminal 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_ti= t_te= 			" Not erase terminal content 
if match($TERM, "screen")!=-1
	set term=xterm
endif
if match($TERM, "tmux")!=-1
	set term=xterm-256color
endif


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
nnoremap <silent> <F5> :NERDTree ~/src/SUM/<CR>
map <F6> :SyntasticToggleMode<CR>
map <F7> :if exists("syntax_on") <BAR>
			\   syntax off <BAR><CR>
			\ else <BAR>
			\   syntax enable <BAR>
			\ endif <CR>
map <F8> :set hls!<BAR>set hls?<CR>
map <F9> :set paste!<BAr>set paste?<CR>
set pastetoggle=<F9>
map <F10> :set foldmethod=syntax<CR>
map <F11> :set foldmethod=indent<CR>
map <F12> :%!xxd -r<CR>    



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Programming language
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
let perl_extended_vars=1 " highlight advanced perl vars inside strings



set path=./,/home/daniel/src/SUM/scebioscfg_lib/src/,/home/daniel/src/SUM/scebioscfg/src/,/home/daniel/src/SUM/libBase/src/,/home/daniel/src/SUM/libBiosCfg/src

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
let g:ycm_confirm_extra_conf = [ '/home/daniel/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' ]
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


autocmd BufWritePost $MYVIMRC source $MYVIMRC
