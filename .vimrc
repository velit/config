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
set expandtab shiftwidth=4 softtabstop=4 tabstop=8
set formatoptions+=l
set gdefault
set history=100
set ignorecase
set incsearch
set listchars=tab:►\ ,trail:·,eol:$
set mouse=a ttymouse=xterm2
set nohidden
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
let g:pymode_lint_ignore = "E501,D10,C0111,C0301,W0621,R0914,E128,E265,E116,E127,E731"

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

" Normal / Visual / Operator pending maps
noremap j gj
noremap k gk
noremap <C-p> <C-i>
noremap <C-h> gT
noremap <C-l> gt
noremap <C-k> <C-w>w
noremap <C-j> <C-w>W
noremap <Esc>h ^
noremap <Esc>l $
noremap <Esc>k {
noremap <Esc>j }
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
noremap <silent><C-e> 5<C-e>
noremap <silent><C-y> 5<C-y>
noremap <silent>Q <C-W>z<C-l>:nohl<CR>:match<CR>

" Normal mode mappings
nnoremap <F1> :cp<CR>
nnoremap <F2> :cn<CR>
nnoremap <F3> :cl<CR>
nnoremap <F4> :clast<CR>
nnoremap <F5> :make<CR>
nnoremap <F6> :call DebugVim("./pyrl.py")<CR>
nnoremap <F7> :call DebugVim("./sdlpyrl.py")<CR>
nnoremap <Esc>q :qa<CR>
nnoremap <Esc>x :close<CR>
nnoremap <C-s> :update<CR>
nnoremap <C-w>m :vnew<CR>
nnoremap <C-w><C-m> :vnew<CR>

nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <silent><CR> o<C-c>
nnoremap <silent>Y y$

" Visual mode mappings
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
    autocmd FileType python call PythonOptions()
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

function! PythonOptions()
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal tabstop=8
    setlocal complete+=t
    setlocal commentstring=#%s
    setlocal textwidth=79
    setlocal define=^\s*\\(def\\\\|class\\)

    " py.test efm
    setlocal efm=%-G%f:%l:\ in\ %s
    setlocal efm+=%EE%\\s%#%m
    setlocal efm+=%-G%\\s%#
    setlocal efm+=%Z%f:%l:\ %s
    setlocal efm+=%f:%l:\ %m

    " Python efm
    setlocal efm+=%E\ \ File\ \"%f\"\\,\ line\ %l%.%#
    setlocal efm+=%C\ \ \ \ %.%#
    setlocal efm+=%Z%m

    " Filter useless lines
    setlocal efm+=%-GTraceback\ (most\ recent\ call\ last):

    " Filter success/neutral lines
    setlocal efm+=%-Gpy.test%.%#
    setlocal efm+=%-G=%\\+%.%#=%\\+
    setlocal efm+=%-Gplatform%.%#
    setlocal efm+=%-Gcollected%.%#
    setlocal efm+=%-G%f\ .%\\+

endfunction

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

function! DebugVim(target)
    if executable("./debug_vim")
        execute("!./debug_vim " . a:target)
        if filereadable("data/errors.err")
            cf data/errors.err
            clast
        endif
    else
        make
    endif
endfunction
