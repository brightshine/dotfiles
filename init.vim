call plug#begin()
Plug 'gmarik/vundle'

" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" A - for switching between source and header files
Plug 'vim-scripts/a.vim'

" Warning for extra space in the end of line
Plug 'bronson/vim-trailing-whitespace'

" Tag bar display ??
"Plug 'majutsushi/tagbar'

" Move between Vim panes and tmux splits seamlessly
Plug 'christoomey/vim-tmux-navigator'

Plug 'aceofall/gtags.vim'
Plug 'rking/ag.vim'
Plug 'peterhoeg/vim-qml'

" gutentags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"""""""""""""""""" TO LEARN """""""""""""""""""""""""""""""""""""""
" Async plugin for vim and neovim to ease the use of ctags/gtags
"Plug 'jsfaint/gen_tags'
"
" Neovim thin wrapper for GDB, LLDB and PDB
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
"
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
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

" ################ LeaderF #########################
" 定義了 CTRL+P 在當前項目目錄打開文件搜索，
" CTRL+N 打開 MRU 搜索，
" ALT+P 打開函數搜索，
" ALT+N 打開 Buffer 搜索，
" ALT+M 打開 Tag 搜索
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }


" ################ NERDTree #########################
" shift+i (show hidden files)

" ctrl+n open/closes nerd tree
noremap <C-n> :NERDTreeToggle<CR>

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1


" ################ AirLine #########################
" set status line
set laststatus=0
" enable powerline-fonts
let g:airline_powerline_fonts = 0

let g:airline#extensions#tabline#enabled = 1

" vim airline fonts
if !exists('g:airline_symbols')
	let g:airline_symbols= {}
endif

" unicode symbols
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1

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


" ----------gutentags.vim插件配置-----------------------------------
"yum install -y global-ctags
" REF http://oenhan.com/vim8-c-ide-plugin-vimrc
set tags=./.tags;,.tags
let $GTAGSLABEL = 'pygments'
let $GTAGSCONF = '/etc/gtags.conf'

" gutentags 搜索工程目錄的標誌，當前文件路徑向上遞歸直到碰到這些文件/目錄名
let g:gutentags_project_root = ['.git','.root','.svn','.hg','.project']

" 所生成的數據文件的名稱
let g:gutentags_ctags_tagfile = '.tags'

" 同時開啟 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 將自動生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目錄中，避免污染工程目錄
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的參數
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自動加載 gtags 數據庫的行為
" 避免多個項目數據庫相互干擾,使用plus插件解決問題
let g:gutentags_auto_add_gtags_cscope = 0

"let g:gutentags_define_advanced_commands = 1

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" default keymap
"<leader>cs    Find symbol (reference) under cursor
"<leader>cg    Find symbol definition under cursor
"<leader>cd    Functions called by this function
"<leader>cc    Functions calling this function
"<leader>ct    Find text string under cursor
"<leader>ce    Find egrep pattern under cursor
"<leader>cf    Find file name under cursor
"<leader>ci    Find files #including the file name under cursor
"<leader>ca    Find places where current symbol is assigned
"
" ################ Deoplete #########################
let g:deoplete#enable_at_startup = 1
