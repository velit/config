set nocompatible

"Vundle bootstrap
if !filereadable($HOME . '/.vim/bundle/vundle/.git/config') && confirm("Clone Vundle?","Y\nn") == 1
    exec '!git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/vundle/'
endif

"Vundle
set rtp+=~/.vim/bundle/vundle
filetype off

call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'klen/python-mode'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'

"Plugin 'msanders/snipmate.vim'

call vundle#end()

" Settings
set autoindent
set background=dark
set backspace=indent,eol,start
set completeopt=longest,menu
set confirm
set directory=~/.vim/temp/swap//,.,~/tmp,/var/tmp,/tmp
set efm+=%-GTraceback\ (most\ recent\ call\ last):,%E\ \ File\ \"%f\"\\,\ line\ %l%.%#,%C\ \ \ \ %.%#,%Z%m
set expandtab shiftwidth=4 softtabstop=4 tabstop=4
set gdefault
set nohidden
set history=100
set ignorecase
set incsearch
set listchars=tab:►\ ,trail:·,eol:$
set mouse=a ttymouse=xterm2
set nolist
set numberwidth=2
set pastetoggle=<F12>
set ruler
set rulerformat=%50(%=%f\ %m%r\ %-11.(%l,%c%V%)\ %Y\ %P%)
set scrolljump=-10
set scrolloff=5
set sessionoptions-=options
set showcmd
set smartcase
set splitbelow splitright
set statusline=%<%f\ %m%r%=\ %-14.(%l,%c%V%)\ %Y\ %P
set synmaxcol=1000
set tabpagemax=99
set textwidth=80
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

let mapleader = ","

" CtrlP
let g:ctrlp_map = ''
let g:ctrlp_switch_buffer = ''
let g:ctrlp_clear_cache_on_exit = 0
nnoremap <silent> <Leader>e :CtrlP<CR>
nnoremap <silent> <Leader>s :vnew <Bar> CtrlP<CR>
nnoremap <silent> <Leader>t :tabnew <Bar> CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" PyMode
let g:pymode_folding = 0
let g:pymode_options = 0
let g:pymode_quickfix_maxheight = 8
let g:pymode_quickfix_minheight = 5
let g:pymode_syntax_print_as_function = 1
let g:pymode_warnings = 0

let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257']
let g:pymode_lint_cwindow = 0
let g:pymode_lint_ignore = "E501,D10,C0111,C0301,W0621,R0914,E128,E265,E116,E127"

let g:pymode_rope_autoimport_modules     = ['os', 'shutil', 'datetime', 'pytest']
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_goto_definition_cmd = 'e'

let g:pymode_rope_completion_bind        = '<C-Space>'
let g:pymode_breakpoint_bind             = "<Leader>rb"
let g:pymode_rope_autoimport_bind        = '<Leader>ra'
let g:pymode_rope_change_signature_bind  = '<Leader>rs'
let g:pymode_rope_extract_method_bind    = '<Leader>rem'
let g:pymode_rope_extract_variable_bind  = '<Leader>rel'
let g:pymode_rope_goto_definition_bind   = '<Leader>rg'
let g:pymode_rope_module_to_package_bind = '<Leader>rmp'
let g:pymode_rope_move_bind              = '<Leader>rv'
let g:pymode_rope_organize_imports_bind  = '<Leader>ro'
let g:pymode_rope_rename_bind            = '<Leader>rr'
let g:pymode_rope_rename_module_bind     = '<Leader>rmr'
let g:pymode_rope_show_doc_bind          = '<Leader>rd'
let g:pymode_rope_use_function_bind      = '<Leader>ru'
let g:pymode_run_bind                    = "<Leader>re"
nnoremap <silent> <Leader>a :PymodeLint<CR>

" NERDComment
let g:NERDCreateDefaultMappings = 0
noremap <silent> <Leader>f :call NERDComment("n", "Toggle")<CR>

" Leader maps
noremap <Leader>j <C-]>
noremap <Leader>k <C-[>

nnoremap <Leader>h :vertical help 
nnoremap <Leader>H :tab help 
nnoremap <Leader>c :%s#<C-r>/##<Left>

nnoremap <silent> <Leader>l :set list!<CR>
nnoremap <silent> <Leader>n :set number!<CR>
nnoremap <silent> <Leader>d :tab sp <Bar> tabm99<CR>
nnoremap <silent> <Leader>V :tab drop $MYVIMRC<CR>
nnoremap <silent> <Leader>v :vs $MYVIMRC<CR>

vnoremap <Leader>s y/\V<C-r>"<CR>
vnoremap <Leader>w y/\V\<<C-r>"\><CR>

nnoremap <Leader><Leader>c :cd %:h <Bar> pwd<CR>
nnoremap <Leader><Leader>l :lcd %:h <Bar> pwd<CR>
nnoremap <Leader><Leader>s :mksession! ~/.vim/temp/session.vim<CR>
nnoremap <Leader><Leader>o :source ~/.vim/temp/session.vim<CR>
nnoremap <silent> <Leader><Leader>r :source $MYVIMRC <Bar> filetype detect<CR>:echo 'vimrc reloaded'<CR>
nmap <silent> <Leader><Leader>C ,,r:only <Bar> e ~/.vim/colors/tappi.vim <Bar> so $VIMRUNTIME/syntax/hitest.vim<CR><C-w>L<C-w>h

" Insert maps
inoremap <S-Tab> <BS>
inoremap <C-c> <Esc>
inoremap <Esc> <C-c>
inoremap <C-s> <Esc>:update<CR>
inoremap <expr><C-h> BackspaceIgnoreIndent()

" Maps
noremap <C-p> <C-i>
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
noremap <C-w>m :vnew<CR> <Bar> nmap <C-w><C-m> <C-w>m

" Normal mode mappings
nnoremap <C-s> :update<CR>
nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <silent><CR> o<C-c>
nnoremap <silent><Esc>q :qa<CR>
nnoremap <silent><Esc>x :close<CR>
nnoremap <silent>Q <C-W>z<C-l>:nohl<CR>:match<CR>
nnoremap <silent>Y y$
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap <silent><C-e> 5<C-e>
nnoremap <silent><C-y> 5<C-y>

" Visual mode mappings
vnoremap <C-s> <Esc>:update<CR>
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
augroup vimrc
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8
                \ complete+=t commentstring=#%s textwidth=80 define=^\s*\\(def\\\\|class\\)
    autocmd FileType java setlocal noexpandtab
    autocmd FileType jsp setlocal noexpandtab
    autocmd FileType javascript setlocal noexpandtab

    autocmd VimResized * call OptimizeSizeSettings()
    autocmd BufWritePost * match ExtraWhitespace /\s\+\%#\@<!$/
augroup end

" Custom commands and functions
runtime ftplugin/man.vim
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! RemoveTrailingWhitespace %s/\s\+$//

" Small screen optimization
function! OptimizeSizeSettings()
    if &lines < 45
        set cmdheight=1
        set laststatus=0
    else
        set cmdheight=2
        set laststatus=2
    endif
endfunction
call OptimizeSizeSettings()

function! BackspaceIgnoreIndent()
  if search('^\s\+\%#', 'bn') != 0
    return "\<c-u>\<c-h>"
  else
    return "\<c-h>"
  endif
endfunction

nmap <silent><F5>
\ :if executable("./debug_vim") <Bar>
    \ execute("!./debug_vim ./pyrl.py") <Bar>
    \ if filereadable("errors.err") <Bar>
        \ cf <Bar>
        \ clast <Bar>
    \ endif <Bar>
\ else <Bar>
    \ make <Bar>
\ endif<CR>

nmap <silent><F6>
\ :if executable("./debug_vim") <Bar>
    \ execute("!./debug_vim ./sdlpyrl.py") <Bar>
    \ if filereadable("errors.err") <Bar>
        \ cf <Bar>
        \ clast <Bar>
    \ endif <Bar>
\ else <Bar>
    \ make <Bar>
\ endif<CR>
finish
