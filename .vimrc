"
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|
"
" By Marcelo Arteaga

let g:mapleader = ","                                                           "Change leader to comma

"# Sets {{{
set encoding=UTF-8
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
set backspace=indent,eol,start                                                  " Enabling button delete in brew - vim MacOSX 
set timeoutlen=1000 ttimeoutlen=0                                               " Solving problem delay on button ESC - vim MacOSX
set hlsearch


"}}}
"# Plugins {{{
call plug#begin( '~/.config/nvim/bundle')
" Base
Plug 'scrooloose/nerdtree'                                                      " Navegador de directorios
Plug 'Xuyuanp/nerdtree-git-plugin'                                              " Mostrar estados en nerdtree
Plug 'markonm/traces.vim'                                                       " Preview replace substitucion in vim
Plug 'haya14busa/incsearch.vim'                                                 " Highlight on search vim
Plug 'tomtom/tcomment_vim'                                                      " Comentar codigo
Plug 'cohama/lexima.vim'                                                        " Auto cerrar (, {
Plug 'alvan/vim-closetag'                                                       " Auto cerrar html
Plug 'christoomey/vim-tmux-navigator'
" Autocomplete
Plug 'roxma/vim-hug-neovim-rpc'                                                 " Requirement to deoplete
Plug 'roxma/nvim-yarp'                                                          " Requirement to deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }            " Emmet for vim
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }                       " tabnine IA Productivity if dont work, force install ./install.sh
" Third-party
Plug 'dense-analysis/ale'                                                       " Linter for multi-lenguages
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'                                                         " Testing multiple lenguages tt
Plug 'easymotion/vim-easymotion'                                                " Moverse con teclas en la pantalla
Plug 'Shougo/neosnippet'                                                        " Templates snippet for multi-lenguages
Plug 'diepm/vim-rest-console'                                                   " Managing REST Apis in file
" Theme
Plug 'mhartington/oceanic-next'
" Visual
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'                                                   " Icons for vim (nerdtree)
Plug 'bryanmylee/vim-colorscheme-icons'                                         " Icons color schema (vim-devicons)
Plug 'tpope/vim-fugitive'                                                       " Mostrar branch en el airline
Plug 'troydm/zoomwintab.vim'                                                    " Zoom win
" Editor
Plug 'inkarkat/vim-SyntaxRange'                                                 " Manejar contenido mixto js, html en vue por ejemplo
Plug 'tasn/vim-tsx'                                                             " React hightlight
" Plug 'file:////home/jarteaga/MARCELO/CODE/VIMPLUGINS/demoplugin'
" Plug 'othree/yajs.vim'                                                          "Parseador para javascript incluye arrow functions y otros
call plug#end()

"}}}
"# General Config {{{
filetype plugin indent on                                                       "Enable plugins and indents by filetype
let g:plug_shallow = 0
" set termguicolors                                                             "no urxvt
set t_Co=256                                                                    "con urxvt
" set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set relativenumber                                                              "Show numbers relative to current line
set history=500                                                                 "Store lots of :cmdline history
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set background=dark                                                             "Set background to dark
set fillchars+=vert:\│                                                          "Make vertical split separator full line
set pumheight=30                                                                "Maximum number of entries in autocomplete popup
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc
set cursorline                                                                  "Highlight current line
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
" set inccommand=split                                                            "Show substitute changes immidiately in separate split
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
syntax on                                                                       "turn on syntax highlighting

" }}}
"# Turn Off Swap Files {{{
set noswapfile
set nobackup
set nowb
" }}}
"# Persistent Undo {{{
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/vim/backups > /dev/null 2>&1
set undodir=~/.config/vim/backups
set undofile

" }}}
"# Indentation {{{
" https://wiki.python.org/moin/Vim
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=88

autocmd Filetype javascript set softtabstop=2
autocmd Filetype javascript set sw=2
autocmd Filetype javascript set ts=2

" Django recomendations
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" }}}
" ================ Auto commands ====================== {{{

" augroup vimrc
"   autocmd!
" augroup END

" autocmd vimrc FileType php setlocal sw=4 sts=4 ts=4                             "Set indentation to 4 for php
" autocmd vimrc FocusGained,BufEnter * checktime                                  "Refresh file when vim gets focus
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css



" se debe instalar node-plantuml y pacman -Sy jre-openjdk
" npm install node-plantuml -g
" autocmd BufRead,BufNewFile *.puml set filetype=plantuml
" function! PreviewUML()
"   execute "silent !feh --reload 0.1 /tmp/file.png"
" endfunction
" function! Synctex()
"   execute 'silent !puml generate '.@%.' -o /tmp/file.png' 
" endfunction
" autocmd FileType plantuml autocmd BufWritePost <buffer> call Synctex()
"
" autocmd FileType plantuml command! Preview call PreviewUML()
" autocmd FileType plantuml nnoremap<buffer> <Leader>T :call PreviewUML()

" }}}
"# Colorscheme setup {{{
silent! colorscheme OceanicNext 
let g:airline_theme='oceanicnext'

" }}}
" ================ Completion ======================= {{{
" set wildmode=list:full
" set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
" set wildignore+=*.git*
" set wildignore+=*.meteor*
" set wildignore+=*vim/backups*
" set wildignore+=*sass-cache*
" set wildignore+=*cache*
" set wildignore+=*logs*
" set wildignore+=*node_modules/**
" set wildignore+=*DS_Store*
" set wildignore+=*.gem
" set wildignore+=log/**
" set wildignore+=tmp/**
" set wildignore+=*.png,*.jpg,*.gif

" }}}
"# Scrolling {{{
set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5
" }}}
"# Statusline {{{
set statusline=\ %{toupper(mode())}                                             "Mode
set statusline+=\ \│\ %4F                                                       "File path
set statusline+=\ %1*%m%*                                                       "Modified indicator
set statusline+=\ %w                                                            "Preview indicator
set statusline+=\ %r                                                            "Read only indicator
set statusline+=\ %q                                                            "Quickfix list indicator
set statusline+=\ %=                                                            "Start right side layout
set statusline+=\ %{&enc}                                                       "Encoding
set statusline+=\ \│\ %y                                                        "Filetype
set statusline+=\ \│\ %p%%                                                      "Percentage
set statusline+=\ \│\ %l/%L                                                     "Current line number/Total line numbers
set statusline+=\ \│\ %c                                                        "Column number
" set statusline+=\ \│%1*%{ALEGetStatusLine()}%*                                  "Errors count
"}}}
"# Abbreviations {{{
cnoreabbrev t tabe
" }}}
"# Functions {{{
" Creando nuevo tipo de archivo para una extension vue
" autocmd BufRead,BufNewFile *.vue set filetype=vue                               " .config/nvim/syntax/vue/Syntax.Include.vim
autocmd BufRead,BufNewFile *.vue set filetype=html

" function! NERDTreeHighlightFile(extension, fg)                                  " NERDTrees File highlighting color
"   exec 'autocmd filetype nerdtree syn match '. a:extension .' #^\s.*\.\('. substitute(a:extension,'_','\\|','') .'\)$#'
"   " exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg=none ctermfg='. a:fg .' guibg=none guifg='. a:fg
"   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg=black ctermfg='. a:fg .' guibg=red guifg='. a:fg
" endfunction

function! AutoRetabSpaces()
  exec 'set expandtab'
  exec 'retab'
endfunction

" Vim-test addon for vagrant  and .vim.conf
function! VagrantTransform(cmd) abort                                           " Personalized Vagrant env with file .vim.conf
  let s:filepath = fnamemodify('.vim.conf', ':p')
  if filereadable(s:filepath)
    py3 import sys
    py3 import vim
    py3 sys.argv = [vim.eval('s:filepath'), vim.eval('a:cmd')]
    py3file ~/.config/nvim/pyscripts/vim-test/vagrant.py
    return py3eval('pycmd')
  else
    return a:cmd
  endif
endfunction
let g:test#custom_transformations = {'vagrant': function('VagrantTransform')}
let g:test#transformation = 'vagrant'



function s:popup_filter(winid, key) abort
  if a:key ==# "\<c-j>"
    call win_execute(a:winid, "normal! \<c-e>")
  elseif a:key ==# "\<c-k>"
    call win_execute(a:winid, "normal! \<c-y>")
  elseif a:key ==# "\<c-g>"
    call win_execute(a:winid, "normal! G")
  elseif a:key ==# "\<c-t>"
    call win_execute(a:winid, "normal! gg")
  elseif a:key ==# 'q'
    call popup_close(a:winid)
  else
    return v:false
  endif
    return v:true
endfunction

function! DemoPython()
  " call popup_clear()
  " call popup_create("Demo", {'close': 'button', 'border': [0,1,1,0] })
  " py3file ~/demo.py
  let vimrc_buffer = bufnr('~/.vimrc')
  let popup = popup_create(vimrc_buffer, {
    \ 'minwidth': 50,
    \ 'maxwidth': 50,
    \ 'maxheight': 20,
    \ 'border': [],
    \ 'close': 'button',
    \ 'filter': funcref('s:popup_filter'),
    \ 'filtermode': 'n',
    \ 'mapping': v:false,
    \ 'resize': 1,
  \ })
endfunction

" Autocompletado para neosnippet
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

" }}}

nmap <Leader>` :new ~/.config/vim/doc/demo.txt \| set nomodifiable<CR>

"# Custom mappings {{{
noremap <Leader>r :so %<CR>

noremap <Leader>hp :call DemoPython()<CR>

" Comment text editor
nmap <Leader>c :TComment<CR>
xmap <Leader>c :TComment<CR>
nmap <Leader>hc :TCommentBlock<CR>
xmap <Leader>hc :TCommentBlock<CR>

" Auto ajustar los Tab a espacios
" nnoremap <Leader>t :call AutoRetabSpaces()<CR>

" Mostrar los mensajes de error
nnoremap <Leader>e :lopen<CR>
nnoremap <Leader>q :lclose<CR>

" Corregir errores de ALEFix
nmap <silent> ff :ALEFix<CR>

" Tecla para activar los test
nmap <silent> tt :TestNearest<CR>

" Keymap to Help Hotkeys window
" nmap <silent> hh :call HelpHotkeys()<CR>

" nmap <silent> tf :TestFile<CR>
" nmap <silent> ts :TestSuite<CR>
" nmap <silent> tl :TestLast<CR>
" nmap <silent> tg :TestVisit<CR>

" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>

" Open vertical split
nnoremap <Leader>v <C-w>v

" Down is really the next line
" nnoremap j gj
" nnoremap k gk

" Map for Escape key
" inoremap jj <Esc>
" tnoremap <Leader>jj <C-\><C-n>

" Copiar hasta el final de la linea
nnoremap Y y$

" nnoremap <c-v> p:startinsert!<cr>

" Copy/Paste to system clipboard
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <Leader><space> :noh<CR>

" Find current file in NERDTree
" nnoremap <Leader>hn :NERDTreeFind<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

" Hacer zoom en ventana layout
" nnoremap <C-f> :ZoomWinTabToggle<CR>

" Toggle buffer list
nnoremap <C-p> :Files<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bt :BTags<CR>
nnoremap <Leader>bh :History<CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" Generate tags
nnoremap <Leader>gt :sp term://ctags -R --exclude=node_modules .<CR>G

" nmap s <Plug>(easymotion-s2)
nmap s <Plug>(easymotion-overwin-f2)

" map <A-t> :tabnew<CR>

" incsearch finder remap hotkeys
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

nmap <Leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()                                                       " Tool for recover style of current position cursor
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}
"# Plugins setups {{{
" Corrige error de sincronizado de estilos en las sintaxis de nvim
" http://vim.wikia.com/wiki/Fix_syntax_highlighting
" https://gist.github.com/ehamberg/1192882, https://github.com/jceb/vim-orgmode/issues/147
autocmd BufEnter * :syntax sync fromstart

" let g:user_emmet_mode='a'
" let g:user_emmet_leader_key = '<c-e>'                                           "Change trigger emmet key
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

let g:NERDTreeChDirMode = 0                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree

" let g:WebDevIcons_conceal_nerdtree_brackets = 0                                 "Eliminando el padding izquierdo
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
" let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
" let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
let g:deoplete#tag#cache_limit_size = 10000000                                  "Allow tags file up to ~10 MB

let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'python':     ['flake8'],
  \ }                                                                           " Lint js with eslint
let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ "json":       ['prettier'],
    \ 'python':     ['black'],
  \ }                                                                           "Fix eslint errors
let g:ale_javascript_prettier_options = '--print-width 100'                     "Set max width to 100 chars for prettier
let g:ale_lint_on_save = 1                                                      "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_statusline_format =['[%linter%] %d E ', '[%linter%] %d W ', '']                           "Status line texts

let g:tmux_navigator_disable_when_zoomed = 1                                    "Disable tmux navigation on fullscreen

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'                       "Plugin closetags agregando archivos

" call NERDTreeHighlightFile('js_py', 'LightGreen')                               "NERDTress File highlighting
" call NERDTreeHighlightFile('vue', 'LightMagenta')
" call NERDTreeHighlightFile('json', 'LightYellow')
" call NERDTreeHighlightFile('html_css', 'LightCyan')
" call NERDTreeHighlightFile('md', 'LightCyan')

let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets']               "Snippets directory

let g:vrc_show_command = 0                                                      " Mostrar curl en el buffer de salida de Rest Console
let g:vrc_horizontal_split = 1                                                  " Mostrar curl en el buffer de salida de Rest Console

let g:vrc_curl_opts = {
      \ '-i': '',
      \ '-k': '',
    \}                                                                          " Para mostrar la salida en pretty format
call deoplete#custom#var('tabnine', {
\ 'line_limit': 500,
\ 'max_num_results': 20,
\ })

" }}}
" vim:foldenable:foldmethod=marker
" hi Normal guibg=NONE ctermbg=NONE
