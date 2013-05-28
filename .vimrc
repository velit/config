set nocompatible

"Vundle
set rtp+=~/.vim/bundle/vundle
if !filereadable($HOME . '/.vim/bundle/vundle/.git/config') && confirm("Clone Vundle?","Y\nn") == 1
    exec '!git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle/'
endif
filetype off
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Syntastic'
Bundle 'python.vim--Vasiliev'
Bundle 'godlygeek/tabular'
Bundle 'msanders/snipmate.vim'
Bundle 'dahu/LearnVim'

" Settings
set autoindent
set background=dark
set backspace=indent,eol,start
set completeopt=longest,menu
set confirm
set efm+=%-GTraceback\ (most\ recent\ call\ last):,%E\ \ File\ \"%f\"\\,\ line\ %l%.%#,%C\ \ \ \ %.%#,%Z%m
set expandtab shiftwidth=4 softtabstop=4 tabstop=4
set gdefault
set history=100
set incsearch
set listchars=tab:►\ ,eol:$
set mouse=a ttymouse=xterm2
set numberwidth=2
set pastetoggle=<F12>
set ruler
set rulerformat=%50(%=%f\ %m%r\ %-11.(%l,%c%V%)\ %Y\ %P%)
set scrolljump=-10
set sessionoptions-=options
set showcmd
set splitbelow splitright
set statusline=%<%f\ %m%r%=\ %-14.(%l,%c%V%)\ %Y\ %P
set synmaxcol=1000
set tabpagemax=99
set textwidth=110
set timeoutlen=600
set wildignore+=*.o,*.obj,*.bak,*.exe,*.pyc
set wildmenu
set wildmode=longest:list
set wrapscan

if &hlsearch == 0
    set hlsearch
endif

syntax on
filetype plugin indent on
colorscheme tappi

silent! set undodir=~/.vim/temp/undo//,.
silent! set undofile

" Small screen optimization
function! OptimizeSizeSettings()
    if &lines < 45
        set cmdheight=1
        set laststatus=1
        set scrolloff=3
        nnoremap <silent><C-e> <C-e>2<C-e>
        nnoremap <silent><C-y> <C-y>2<C-y>
    else
        set cmdheight=2
        set laststatus=2
        set scrolloff=5
        nnoremap <silent><C-e> <C-e>4<C-e>
        nnoremap <silent><C-y> <C-y>4<C-y>
    endif
endfunction
call OptimizeSizeSettings()

" Plugins
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0
let g:python_highlight_all=1
let g:NERDCreateDefaultMappings = 0
let g:syntastic_mode_map = {'passive_filetypes': ['java']}

" Mappings
let mapleader = ","
noremap <C-c> <Esc>
noremap <Esc> <C-c>
lnoremap <C-c> <Esc>
lnoremap <Esc> <C-c>

" Leader maps
noremap <silent><Leader>f :call NERDComment("n", "Toggle")<CR>

nmap <silent><Leader>C <Leader>V:only <Bar> e ~/.vim/colors/tappi.vim 
            \<Bar> so $VIMRUNTIME/syntax/hitest.vim<CR><C-w>L<C-w>h
nnoremap <Leader>H :if &ft == 'help' <Bar> vs <Bar> endif <Bar> vertical help 
nnoremap <Leader>c :%s#<C-r>/##<Left>
nnoremap <Leader>e :tab drop 
nnoremap <Leader>h :tab help 
nnoremap <Leader>m :Man 
nnoremap <Leader>s :vs 
nnoremap <Leader>j <C-]>
nnoremap <Leader>o <C-i>
nnoremap <silent><Leader>v :tab drop $MYVIMRC<CR>
nnoremap <silent><Leader>V :source $MYVIMRC <Bar> filetype detect <CR>:echo 'vimrc reloaded'<CR>
nnoremap <silent><Leader><C-v> :helptags $HOME/.vim/doc/<CR>:echo 'helptags reloaded'<CR>
nnoremap <silent><Leader>d :tab sp <Bar> tabm99<CR>
nnoremap <silent><Leader>l :set list!<CR>
nnoremap <silent><Leader>n :set number!<CR>
nnoremap <silent><Leader>b :set scrollbind!<CR>
nnoremap <silent><Leader>t :tabnew<CR> 

nnoremap <Leader><Leader>c :cd %:h <Bar> pwd<CR>
nnoremap <Leader><Leader>l :lcd %:h <Bar> pwd<CR>
nnoremap <Leader><Leader>s :mksession! ~/.vim/temp/session.vim<CR>
nnoremap <Leader><Leader>o :source ~/.vim/temp/session.vim<CR>

vnoremap <Leader>s y/\V<C-r>"<CR>
vnoremap <Leader>w y/\V\<<C-r>"\><CR>

" Insert mode mappings
imap <C-s> <Esc><C-s>
inoremap <expr><C-h> BackspaceIgnoreIndent()
inoremap <C-@> <C-x><C-o>
inoremap <S-Tab> <BS>

" Maps
"noremap <Esc>h gT
"noremap <Esc>l gt
"noremap <Esc>j <C-W>w
"noremap <Esc>k <C-W>W
"noremap <C-h> ^
"noremap <C-l> $
"noremap <C-k> {
"noremap <C-j> }
noremap <C-h> gT
noremap <C-l> gt
noremap <C-k> <C-w>w
noremap <C-j> <C-w>W
noremap <Esc>h ^
noremap <Esc>l $
noremap <Esc>k {
noremap <Esc>j }
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

" Normal mode mappings
nnoremap <C-s> :update<CR>
nnoremap <silent><CR> o<C-c>
nnoremap <silent><Esc>q :qa<CR>
nnoremap <silent><Esc>w :close<CR>
nnoremap <silent><Esc>x :close<CR>
nnoremap <silent><S-Tab> <<
nnoremap <silent><Tab> >>
nnoremap <silent>Q <C-W>z<C-l>:nohl<CR>
nnoremap <silent>Y y$
nnoremap <silent>j gj
nnoremap <silent>k gk

" Visual mode mappings
vmap <C-s> <Esc><C-s>gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap <Leader>c :s#<C-r>/##<Left>

" Easier movement sometimes
noremap! <Esc>h <Left>
noremap! <Esc>l <Right>
noremap! <Esc>j <Down>
noremap! <Esc>k <Up>
noremap! <Esc><C-h> <Home>
noremap! <Esc><C-l> <End>
noremap! <Esc><C-j> <S-Left>
noremap! <Esc><C-k> <S-Right>

" Autocmds
aug vimrc
    au!
    "au FileType python setlocal makeprg=python\ %
    au VimResized * call OptimizeSizeSettings()
aug end

" Custom commands and functions
runtime ftplugin/man.vim
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

function! BackspaceIgnoreIndent()
  if search('^\s\+\%#', 'bn') != 0
    return "\<c-u>\<c-h>"
  else
    return "\<c-h>"
  endif
endfunction

nmap <silent><F5>
\ :if executable("./debug_vim") <Bar>
    \ execute("!./debug_vim pyrl.py 0") <Bar>
    \ if filereadable("errors.err") <Bar>
        \ cf <Bar>
        \ clast <Bar>
    \ endif <Bar>
\ else <Bar>
    \ make <Bar>
\ endif<CR>

nmap <silent><F6>
\ :if executable("./debug_vim") <Bar>
    \ execute("!./debug_vim sdlpyrl.py 0") <Bar>
    \ if filereadable("errors.err") <Bar>
        \ cf <Bar>
        \ clast <Bar>
    \ endif <Bar>
\ else <Bar>
    \ make <Bar>
\ endif<CR>
finish
