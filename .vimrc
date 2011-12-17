set nocompatible
filetype plugin indent on
syntax on
colorscheme tappi

set tabstop=4 softtabstop=4 shiftwidth=4

set autoindent
set backspace=indent,eol,start
set cmdheight=2
set completeopt=longest,menu
set confirm
set fillchars=""
set gdefault
set history=100
set hlsearch
set incsearch
set laststatus=2
set listchars=tab:▸\ ,eol:¬
set pastetoggle=<F12>
set ruler
set scrolljump=5
set scrolloff=3
set splitbelow splitright
set suffixes+=.class,.exe,.o,.obj,.dat,.dll,.aux,.pdf,.gch
set tabpagemax=99
set textwidth=120
set timeoutlen=500
set undodir=~/vim_tmp/undo//,.
set undofile
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*~
set wildmenu
set wildmode=longest:list,full
set wrapscan

let mapleader = ","

" Insert mode maps
imap <C-s> <Esc><C-s>
imap <C-@> <C-x><C-o>
imap <S-Tab> <C-d>
imap <expr>  BackspaceIgnoreIndent()

imap <F1> <Esc><F1>
imap <F2> <Esc><F2>
imap <F3> <Esc><F3>
imap <F4> <Esc><F4>
imap <F5> <Esc><F5>
imap <F6> <Esc><F6>
imap <Esc>h <Esc>gT
imap <Esc>l <Esc>gt
imap <Esc>j <C-o>^
imap <Esc>k <C-o>$

inoremap öö <Esc>


" Normal mode maps
nnoremap j gj
nnoremap k gk
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
nnoremap <C-l> :nohl<CR><C-l>

nmap <C-q> <C-w>q
nmap <Esc>a :tabnew<CR>
nmap <Esc>s :tabe 

nmap <C-w><C-m> <C-w>m
nmap <C-w>m :vnew<CR>

nmap Y y$
nmap Q :nohl<CR><C-W>z
nmap <CR> o<C-c>
nmap <C-s> :update<CR>
nmap <Tab> >>
nmap <S-Tab> <<

nmap <Leader>l :set list!<CR>
nmap <Leader>s :set hlsearch!<CR>
nmap <Leader>n :set number!<CR>
nmap <Leader>c *:%s###<Left>
nmap <Leader>h :tab help 
nmap <Leader>H :if &ft == 'help' \| vs \| endif \| vertical help 
nmap <Leader>e :echo exists("&")<Left><Left>
nmap <silent> <Leader>v :tabe $MYVIMRC<CR>
nmap <silent> <Leader>V :source $MYVIMRC<CR>:echo 'vimrc reloaded'<CR>

" Visual mode maps
vmap <C-s> <Esc><C-s>gv
vmap <Tab> >gv
vmap <S-Tab> <gv

" Maps
map <Esc>h gT
map <Esc>l gt
map <Esc>j <C-W>h
map <Esc>k <C-W>l

map <C-H> ^
map <C-L> $
map <C-J> {
map <C-K> }

map <F1> :cp<CR>
map <F2> :cn<CR>
map <F3> :cl<CR>
map <F4> :clast<CR>
map <F5> :exe "!./debug_vim" \| :cf<CR>

map <Esc>1 1gt
map <Esc>2 2gt
map <Esc>3 3gt
map <Esc>4 4gt
map <Esc>5 5gt
map <Esc>6 6gt
map <Esc>7 7gt
map <Esc>8 8gt
map <Esc>9 9gt
map <Esc>0 10g

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal makeprg=python3\ %
autocmd FileType python setlocal efm+=%-GTraceback\ (most\ recent\ call\ last):,%E\ \ File\ \"%f\"\\,\ line\ %l%.%#,%C\ \ \ \ %.%#,%Z%m
autocmd FileType gitcommit startinsert

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

function! BackspaceIgnoreIndent()
  if search('^\s\+\%#', 'bn') != 0
    return "\<c-u>\<c-h>"
  else
    return "\<c-h>"
  endif
endfunction
finish
