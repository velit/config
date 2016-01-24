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

Plugin 'argtextobj.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-fugitive'
Plugin '5long/pytest-vim-compiler'
Plugin 'UltiSnips'
Plugin 'honza/vim-snippets'
"Plugin 'ludovicchabant/vim-gutentags'
Plugin 'qpkorr/vim-renamer'

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
set wildignore+=*.o,*.obj,*.bak,*.exe,*.pyc,*.class
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

let mapleader = "\<Space>"

" Fugitive
nnoremap <Leader>g :Ggrep ""<Left>

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" CtrlP
let g:ctrlp_map = ''
let g:ctrlp_switch_buffer = ''
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_open_new_file = 'r'
nnoremap <silent> <Leader>e :CtrlP<CR>
nnoremap <silent> <Leader>s :vnew <Bar> CtrlP<CR>
nnoremap <silent> <Leader>t :tabnew <Bar> CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" NERDComment
let g:NERDCreateDefaultMappings = 0
noremap <silent> <Leader>f :call NERDComment("n", "Toggle")<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<Esc>i"

" PyMode
let g:pymode_folding = 0
let g:pymode_options = 0
let g:pymode_quickfix_maxheight = 8
let g:pymode_quickfix_minheight = 5
let g:pymode_syntax_print_as_function = 1
let g:pymode_warnings = 0

let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257']
let g:pymode_lint_cwindow = 0
let g:pymode_lint_ignore = "E501,D10,C0111,C0301,R0914,E128,E265,E116,E127,E731,W0212,W0621,E221,C0326,E272,E266,E701,E202,E122,E702"

let g:pymode_rope_autoimport = 1
"let g:pymode_rope_autoimport_modules = ['os', 'sys', 'shutil', 'datetime', 'pytest']
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_goto_definition_cmd = 'e'

let g:pymode_rope_completion_bind        = '<C-Space>'
let g:pymode_breakpoint_bind             = 'öb'
let g:pymode_rope_autoimport_bind        = 'öi'
let g:pymode_rope_change_signature_bind  = 'ös'
let g:pymode_rope_extract_method_bind    = 'öxm'
let g:pymode_rope_extract_variable_bind  = 'öxv'
let g:pymode_rope_find_it_bind           = 'öf'
let g:pymode_rope_generate_class_bind    = 'ögc'
let g:pymode_rope_generate_function_bind = 'ögf'
let g:pymode_rope_generate_package_bind  = 'ögp'
let g:pymode_rope_goto_definition_bind   = 'öj'
let g:pymode_rope_inline_bind            = 'ööi'
let g:pymode_rope_module_to_package_bind = 'ömp'
let g:pymode_rope_move_bind              = 'ömv'
let g:pymode_rope_organize_imports_bind  = 'öo'
let g:pymode_rope_rename_bind            = 'ör'
let g:pymode_rope_rename_module_bind     = 'ömr'
let g:pymode_rope_show_doc_bind          = 'öd'
let g:pymode_rope_use_function_bind      = 'öu'
let g:pymode_run_bind                    = 'öe'

nnoremap <silent> öa :PymodeLint<CR>
nnoremap <silent> öt :compiler pytest-3<CR>:make %<CR>

" Leader maps
noremap <Leader>j <C-]>
noremap <Leader>k <C-[>

nnoremap <Leader>h :vertical help 
nnoremap <Leader>H :tab help 
nnoremap <Leader>c :%s###<Left>

nnoremap <silent> <Leader>l :set list!<CR>
nnoremap <silent> <Leader>n :set number!<CR>
nnoremap <silent> <Leader>d :tab sp <Bar> tabm99<CR>
nnoremap <silent> <Leader>V :tab drop $MYVIMRC<CR>
nnoremap <silent> <Leader>v :vs $MYVIMRC<CR>

vnoremap <Leader>s y$?\V<C-r>"<CR>
vnoremap <Leader>w y?\V\<<C-r>"\><CR>

nnoremap <Leader><Leader>c :cd %:h <Bar> pwd<CR>
nnoremap <Leader><Leader>v :lcd %:h <Bar> pwd<CR>
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
noremap / /\v
noremap ? ?\v
noremap <C-p> <C-i>
noremap <C-h> gT
noremap <C-l> gt
noremap <C-k> <C-w>w
noremap <C-j> <C-w>W
noremap <Esc>h ^
noremap <Esc>l $
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
noremap <Esc>k >>
noremap <Esc>j <<
nnoremap <F1> :cp<CR>
nnoremap <F2> :cn<CR>
nnoremap <F3> :cl<CR>
nnoremap <F4> :clast<CR>
nnoremap <F5> :call DebugVim("./pyrl.py")<CR>
nnoremap <F6> :compiler pytest-3<CR>:make<CR>
nnoremap <F7> :call DebugVim("./sdlpyrl.py")<CR>
nnoremap <Esc>q :qa<CR>
nnoremap <Esc>x :close<CR>
nnoremap <C-s> :update<CR>
nnoremap <C-w>m :vnew<CR>
nnoremap <C-w><C-m> :vnew<CR>

nnoremap <silent><CR> o<C-c>
nnoremap <silent>Y y$
nnoremap <silent>yY 0y$

" Visual mode mappings
vnoremap <Esc>k >gv
vnoremap <Esc>j <gv
vnoremap <Leader>c :s###<Left>

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
    autocmd FileType java call JavaOptions()
    autocmd FileType jsp call JavaOptions()
    autocmd FileType javascript call JavaOptions()

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
    setlocal textwidth=90
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
        if filereadable("errors.err")
            cf errors.err
            clast
        endif
    else
        make
    endif
endfunction
