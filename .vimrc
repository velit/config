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
set efm+=%-GTraceback\ (most\ recent\ call\ last):,%E\ \ File\ \"%f\"\\,\ line\ %l%.%#,%C\ \ \ \ %.%#,%Z%m
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
set textwidth=100
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*~
set wildmenu
set wildmode=longest:list
set wrapscan

if version >= 703
	set undodir=~/.vim/temp/undo//,.
	set undofile
endif

if $TERM == 'screen-256color'
	set ttymouse=xterm2

" Insert mode mappings

imap <C-s> <Esc><C-s>
inoremap <C-@> <C-x><C-o>
inoremap <S-Tab> <BS>
inoremap <expr> <C-h> BackspaceIgnoreIndent()

imap <F1> <Esc><F1>
imap <F2> <Esc><F2>
imap <F3> <Esc><F3>
imap <F4> <Esc><F4>
imap <F5> <Esc><F5>
imap <F6> <Esc><F6>
inoremap <Esc>h <Esc>gT
inoremap <Esc>l <Esc>gt
inoremap <Esc>j <C-o>^
inoremap <Esc>k <C-o>$

inoremap <C-c> <Esc>
inoremap <Esc> <C-c>

" Normal mode mappings

nnoremap <C-e> <C-e><C-e><C-e><C-e><C-e>
nnoremap <C-y> <C-y><C-y><C-y><C-y><C-y>
nnoremap <C-l> :nohl<CR><C-l>
nnoremap <C-q> :qa<CR>
nnoremap <C-s> :update<CR>
nnoremap <CR> o<C-c>
nnoremap <Esc>q :qa<CR>
nnoremap <Esc>w :close<CR>
nnoremap <Esc>x :close<CR>
nnoremap <Leader>H :if &ft == 'help' \| vs \| endif \| vertical help 
nnoremap <Leader>cd :cd %:h \| :pwd<CR>
nnoremap <Leader>cl :lcd %:h \| :pwd<CR>
nnoremap <Leader>d :tab sp<CR> 
nnoremap <Leader>e :tabe 
nnoremap <Leader>h :tab help 
nnoremap <Leader>j <C-]>
nnoremap <Leader>l :set list!<CR>
nnoremap <Leader>n :set number!<CR>
nnoremap <Leader>o <C-i>
nnoremap <Leader>q :qa<CR>
nnoremap <Leader>s :vs 
nnoremap <Leader>t :tabnew<CR> 
nnoremap <Leader>w :close<CR>
nnoremap <S-Tab> <<
nnoremap <Tab> >>
nnoremap <silent><Leader><C-v> :helptags $HOME/.vim/doc/<CR>:echo 'helptags reloaded'<CR>
nnoremap <silent><Leader>V :source $MYVIMRC <Bar> filetype detect<CR>:echo 'vimrc reloaded'<CR>
nnoremap <silent><Leader>co :tabe ~/.vim/colors/tappi.vim<CR>
nnoremap <silent><Leader>v :tabe $MYVIMRC<CR>
nnoremap Q :nohl<CR><C-W>z
nnoremap Y y$
nnoremap j gj
nnoremap k gk

nnoremap <silent><F5>
\ :if executable("./debug_vim") <Bar>
	\ execute("!./debug_vim pyrl.py 0") <Bar>
	\ if filereadable("errors.err") <Bar>
		\ cf <Bar>
		\ clast <Bar>
	\ endif <Bar>
\ else <Bar>
	\ make <Bar>
\ endif<CR>

nnoremap <silent><F6>
\ :if executable("./debug_vim") <Bar>
	\ execute("!./debug_vim sdlpyrl.py 0") <Bar>
	\ if filereadable("errors.err") <Bar>
		\ cf <Bar>
		\ clast <Bar>
	\ endif <Bar>
\ else <Bar>
	\ make <Bar>
\ endif<CR>


" Visual mode mappings

vmap <C-s> <Esc><C-s>gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


" Maps

noremap <Leader>f <plug>NERDCommenterToggle
noremap <Esc>h gT
noremap <Esc>l gt
noremap <Esc>j <C-W>h
noremap <Esc>k <C-W>l
noremap <C-H> ^
noremap <C-L> $
noremap <C-K> {
noremap <C-J> }
noremap <F1> :cp<CR>
noremap <F2> :cn<CR>
noremap <F3> :cl<CR>
noremap <F4> :clast<CR>
noremap <Esc>1 1gt
noremap <Esc>2 2gt
noremap <Esc>3 3gt
noremap <Esc>4 4gt
noremap <Esc>5 5gt
noremap <Esc>6 6gt
noremap <Esc>7 7gt
noremap <Esc>8 8gt
noremap <Esc>9 9gt
noremap <Esc>0 10g
noremap <C-w>m :vnew<CR>
map <C-w><C-m> <C-w>m

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
"autocmd FileType python setlocal efm+=%-GTraceback\ (most\ recent\ call\ last):,%E\ \ File\ \"%f\"\\,\ line\ %l%.%#,%C\ \ \ \ %.%#,%Z%m
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
