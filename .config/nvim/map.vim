" Hotkeys vim
nnoremap a a| "                         (Append)
nnoremap A A| "                         (Append at EOL)
nnoremap c c| "                         (Cut selection)
nnoremap d d| "                         (Delete)
nnoremap e :call <SID>show_documentation()<CR>| " (Show doc func)
nnoremap p p| "                         (Paste)
nnoremap i i| "                         (Insert mode)
nnoremap o o| "                         (Insert below)
nnoremap O O| "                         (Insert above)
nnoremap x x| "                         (Delete char)
nnoremap X X| "                         (Backspace)
nnoremap v v| "                         (Visual mode)
nnoremap y y| "                         (Copy selection)
nnoremap j j| "                         (Move down)
nnoremap k k| "                         (Move up)
nnoremap l l| "                         (Move right)
nnoremap h h| "                         (Move left)
nnoremap u :undo<CR>| "                 (Undo)
nnoremap U :redo<CR>| "                 (Redo)
nnoremap z :ZoomWinTabToggle<CR>| "     (Zoom tab)
nnoremap s :w<CR>| "                    (Save)
nmap     f <Plug>(coc-format)| "        (Format code)
nmap     r <Plug>(coc-rename)| "        (Rename var)

nnoremap w viw| "                       (Select word)
nnoremap " vi"| "                       (Select word into "")
nnoremap ' vi'| "                       (Select word into '')
nnoremap ( vi(| "                       (Select word into ())
nnoremap [ vi[| "                       (Select word into [])
nnoremap < vi<| "                       (Select word into <>)

nnoremap H b| "                         (Jump right)
nnoremap J }| "                         (Jump down)
vnoremap J :m '>+1<CR>gv=gv| "          (Move down sel word)
vnoremap K :m '<-2<CR>gv=gv| "          (Move up sel word)
nnoremap K {| "                         (Jump up)
nnoremap L w| "                         (Jump left)
nmap S <Plug>(easymotion-overwin-f2)| " (Goto char)

nnoremap <C-p> :Files<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
