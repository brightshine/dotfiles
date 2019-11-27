call plug#begin()
Plug 'gmarik/vundle'

" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" A - for switching between source and header files
Plug 'vim-scripts/a.vim'

Plug 'aceofall/gtags.vim'
Plug 'rking/ag.vim'
Plug 'peterhoeg/vim-qml'
Plug 'ludovicchabant/vim-gutentags'

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim' 

"Plug 'Yggdroot/LeaderF'
"
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


"if has('nvim')
"    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"    Plug 'Shougo/deoplete.nvim'
"    Plug 'roxma/nvim-yarp'
"    Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

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
set termguicolors 			" Opaque Background (Comment out to use terminal's profile)
set background=dark			" we are using a dark background
syntax on				" syntax highlighting on
colorscheme  ayu			" my theme

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim/UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=2				" make backspace work normal
set lz					" do not redraw while running macros (much faster) (LazyRedraw)
set nocursorline 			" no high light current row
"set cursorcolumn			" high light current column
set wildmenu				" turn on wild menu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch				" show matching brackets

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4				" tab spacing (settings below are just to unify it)
set softtabstop=4			" Fine tunes the amount of white space to be added
set shiftwidth=4			" Use 4 white space to shift
"set cindent				" do c-style indenting
"set smartindent			" always set smartindenting on
"set noexpandtab			" real tabs please!
set expandtab				" Replace tab with whitespace
set formatoptions=mtcql		" re-format for chinese 
"set smarttab				" use tabs at the start of a line, spaces elsewhere

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldenable 			" Turn on folding
"set foldmethod=indent 			" Make folding indent sensitive
"set foldlevel=100 			" Don't autofold anything (but I can still fold manually)
"set foldopen-=search 			" don't open folds when you search into them
"set foldopen-=undo 			" don't open folds when you undo stuff
set foldnestmax=5           "deepest fold is 5 levels
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" terminal 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_ti= t_te= 			" Not erase terminal content 
"if match($TERM, "screen")!=-1
"	set term=xterm
"endif
"if match($TERM, "tmux")!=-1
"	set term=xterm-256color
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mouse 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nv                " Mouse in normal visual mode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clipboard 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus   " Use clipboard for all operation


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkey mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F1> :make -C %:h <CR>
map <F2> :up<CR>
map <F3> :up<CR>:q<CR>
map <F4> :q!<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>
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

let g:Lf_ShortcutF = '<C-K>'


" ################ NERDTree #########################
" shift+i (show hidden files)
 
" ctrl+n open/closes nerd tree
noremap <C-n> :NERDTreeToggle<CR>

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show tab number & filename in tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabline=%!MyTabLine()  " custom tab pages line
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

