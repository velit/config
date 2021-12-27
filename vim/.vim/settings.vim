set autoindent
set backspace=indent,eol,start
set completeopt=longest,menu
set confirm
set directory=~/.vim/temp/swap//,~/tmp,/var/tmp,/tmp
set encoding=utf-8
set expandtab shiftwidth=4 softtabstop=4 tabstop=8
set formatoptions+=l
set gdefault
set history=100
set hlsearch
set ignorecase
set incsearch
set listchars=tab:►\ ,nbsp:·,trail:·,precedes:<,extends:>,eol:¬
set mouse=a ttymouse=xterm2
set modeline
set nohidden
set nolist
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
set t_Co=256
set tabpagemax=99
set textwidth=79
set timeoutlen=600
set undodir=~/.vim/temp/undo//,~/tmp,/var/tmp,/tmp
set undofile
set viminfo+=n~/.vim/viminfo
set wildmenu
set wildmode=longest:list
set wrapscan
set wrap
"silent! set new-option

syntax on
filetype plugin indent on
colorscheme tappi

" Leader maps
nmap <Space> <Nop>
nmap <Esc>[25~ <Nop>
nmap å <Nop>
let mapleader = "\<Space>"

noremap <Leader>j <C-]>
noremap <Leader>k <C-[>

nnoremap <Leader>h :H 
nnoremap <Leader><C-h> :vnew <Bar> H 
nnoremap <Leader>H :tabnew <Bar> H 
nnoremap <Leader>c :%s###<Left>
nnoremap <Leader>C *Ncgn

nnoremap <silent> <Leader>l :set list!<CR>
nnoremap <silent> <Leader>n :set number!<CR>
nnoremap <silent> <Leader>w :set wrap!<CR>
nnoremap <silent> <Leader>d :tab sp<CR>
nnoremap <silent> <Leader>z :tabe ~/.vim/settings.vim <Bar> vs ~/.vim/plugins.vim<CR><C-w>h
nnoremap <silent> <Leader>Z :source $MYVIMRC <Bar> filetype detect<CR>:echo 'vimrc reloaded'<CR>
nnoremap <silent> <Leader>p :call <SID>setup_one_action_paste()<CR>o
nnoremap <silent> <Leader>P :call <SID>setup_one_action_paste()<CR>i

vnoremap <silent> <Leader>s y:let @/=@"<CR>Nn
vnoremap <Leader>c :s###<Left>
vnoremap <Leader>C y:let @/=@"<CR>cgn

nnoremap <Leader><Leader>c :cd %:h <Bar> pwd<CR>
nnoremap <Leader><Leader>v :lcd %:h <Bar> pwd<CR>
nnoremap <Leader><Leader>s :mksession! ~/.vim/temp/session.vim<CR>
nnoremap <Leader><Leader>o :source ~/.vim/temp/session.vim<CR>
nmap <silent> <Leader><Leader>C :source ~/.vim/colors/tappi.vim <BAR> only <Bar> e ~/.vim/colors/tappi.vim <Bar> so $VIMRUNTIME/syntax/hitest.vim<CR><C-w>L<C-w>h

" Insert maps
inoremap <S-Tab> <BS>
inoremap <C-c> <Esc>
inoremap <C-q> <C-c>
inoremap <A-c> <C-c>
inoremap <C-s> <Esc>:update<CR>
inoremap <expr><C-h> BackspaceIgnoreIndent()

" Normal / Visual / Operator pending maps
"noremap j gj
"noremap k gk
noremap <C-p> <C-i>
noremap <S-Tab> <C-o>
noremap <C-h> gT
noremap <C-l> gt
noremap <C-k> <C-w>w
noremap <C-j> <C-w>W
noremap <A-h> ^
noremap <A-l> $
noremap <silent><C-e> 5<C-e>
noremap <silent><C-y> 5<C-y>
noremap <silent>Q <C-W>z<C-l>:nohl<CR>:match<CR>
noremap , ;
noremap ; ,
noremap / /\v
noremap ? ?\v

" Normal mode mappings
noremap <A-k> >>
noremap <A-j> <<
nnoremap <F1> :cp<CR>
nnoremap <F2> :cn<CR>
nnoremap <F3> :cl<CR>
nnoremap <F4> :clast<CR>
nnoremap <F5> :call DebugVim("./pyrl.py")<CR>
nnoremap <F6> :compiler pytest-3<CR>:make<CR>
nnoremap <F7> :call DebugVim("./sdlpyrl.py")<CR>
nnoremap <A-q> :qa<CR>
nnoremap <A-z> :tabclose<CR>
nnoremap <A-x> :close<CR>
nnoremap <C-s> :update<CR>
nnoremap <C-w>m :vnew<CR>
nnoremap <C-w><C-m> :vnew<CR>
nnoremap <C-w>t :tabnew<CR>
nnoremap <C-w><C-m> :tabnew<CR>
nnoremap c* *Ncgn
nnoremap c# #NcgN

nnoremap <silent><CR> o<C-c>
nnoremap <silent>Y y$
nnoremap <silent>yY 0y$

" Visual mode mappings
vnoremap <A-k> >gv
vnoremap <A-j> <gv

" Easier movement sometimes
noremap! <A-h> <Left>
noremap! <A-l> <Right>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-C-h> <Home>
noremap! <A-C-l> <End>
noremap! <A-C-j> <S-Left>
noremap! <A-C-k> <S-Right>

" Custom commands and functions
runtime ftplugin/man.vim
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! RemoveTrailingWhitespace %s/\s\+$//
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>

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
