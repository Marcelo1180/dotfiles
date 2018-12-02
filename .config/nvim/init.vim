let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable

" ================ Plugins ==================== {{{
call plug#begin( '~/.config/nvim/bundle')

" Base
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'                                                      " Comentar codigo
Plug 'inkarkat/vim-SyntaxRange'                                                 " Manejar contenido mixto js, html en vue por ejemplo
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale', { 'do': 'npm install -g prettier' }
Plug 'easymotion/vim-easymotion'                                                "Moverse con teclas en la pantalla
Plug 'Shougo/neosnippet'
" Tema
Plug 'mhartington/oceanic-next'
" Visual
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'                                                         " Mostrar los codigos de colores con colores
Plug 'ryanoasis/vim-devicons'                                                   " Iconos en vim
Plug 'tpope/vim-fugitive'                                                       " Mostrar branch en el airline
Plug 'troydm/zoomwintab.vim'                                                    " Zoom win
" Editor
Plug 'cohama/lexima.vim'                                                        " Auto cerrar (, {
Plug 'alvan/vim-closetag'                                                       " Auto cerrar html
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }
" Others
Plug 'vimwiki/vimwiki'
Plug 'janko-m/vim-test'

Plug 'jaxbot/browserlink.vim'                                                   " Instalar su TamperMonkey y copiar el script de la pagina despues levanta con python la pagina web

" Plug 'file:////home/jarteaga/MARCELO/CODE/VIMPLUGINS/demoplugin'
" Plug 'othree/yajs.vim'                                                          "Parseador para javascript incluye arrow functions y otros

" TODO: quiero un plugin que haga un find and replace tipo el %s/ que
" previsualize la expresion regular antes de reemplazar un preview en todos
" los archivos, este comando hace eso pero quiero que previsualize
" http://vim.wikia.com/wiki/VimTip382
" Suppose all *.cpp and *.h files in the current directory need to be changed (not subdirectories). One approach is to use the argument list (arglist):
" :arg *.cpp	All *.cpp files in current directory.
" :argadd *.h	And all *.h files.
" :arg	Optional: Display the current arglist.
" :argdo %s/pattern/replace/ge | update

call plug#end()
"}}}
" ================ General Config ==================== {{{
filetype plugin indent on                                                       "Enable plugins and indents by filetype

let g:mapleader = ","                                                           "Change leader to a comma
let g:plug_shallow = 0

" set termguicolors                                                             "no urxvt
set t_Co=256                                                                    "con urxvt
set title                                                                       "change the terminal's title
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
set inccommand=split                                                            "Show substitute changes immidiately in separate split
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
syntax on                                                                       "turn on syntax highlighting

" }}}
" ================ Turn Off Swap Files ============== {{{
set noswapfile
set nobackup
set nowb

" }}}
" ================ Persistent Undo ================== {{{
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" }}}
" ================ Indentation ====================== {{{
" https://wiki.python.org/moin/Vim
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=80

autocmd Filetype javascript set softtabstop=2
autocmd Filetype javascript set sw=2
autocmd Filetype javascript set ts=2

" syntax region markdownBlock matchgroup=Comment start=/^\/\/{{{$/ end=/^\/\/}}}$/ contains=@Markdown
" syn match celString start="//inicio" end="//fin" contains=bufok,buferr 
" }}}
" ================ Auto commands ====================== {{{
augroup vimrc
  autocmd!
augroup END

autocmd vimrc FileType php setlocal sw=4 sts=4 ts=4                             "Set indentation to 4 for php
autocmd vimrc FocusGained,BufEnter * checktime                                  "Refresh file when vim gets focus
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" }}}
" ================ Colorscheme setup ================ {{{
silent! colorscheme OceanicNext 
let g:airline_theme='oceanicnext'

" }}}
" ================ Completion ======================= {{{
set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" }}}
" ================ Scrolling ======================== {{{
set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" }}}
" ================ Statusline ======================== {{{
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
set statusline+=\ \│%1*%{ALEGetStatusLine()}%*                                  "Errors count

"}}}
" ================ Abbreviations ==================== {{{
cnoreabbrev bda BufOnly
cnoreabbrev t tabe

" }}}
" ================ Functions ======================== {{{
" Creando nuevo tipo de archivo para una extension vue
" autocmd BufRead,BufNewFile *.vue set filetype=vue                               " .config/nvim/syntax/vue/Syntax.Include.vim
autocmd BufRead,BufNewFile *.vue set filetype=html

function! NERDTreeHighlightFile(extension, fg)                                  " NERDTrees File highlighting color
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s.*\.\('. substitute(a:extension,'_','\\|','') .'\)$#'
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg=none ctermfg='. a:fg .' guibg=none guifg='. a:fg
endfunction

function! AutoRetabSpaces()
  exec 'set expandtab'
  exec 'retab'
endfunction

function! DemoPython()
  pyfile ~/.dotfiles/demo.py
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
" ================ Custom mappings ======================== {{{
noremap <Leader>r :so %<CR>

noremap <Leader>hp :call DemoPython()<CR>

" Comment text editor
nmap <Leader>c :TComment<CR>
xmap <Leader>c :TComment<CR>
nmap <Leader>hc :TCommentBlock<CR>
xmap <Leader>hc :TCommentBlock<CR>

" Auto ajustar los Tab a espacios
nnoremap <Leader>t :call AutoRetabSpaces()<CR>

" Mostrar los mensajes de error
nnoremap <Leader>e :lopen<CR>
nnoremap <Leader>q :lclose<CR>

" Corregir errores de ALEFix
nnoremap <Leader>he :ALEFix<CR>

" Tecla para activar los test
nmap <silent> tt :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tg :TestVisit<CR>

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
inoremap jj <Esc>
tnoremap <Leader>jj <C-\><C-n>

" Copiar hasta el final de la linea
nnoremap Y y$

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
nnoremap <Leader>hn :NERDTreeFind<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

" Hacer zoom en ventana layout
nnoremap <A-f> :ZoomWinTabToggle<CR>

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

" Buscar tareas pendientes
nnoremap <F3> :Ag TODO<CR>

" Buscar tareas pendientes
nnoremap <F4> :!npm run lint<CR>
nnoremap <F5> :!npm run lint -- --fix<CR>

" nmap s <Plug>(easymotion-s2)
nmap s <Plug>(easymotion-overwin-f2)

map <A-t> :tabnew<CR>

nmap <Leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" }}}
" ================ Plugins setups ======================== {{{
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

let g:WebDevIcons_conceal_nerdtree_brackets = 0                                 "Eliminando el padding izquierdo
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
let g:deoplete#tag#cache_limit_size = 10000000                                  "Allow tags file up to ~10 MB

let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}                       "Fix eslint errors
let g:ale_javascript_prettier_options = '--print-width 100'                     "Set max width to 100 chars for prettier
let g:ale_lint_on_save = 1                                                      "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_statusline_format =[' %d E ', ' %d W ', '']                           "Status line texts

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]                            "Use dropbox folder for easier syncing of wiki

let g:tmux_navigator_disable_when_zoomed = 1                                    "Disable tmux navigation on fullscreen

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'                       "Plugin closetags agregando archivos

call NERDTreeHighlightFile('js_py', 'LightGreen')                               "NERDTress File highlighting
call NERDTreeHighlightFile('vue', 'LightMagenta')
call NERDTreeHighlightFile('json', 'LightYellow')
call NERDTreeHighlightFile('html_css', 'LightCyan')
call NERDTreeHighlightFile('md', 'LightCyan')

let g:multi_cursor_next_key='f'                                                 "Tecla para crear multiples cursores
let g:multi_cursor_skip_key='F'

let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets']               "Snippets directory

let test#javascript#ava#options = '--verbose'
" let test#ruby#rspec#options = {
"   'nearest': '--backtrace',
"   'file':    '--format documentation',
"   'suite':   '--tag ~slow',
" }

" }}}
" vim:foldenable:foldmethod=marker
hi Normal guibg=NONE ctermbg=NONE
