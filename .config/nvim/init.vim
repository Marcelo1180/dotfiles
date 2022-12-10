"
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|
"
" By Marcelo Arteaga

let g:mapleader = ","
set encoding=UTF-8
syntax enable

let g:python3_host_prog = '/Users/marcelo/.pyenv/shims/python'
  "# Plugins {{{
  call plug#begin( '~/.config/nvim/bundle')
  " Base
  Plug 'scrooloose/nerdtree'                                                      " Navegador de directorios
  Plug 'Xuyuanp/nerdtree-git-plugin'                                              " Mostrar estados en nerdtree
  Plug 'tomtom/tcomment_vim'                                                      " Comentar codigo
  Plug 'cohama/lexima.vim'                                                        " Auto cerrar (, {
  Plug 'alvan/vim-closetag'                                                       " Auto cerrar html
  Plug 'christoomey/vim-tmux-navigator'
  " Autocomplete
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Third-party
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'janko-m/vim-test'                                                         " Testing multiple lenguages tt
  Plug 'easymotion/vim-easymotion'                                                " Moverse con teclas en la pantalla
  " Plug 'diepm/vim-rest-console'                                                   " Managing REST Apis in file
  " Plug 'SirVer/ultisnips'
  Plug 'troydm/zoomwintab.vim'                                                    " Zoom win
  Plug 'rhysd/devdocs.vim'                                                        " DevDocs

  " Theme
  Plug 'mhartington/oceanic-next'
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'                                                   " Icons for vim (nerdtree)
  Plug 'bryanmylee/vim-colorscheme-icons'                                         " Icons color schema (vim-devicons)
  Plug 'tpope/vim-fugitive'                                                       " Mostrar branch en el airline
  " Editor
  Plug 'inkarkat/vim-SyntaxRange'                                                 " Manejar contenido mixto js, html en vue por ejemplo
  " Plug 'tasn/vim-tsx'                                                             " React hightlight
  
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  " Plug 'dart-lang/dart-vim-plugin'                                                " Dart highlight
  " Plug 'yuezk/vim-js'                                                             " React suggested by vim-jsx-pretty
  " Plug 'maxmellon/vim-jsx-pretty'                                                 " React highlight

  " Plug 'file:////home/jarteaga/MARCELO/CODE/VIMPLUGINS/demoplugin'
  call plug#end()

  "}}}
"# General Config {{{
let g:coc_disable_startup_warning = 1                                           "Disable coc warning at start
filetype plugin indent on                                                       "Enable plugins and indents by filetype
let g:plug_shallow = 0
set inccommand=nosplit                                                          "preview search and replace
" set t_Co=256                                                                    "con urxvt
set number                                                                      "Line numbers are good
" set relativenumber                                                              "Show numbers relative to current line
" set history=500                                                                 "Store lots of :cmdline history
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
" set background=dark                                                             "Set background to dark
set fillchars+=vert:\│                                                          "Make vertical split separator full line
" set pumheight=30                                                                "Maximum number of entries in autocomplete popup
" set exrc                                                                        "Allow using local vimrc
" set secure                                                                      "Forbid autocmd in local vimrc
set cursorline                                                                  "Highlight current line
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate set splitright                                                      
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
" silent !mkdir ~/.config/vim/backups > /dev/null 2>&1
" set undodir=~/.config/vim/backups
" set undofile

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

autocmd BufRead,BufNewFile Vagrantfile set ft=ruby

" }}}
"# Colorscheme setup {{{
silent! colorscheme OceanicNext 
let g:airline_theme='oceanicnext'
" }}}
"# Scrolling {{{
" set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
" set sidescrolloff=15
" set sidescroll=5
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
" cnoreabbrev t tabe
" }}}
"# Functions {{{
" Creando nuevo tipo de archivo para una extension vue
autocmd BufRead,BufNewFile *.vue set filetype=html

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" " Autocompletado para neosnippet
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \ : pumvisible() ? "\<C-n>" : "\<TAB>"
" " If popup window is visible do autocompletion from back
" imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" " Fix for jumping over placeholders for neosnippet
" smap <expr><TAB> neosnippet#jumpable() ?
" \ "\<Plug>(neosnippet_jump)"
" \: "\<TAB>"
"
"
" " Coc autocompletion TAB
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" }}}


" nmap <Leader>` :new ~/.config/vim/doc/demo.txt \| set nomodifiable<CR>
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)



" nnoremap u :Buffers<CR>

" nnoremap e y
" map E "+y

" nnoremap r :so %<CR>

" nnoremap t :bp<CR>
" nnoremap T :bp<CR>

" nnoremap P <Esc>"+p

" noremap d d
"
" noremap g g


" nnoremap F C









"# Custom mappings {{{
" noremap <Leader>r :so %<CR>

" noremap <Leader>hp :call DemoPython()<CR>

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
" nmap <silent> ff :ALEFix<CR>

" Tecla para activar los test
nmap <silent> tt :TestNearest<CR>

" Key for call dash documentation
nmap <c-d> :Dash<CR>

" Keymap to Help Hotkeys window
" nmap <silent> hh :call HelpHotkeys()<CR>

" nmap <silent> tf :TestFile<CR>
" nmap <silent> ts :TestSuite<CR>
" nmap <silent> tl :TestLast<CR>
" nmap <silent> tg :TestVisit<CR>
"

vnoremap <silent> <F5> :<C-U>call MyFunc()<CR>
function! MyFunc()
    let m = visualmode()
    if m ==# 'v'
        echo 'character-wise visual'
    elseif m == 'V'
        echo 'line-wise visual'
    elseif m == "\<C-V>"
        echo 'block-wise visual'
    endif
endfunction


map 'r' :so ~/.config/nvim/init.vim<CR>
" Map save to Ctrl + S

imap <c-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>

" Open vertical split
nnoremap <Leader>v <C-w>v

" Down is really the next line
" nnoremap j gj
" nnoremap k gk

" Copiar hasta el final de la linea
nnoremap Y y$

" nnoremap <c-v> p:startinsert!<cr>

" Copy/Paste to system clipboard
vnoremap <C-c> "+y


nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p

" Move selected lines up and down
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <Leader><space> :noh<CR>

" Find current file in NERDTree
" nnoremap <Leader>hn :NERDTreeFind<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

" Hacer zoom en ventana layout


" Toggle buffer list

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
" nnoremap + <c-w>5>
" nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" Generate tags
" nnoremap <Leader>gt :sp term://ctags -R --exclude=node_modules .<CR>G

" --------------------------------------------------------
" COC-VIM TAB SETTINGS START
"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" /
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" COC-VIM TAB SETTINGS END
" --------------------------------------------------------
" Prevent problem with TAB completion to coc-vim
let g:UltiSnipsExpandTrigger="<Nop>"

" nmap s <Plug>(easymotion-s2)


" map <A-t> :tabnew<CR>

" nmap <Leader>sp :call <SID>SynStack()<CR>
" function! <SID>SynStack()                                                       " Tool for recover style of current position cursor
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc
" }}}
"# Plugins setups {{{
" Corrige error de sincronizado de estilos en las sintaxis de nvim
" http://vim.wikia.com/wiki/Fix_syntax_highlighting
" https://gist.github.com/ehamberg/1192882, https://github.com/jceb/vim-orgmode/issues/147
autocmd BufEnter * :syntax sync fromstart

let g:NERDTreeChDirMode = 0                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree

" let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
" let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
" let g:deoplete#tag#cache_limit_size = 10000000                                  "Allow tags file up to ~10 MB

" let g:ale_linters = {
"     \ 'javascript': ['eslint'],
"     \ 'python':     ['flake8'],
"   \ }                                                                           " Lint js with eslint
" let g:ale_fixers = {
"     \ 'javascript': ['prettier', 'eslint'],
"     \ "json":       ['prettier'],
"     \ 'python':     ['black'],
"   \ }                                                                           "Fix eslint errors
" let g:ale_javascript_prettier_options = '--print-width 100'                     "Set max width to 100 chars for prettier
" let g:ale_lint_on_save = 1                                                      "Lint when saving a file
" let g:ale_sign_error = '✖'                                                      "Lint error sign
" let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
" let g:ale_statusline_format =['[%linter%] %d E ', '[%linter%] %d W ', '']                           "Status line texts

let g:tmux_navigator_disable_when_zoomed = 1                                    "Disable tmux navigation on fullscreen

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'                       "Plugin closetags agregando archivos

" call NERDTreeHighlightFile('js_py', 'LightGreen')                               "NERDTress File highlighting
" call NERDTreeHighlightFile('vue', 'LightMagenta')
" call NERDTreeHighlightFile('json', 'LightYellow')
" call NERDTreeHighlightFile('html_css', 'LightCyan')
" call NERDTreeHighlightFile('md', 'LightCyan')

" let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
" let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets']               "Snippets directory

let g:vrc_show_command = 0                                                      " Mostrar curl en el buffer de salida de Rest Console
let g:vrc_horizontal_split = 1                                                  " Mostrar curl en el buffer de salida de Rest Console

let g:vrc_curl_opts = {
      \ '-i': '',
      \ '-k': '',
    \}                                                                          " Para mostrar la salida en pretty format
" call deoplete#custom#var('tabnine', {
" \ 'line_limit': 500,
" \ 'max_num_results': 20,
" \ })

let g:dart_style_guide = 2
let g:dart_format_on_save = 1

" }}}


" Use K to show documentation in preview window
" nnoremap <silent> gk :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


source /Users/marcelo/.config/nvim/map.vim
" vim:foldenable:foldmethod=marker
" hi Normal guibg=NONE ctermbg=NONE
"
" hai Quote ctermbg=109 guifg=#83a598
