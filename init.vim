call plug#begin()
Plug 'gmarik/vundle'

" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" Warning for extra space in the end of line
"Plug 'bronson/vim-trailing-whitespace'

" Tag bar display ??
"Plug 'majutsushi/tagbar'

" Move between Vim panes and tmux splits seamlessly
Plug 'christoomey/vim-tmux-navigator'

Plug 'aceofall/gtags.vim'
Plug 'rking/ag.vim'
Plug 'peterhoeg/vim-qml'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" gutentags
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'skywind3000/gutentags_plus'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'tpope/vim-projectionist'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

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
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'

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
" ALT+M 打開 MRU 搜索，
" ALT+K 打開 檔案搜索，
" ALT+F 打開函數搜索，
" ALT+B 打開 Buffer 搜索，
" ALT+T 打開 Tag 搜索
"let g:Lf_ShortcutF = '<c-p>'
"let g:Lf_ShortcutB = '<m-n>'
noremap <m-m> :LeaderfMru<cr>
noremap <m-k> :LeaderfFile<cr>
noremap <m-f> :LeaderfFunction!<cr>
noremap <m-b> :LeaderfBuffer<cr>
noremap <m-t> :LeaderfTag<cr>

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


" ################ YouCompleteMe #########################
let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = exepath("/usr/bin/clangd")
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0

" ################ NERDTree #########################
" shift+i (show hidden files)

" ctrl+n open/closes nerd tree
noremap <C-n> :NERDTreeToggle<CR>

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1



" ----------gutentags.vim插件配置-----------------------------------
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.git']

"" 所生成的數據文件的名稱
let g:gutentags_ctags_tagfile = '.tags'

" 同時開啟 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 配置 ctags 的參數
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_plus_nomap = 1

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自動加載 gtags 數據庫的行為
" 避免多個項目數據庫相互干擾,使用plus插件解決問題
let g:gutentags_auto_add_gtags_cscope = 0

"let g:gutentags_define_advanced_commands = 1

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
"yum install -y global-ctags
" REF http://oenhan.com/vim8-c-ide-plugin-vimrc
"set tags=./.tags;,.tags
"let $GTAGSLABEL = 'pygments'
"let $GTAGSCONF = '/etc/gtags.conf'
"
"
"
"" 將自動生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目錄中，避免污染工程目錄
"let g:gutentags_cache_dir = expand('~/.cache/tags')
"
"

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

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'cc'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType cc setlocal omnifunc=lsp#complete
    augroup end
endif

let g:clang_rename_path = '/usr/bin/clang-rename'
noremap <leader>rr :py3f /usr/local/clang10/share/clang/clang-rename.py<cr>
noremap <leader>if :py3f /usr/local/clang10/share/clang/clang-include-fixer.py<cr>
