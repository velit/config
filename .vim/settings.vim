let $LANG = 'en_US'
set autoindent
set backspace=indent,eol,start
set completeopt=longest,menu
set confirm
set directory=$MYVIMFOLDER/temp/swap//,.,~/tmp,/var/tmp,/tmp
set encoding=utf-8
set expandtab shiftwidth=4 softtabstop=4 tabstop=8
set formatoptions+=l
set gdefault
set guioptions-=L
set guioptions-=T
set guioptions-=m
set guioptions-=r
set history=100
set hlsearch
set ignorecase
set incsearch
set langmenu=en_US
set listchars=tab:►\ ,nbsp:·,trail:·,precedes:<,extends:>,eol:¬
set mouse=a ttymouse=xterm2
set modeline
set nohidden
set nolist
set nowrap
set numberwidth=2
set pastetoggle=<F12>
set ruler
set rulerformat=%50(%=%f\ %m%r\ %-11.(%l,%c%V%)\ %Y\ %P%)
set scrolljump=-10
set scrolloff=0
set sessionoptions-=options
set showbreak=>\ 
set showcmd
set smartcase
set splitbelow splitright
set statusline=%<%f\ %m%r%=\ %-14.(%l,%c%V%)\ %Y\ %P
set synmaxcol=5000
set tabpagemax=99
set textwidth=79
set timeoutlen=600
set undodir=$MYVIMFOLDER/temp/undo//,.
set undofile
set viminfo+=n$MYVIMFOLDER/viminfo
set wildignore+=*.o,*.obj,*.bak,*.exe,*.pyc,*.class
set wildmenu
set wildmode=longest:list
set wrap
set wrapscan
"silent! set new-option

syntax on
filetype plugin indent on
colorscheme tappi

" Leader maps
nmap <Space> <Nop>
let mapleader = "\<Space>"

noremap <Leader>j <C-]>
noremap <Leader>k <C-[>

nnoremap <Leader>h :vnew <Bar> H 
nnoremap <Leader>H :tabnew <Bar> H 
nnoremap <Leader>c :%s###<Left>
nnoremap <Leader>r :!%:p 

nnoremap <silent> <Leader>l :set list!<CR>
nnoremap <silent> <Leader>n :set number!<CR>
nnoremap <silent> <Leader>w :set wrap!<CR>
nnoremap <silent> <Leader>d :tab sp <Bar> tabm99<CR>
nnoremap <silent> <Leader>z :tabe $MYVIMFOLDER/settings.vim <Bar> vs $MYVIMFOLDER/plug.vim<CR><C-w>h
nnoremap <silent> <Leader>Z :source $MYVIMRC <Bar> filetype detect<CR>:echo 'vimrc reloaded'<CR>
nnoremap <silent> <Leader>p :call <SID>setup_one_action_paste()<CR>o
nnoremap <silent> <Leader>P :call <SID>setup_one_action_paste()<CR>i

vnoremap <Leader>s y$?\V<C-r>"<CR>
vnoremap <Leader>w y?\V\<<C-r>"\><CR>

nnoremap <Leader><Leader>c :cd %:h <Bar> pwd<CR>
nnoremap <Leader><Leader>v :lcd %:h <Bar> pwd<CR>
nnoremap <Leader><Leader>s :mksession! $MYVIMFOLDER/temp/session.vim<CR>
nnoremap <Leader><Leader>o :source $MYVIMFOLDER/temp/session.vim<CR>
nmap <silent> <Leader><Leader>C :source $MYVIMFOLDER/colors/tappi.vim <BAR> only <Bar> e $MYVIMFOLDER/colors/tappi.vim <Bar> so $VIMRUNTIME/syntax/hitest.vim<CR><C-w>L<C-w>h

" Insert maps
inoremap <S-Tab> <BS>
inoremap <C-c> <Esc>
inoremap <Esc> <C-c>
inoremap <C-s> <Esc>:update<CR>
inoremap <expr><C-h> BackspaceIgnoreIndent()

" Normal / Visual / Operator pending maps
noremap j gj
noremap k gk
noremap <C-p> <C-i>
noremap <C-h> gT
noremap <C-l> gt
noremap <C-k> <C-w>w
noremap <C-j> <C-w>W
noremap <M-h> ^
noremap <M-l> $
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt
noremap <M-0> 10g
noremap <silent><C-e> 5<C-e>
noremap <silent><C-y> 5<C-y>
noremap <silent>Q <C-W>z<C-l>:nohl<CR>:match<CR>
noremap , ;
noremap ; ,
noremap / /\v
noremap ? ?\v

" Normal mode mappings
noremap <M-k> >>
noremap <M-j> <<
nnoremap <F1> :cp<CR>
nnoremap <F2> :cn<CR>
nnoremap <F3> :cl<CR>
nnoremap <F4> :clast<CR>
nnoremap <F5> :call DebugVim("./pyrl.py")<CR>
nnoremap <F6> :compiler pytest-3<CR>:make<CR>
nnoremap <F7> :call DebugVim("./sdlpyrl.py")<CR>
nnoremap <M-q> :qa<CR>
nnoremap <M-z> :tabclose<CR>
nnoremap <M-x> :close<CR>
nnoremap <C-s> :update<CR>
nnoremap <C-w>m :vnew<CR>
nnoremap <C-w><C-m> :vnew<CR>
nnoremap <C-w>t :tabnew<CR>
nnoremap <C-w><C-m> :tabnew<CR>

nnoremap <silent><CR> o<C-c>
nnoremap <silent>Y y$
nnoremap <silent>yY 0y$

" Visual mode mappings
vnoremap <M-k> >gv
vnoremap <M-j> <gv
vnoremap <Leader>c :s###<Left>

" Easier movement sometimes
noremap! <M-h> <Left>
noremap! <M-l> <Right>
noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-C-h> <Home>
noremap! <M-C-l> <End>
noremap! <M-C-j> <S-Left>
noremap! <M-C-k> <S-Right>

" Autocmds
augroup vimrc
    autocmd!
    autocmd FileType python call PythonOptions()
    autocmd FileType java call JavaOptions()
    autocmd FileType jsp call JavaOptions()
    autocmd FileType javascript call JavaOptions()

    autocmd VimResized * call OptimizeSmallScreen()
    "autocmd BufWritePost * match ExtraWhitespace /\s\+\%#\@<!$/
augroup end

" Custom commands and functions
runtime ftplugin/man.vim
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! RemoveTrailingWhitespace %s/\s\+$//
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>

function! PythonOptions()
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal tabstop=8
    setlocal complete+=t
    setlocal commentstring=#%s
    setlocal textwidth=100
    setlocal define=^\s*\\(def\\\\|class\\)

    " Python efm
    setlocal efm+=%E\ \ File\ \"%f\"\\,\ line\ %l%.%#
    setlocal efm+=%C\ \ \ \ %.%#
    setlocal efm+=%Z%m
    setlocal efm+=%-GTraceback\ (most\ recent\ call\ last):

endfunction

function! JavaOptions()
    setlocal noexpandtab
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal tabstop=4
    setlocal textwidth=120
    inoremap <C-@> <C-x><C-u>
    nnoremap öi :JavaImport<CR>

endfunction

function! OptimizeSmallScreen()
    if &lines < 45
        set cmdheight=1
        set laststatus=0
    else
        set cmdheight=2
        set laststatus=2
    endif
endfunction
call OptimizeSmallScreen()

function! BackspaceIgnoreIndent()
    if search('^\s\+\%#', 'bn') != 0
        return "\<c-u>\<c-h>"
    else
        return "\<c-h>"
    endif
endfunction

function! DebugVim(target)
    if executable("./debug_vim")
        execute("!./debug_vim " . a:target)
        if filereadable("errors.err")
            cf errors.err
            clast
        endif
    else
        make
    endif
endfunction

function! s:setup_one_action_paste() abort
  let s:paste = &paste
  let s:mouse = &mouse
  set paste
  set mouse=
  augroup one_action_paste
    autocmd!
    autocmd InsertLeave *
          \ if exists('s:paste') |
          \   let &paste = s:paste |
          \   let &mouse = s:mouse |
          \   unlet s:paste |
          \   unlet s:mouse |
          \ endif |
          \ autocmd! one_action_paste
  augroup END
endfunction
