call plug#begin()

" LSP
Plug 'neovim/nvim-lspconfig'

" nerd tree
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

"Plug 'Chiel92/vim-autoformat'
Plug 'rhysd/vim-clang-format'

" swtich between source files and header files quickly.
Plug 'vim-scripts/a.vim'

" Warning for extra space in the end of line
"Plug 'bronson/vim-trailing-whitespace'

" Tag bar display ??
"Plug 'majutsushi/tagbar'

" Move between Vim panes and tmux splits seamlessly
Plug 'christoomey/vim-tmux-navigator'

Plug 'aceofall/gtags.vim'
Plug 'rking/ag.vim'
Plug 'peterhoeg/vim-qml'

" update gtags database in background automatically on file change.
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'zanloy/vim-colors-grb256'
Plug 'nanotech/jellybeans.vim'


"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'mileszs/ack.vim'

Plug 'liuchengxu/vista.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=50				" keep 50 lines of command line history
set cf 					" enable error files and error jumping
set ffs=unix,dos,mac 			" support all three, in this order
filetype plugin indent on 		" detect the type of file and load indent files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors 			" Opaque Background (Comment out to use terminal's profile)
set background=dark			" we are using a dark background
syntax on				" syntax highlighting on
colorscheme gruvbox			" my theme

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim/UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=2				" make backspace work normal
set lz					" do not redraw while running macros (much faster) (LazyRedraw)
set nocursorline        " no high light current row
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
nnoremap <silent> <F5> :NERDTreeFind<CR>
map <F6> :SyntasticToggleMode<CR>
map <F7> :if exists("syntax_on") <BAR>
			\   syntax off <BAR><CR>
			\ else <BAR>
			\   syntax enable <BAR>
			\ endif <CR>
map <F8> :set hls!<BAR>set hls?<CR>
map <F9> :set paste!<BAR>set paste?<CR>
set pastetoggle=<F9>
map <F10> :set foldmethod=syntax<CR>
map <F11> :set foldmethod=indent<CR>
map <F12> :Vista!!<CR>

noremap <C-i> :set foldmethod=syntax<CR>

" ################ vim-clang-format #########################
let g:clang_format#detect_style_file = 1 "Auto detect the style file

" ################ LeaderF #########################
" 定義了 CTRL+P 在當前項目目錄打開文件搜索，
" ALT+M 打開 MRU 搜索，
" ALT+K 打開 檔案搜索，
" ALT+F 打開函數搜索，
" ALT+B 打開 Buffer 搜索，
" ALT+T 打開 Tag 搜索
"let g:Lf_ShortcutF = '<c-p>'
"let g:Lf_ShortcutB = '<m-n>'
"
" noremap <m-m> :LeaderfMru<cr>
" noremap <m-k> :LeaderfFile<cr>
" noremap <m-f> :LeaderfFunction!<cr>
" noremap <m-b> :LeaderfBuffer<cr>
" noremap <m-t> :LeaderfTag<cr>
" 
" let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
" let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
" let g:Lf_WorkingDirectoryMode = 'Ac'
" let g:Lf_WindowHeight = 0.30
" let g:Lf_CacheDirectory = expand('~/.vim/cache')
" let g:Lf_ShowRelativePath = 0
" let g:Lf_HideHelp = 1
" let g:Lf_StlColorscheme = 'powerline'
" let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
" 
" let g:Lf_NormalMap = {
"     \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
"     \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
"     \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
"     \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
"     \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
"     \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
"     \ }


" ################ YouCompleteMe #########################
"let g:ycm_use_clangd = 1
"let g:ycm_clangd_binary_path = exepath("/usr/bin/clangd")
" Let clangd fully control code completion
"let g:ycm_clangd_uses_ycmd_caching = 0

" ################ NERDTree #########################
" ctrl+n open/closes nerd tree
noremap <C-n> :NERDTreeToggle<CR>
" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1

" ################ ack.vim #########################
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ################ vista.vim #########################
let g:vista#renderer#enable_icon = 0 " Disable icon dislay
let g:vista_sidebar_width = 50

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

let g:gutentags_ctags_exclude = [
  \'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv',
  \'*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui',
  \'*.js' ]

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
"let g:deoplete#enable_at_startup = 1
"
lua << EOF
require'lspconfig'.clangd.setup{}
EOF

"if executable('clangd')
"    augroup lsp_clangd
"        autocmd!
"        autocmd User lsp_setup call lsp#register_server({
"                    \ 'name': 'clangd',
"                    \ 'cmd': {server_info->['clangd']},
"                    \ 'whitelist': ['c', 'cpp', 'cc'],
"                    \ })
"        autocmd FileType c setlocal omnifunc=lsp#complete
"        autocmd FileType cpp setlocal omnifunc=lsp#complete
"        autocmd FileType cc setlocal omnifunc=lsp#complete
"    augroup end
"endif

"let g:clang_rename_path = '/usr/bin/clang-rename'
"noremap <leader>rr :py3f /usr/local/clang10/share/clang/clang-rename.py<cr>
"noremap <leader>if :py3f /usr/local/clang10/share/clang/clang-include-fixer.py<cr>


" ################ CoC #########################
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

