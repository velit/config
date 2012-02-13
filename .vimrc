" Settings

set nocompatible
filetype plugin indent on
syntax on
let mapleader = ","

set background=dark
colorscheme tappi

set tabstop=4 shiftwidth=4

set autoindent
set backspace=indent,eol,start
set cmdheight=2
set completeopt=longest,menu
set confirm
set gdefault
set history=100
set hlsearch
set incsearch
set laststatus=2
set listchars=tab:►\ ,eol:$
set mouse=a
set numberwidth=2
set pastetoggle=<F12>
set ruler
set rulerformat=%50(%=%f\ %m%r\ %-11.(%l,%c%V%)\ %Y\ %P%)
set statusline=%<%f\ %m%r%=\ %-14.(%l,%c%V%)\ %Y\ %P
set scrolljump=-10
set scrolloff=5
set splitbelow splitright
set synmaxcol=1000
set tabpagemax=99
set textwidth=120
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*~
set wildmenu
set wildmode=longest:list
set wrapscan

if version >= 703
	set undodir=~/.vim/temp/undo//,.
	set undofile
endif

" Insert mode mappings

imap <C-s> <Esc><C-s>
imap <C-@> <C-x><C-o>
imap <S-Tab> <BS>
imap <expr> <C-h> BackspaceIgnoreIndent()

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

inoremap <C-c> <Esc>
inoremap <Esc> <C-c>


" Normal mode mappings

nnoremap j gj
nnoremap k gk
nnoremap <C-e> <C-e><C-e><C-e><C-e><C-e>
nnoremap <C-y> <C-y><C-y><C-y><C-y><C-y>
nnoremap <C-l> :nohl<CR><C-l>

nnoremap <C-q> :qa<CR>
nnoremap <Esc>q :qa<CR>
nnoremap <Esc>x :close<CR>
nnoremap <Esc>w :close<CR>

nmap Y y$
nmap Q :nohl<CR><C-W>z
nmap <CR> o<C-c>
nmap <C-s> :update<CR>
nmap <Tab> >>
nmap <S-Tab> <<

nmap <Leader>l :set list!<CR>
nmap <Leader>n :set number!<CR>
nmap <Leader>cd :cd %:h \| :pwd<CR>
nmap <Leader>cl :lcd %:h \| :pwd<CR>
nmap <Leader>s :vs 
nmap <Leader>h :tab help 
nmap <Leader>H :if &ft == 'help' \| vs \| endif \| vertical help 
nmap <Leader>e :tabe 
nmap <Leader>t :tabnew<CR> 
nmap <Leader>d :tab sp<CR> 
nmap <Leader>j <C-]>
nmap <Leader>w :close<CR>
nmap <Leader>q :qa<CR>

nmap <silent> <Leader>co :tabe ~/.vim/colors/tappi.vim<CR>
nmap <silent> <Leader>v :tabe $MYVIMRC<CR>
nmap <silent> <Leader>V :source $MYVIMRC <Bar> filetype detect<CR>:echo 'vimrc reloaded'<CR>
nmap <silent> <Leader><C-v> :helptags $HOME/.vim/doc/<CR>:echo 'helptags reloaded'<CR>


" Visual mode mappings

vmap <C-s> <Esc><C-s>gv
vmap <Tab> >gv
vmap <S-Tab> <gv


" Maps

map <Leader>f <plug>NERDCommenterToggle

map <Esc>h gT
map <Esc>l gt
map <Esc>j <C-W>h
map <Esc>k <C-W>l

map <C-H> ^
map <C-L> $
map <C-K> {
map <C-J> }

map <silent> <C-w><C-m> <C-w>m
map <silent> <C-w>m :vnew<CR>

map <F1> :cp<CR>
map <F2> :cn<CR>
map <F3> :cl<CR>
map <F4> :clast<CR>

map <silent> <F5>
\ :if executable("./debug_vim") <Bar>
	\ execute("!./debug_vim") <Bar>
	\ if filereadable("errors.err") <Bar>
		\ cf <Bar>
		\ clast <Bar>
	\ endif <Bar>
\ else <Bar>
	\ make <Bar>
\ endif<CR>

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

" Small screen optimisations

if &lines < 45
	set cmdheight=1
	set laststatus=1
	set scrolloff=3
	nnoremap <C-e> <C-e><C-e><C-e>
	nnoremap <C-y> <C-y><C-y><C-y>
endif

" Filetypes

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal makeprg=python\ %
autocmd FileType python setlocal efm+=%-GTraceback\ (most\ recent\ call\ last):,%E\ \ File\ \"%f\"\\,\ line\ %l%.%#,%C\ \ \ \ %.%#,%Z%m
"autocmd FileType gitcommit startinsert


" Plugins

let g:pyflakes_use_quickfix = 0
let g:NERDCreateDefaultMappings = 0

" Custom commands and functions

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

function! BackspaceIgnoreIndent()
  if search('^\s\+\%#', 'bn') != 0
    return "\<c-u>\<c-h>"
  else
    return "\<c-h>"
  endif
endfunction
finish
