:let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog='/usr/bin/python'
set nocompatible               " be iMproved
filetype off                   " required!

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"   PlugInstall [name ...] [#threads] 	Install plugins

" PlugUpdate [name ...] [#threads] 	Install or update plugins
" PlugClean[!] 	Remove unused directories (bang version will clean without prompt)
" PlugUpgrade 	Upgrade vim-plug itself
" PlugStatus 	Check the status of plugins
" PlugDiff 	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]<Paste>PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]    Install or update plugins
" PlugClean[!]	Remove unused directories (bang version will clean without prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus  Check the status of plugins
" PlugDiff    Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]
call plug#begin('~/.vim/plugged')

Plug 'EduardoBautista/grb256'
Plug 'aceofall/gtags.vim'
Plug 'gmarik/vundle'
Plug 'kana/vim-operator-user'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'rhysd/vim-clang-format'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/a.vim'

" Initialize plugin system
call plug#end()


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
set softtabstop=4			" unify
set shiftwidth=4			" unify 
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
nnoremap <silent> <F5> :NERDTreeToggle ~/src/SUM/scebioscfg_lib/src<CR>
"nnoremap <silent> <F5> :NERDTreeToggle<CR>
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

autocmd FileType c,cpp,objc map <buffer> = <Plug>(operator-clang-format)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Programming language
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
let perl_extended_vars=1 " highlight advanced perl vars inside strings


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GTags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:set cscopeprg=gtags-cscope
":cs add /home/daniel/src/SUM/tags
let GTAGSLABEL = 'native-pygments'
let GTAGSDBPATH = '/home/daniel/src/SUM'
let GTAGSROOT = '/home/daniel/src/SUM'
set csre
":cs add GTAGS


set path=./,/home/daniel/src/SUM/scebioscfg_lib/src/,/home/daniel/src/SUM/scebioscfg/src/,/home/daniel/src/SUM/libBase/src/,/home/daniel/src/SUM/libBiosCfg/src

" --- YouCompleteMe
let g:ycm_confirm_extra_conf = [ '/home/daniel/.ycm_extra_conf.py' ]
" let g:ycm_key_list_select_completion = ['<TAB>']
" let g:ycm_key_list_previous_completion=['<S-TAB>']

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
"let g:ycm_collect_identifiers_from_tags_files = 1

let @s='cwconst string&2b'
let @v='cwconst vector&2b'
let @e='^wdwhxf_i^M^[j^dt"$hxDddkkpA,^[kJJIthrow ^[jdd'
let @a='s/\.assign(\(.[^)]*\))/ = \1 /g'
let @p='s/\.append(\(.[^)]*\))/ += \1 /g'


" Remove .assign()
let @p='V:s/).append(/ + /g2bj'
let @o='V:s/.assign(/(/g2bj'
let @i='Iconst string '
let @l='V:s/<</+/g2bj^'
let @k='^whxxxi(2b$i)Iconst string2b'
let @e='V:s/endl/"\\n"/g2bj^'

let @v=':s/..*=\(..*\);/\1,/g2b'



let @t='dt(xf)xi.data()^['
" remove CUtil::getVec...


autocmd BufWritePost $MYVIMRC source $MYVIMRC

let g:ctrlsf_default_root = 'project'



autocmd BufWritePost $MYVIMRC source $MYVIMRC
