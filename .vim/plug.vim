python3 pass

" Plug
if empty(glob("~/.vim/autoload/plug.vim")) && confirm("Fetch Vim-Plug?","Y\nn") == 1
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'argtextobj.vim'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'qpkorr/vim-renamer'
Plug 'UltiSnips' | Plug 'honza/vim-snippets'

Plug '5long/pytest-vim-compiler', { 'for': 'python' }
Plug 'klen/python-mode',          { 'for': 'python' }

"Plug 'ludovicchabant/vim-gutentags'

call plug#end()

" Fugitive
nnoremap <Leader>g :Ggrep ""<Left>

if executable('ag')
    set grepprg="ag --nogroup --nocolor --hidden --ignore .git"
    let g:ctrlp_user_command = 'ag %s --nocolor --hidden --ignore .git -g ""'
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
nnoremap <silent> <Leader>~ :CtrlP ~<CR>

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
let g:pymode_rope_autoimport_modules = ['os', 'sys', 'shutil', 'datetime', 'pytest', 'array', 'collections', 'curses', 'enum', 'functools', 'gzip', 'io', 'inspect', 'itertools', 'json', 'locale', 'logging', 'math', 'operator', 'pickle', 'random']
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

" NERDComment
let g:NERDCreateDefaultMappings = 0
noremap <silent> <Leader>f :call NERDComment("n", "Toggle")<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<Esc>i"
