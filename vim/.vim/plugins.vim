silent! python3 1

silent! call plug#begin('~/.vim/plugins')

" General editor plugins
Plug 'vim-scripts/argtextobj.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'inkarkat/vim-ReplaceWithRegister'
"Plug 'SirVer/UltiSnips' | Plug 'honza/vim-snippets'
"Plug 'ludovicchabant/vim-gutentags'

" External interfacing
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'qpkorr/vim-renamer'

" Language support
Plug 'andreshazard/vim-freemarker'
Plug 'leafgarland/typescript-vim'
Plug 'pprovost/vim-ps1'
Plug 'python-mode/python-mode',   { 'for': 'python', 'branch': 'develop' }
" Plug '5long/pytest-vim-compiler', { 'for': 'python' }

call plug#end()

" Fugitive
command! -nargs=? -complete=tag GgrepProper let @/="<args>" | Ggrep <q-args>
nnoremap <Leader>g yiw:tab sp <Bar> GgrepProper <C-r>"

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" CtrlP
let g:ctrlp_map = ''
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_reuse_window = 'netrw\|help'
let g:ctrlp_switch_buffer = ''
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 0
nnoremap <Leader>E :CtrlP ~/
nnoremap <silent> <Leader>e :CtrlP<CR>
nnoremap <silent> <Leader>r :CtrlPBuffer<CR>
nnoremap <silent> <Leader>v :vnew <Bar> CtrlP<CR>
nnoremap <silent> <Leader>t :tabnew <Bar> CtrlP<CR>
nnoremap <silent> <Leader>s :new <Bar> CtrlP<CR>

function! OpenCtrlPFromRoot()
    let s:user_command = g:ctrlp_user_command
    let g:ctrlp_user_command = 'ag %s --nocolor -u -g ""'
    CtrlP ~
    let g:ctrlp_user_command = s:user_command
endfunction

" PyMode
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_options = 0
let g:pymode_quickfix_maxheight = 8
let g:pymode_quickfix_minheight = 5
let g:pymode_syntax_print_as_function = 1
let g:pymode_warnings = 0

let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257']
let g:pymode_lint_cwindow = 0
let g:pymode_lint_ignore = "C0111,C0301,C0326,D10,E116,E122,E127,E128,E202,E221,E265,E266,E272,E501,E701,E702,E731,R0914,W0212,W0612,W0621"

let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'sys', 'shutil', 'datetime', 'pytest', 'array', 'collections', 'curses', 'enum', 'functools', 'gzip', 'io', 'inspect', 'itertools', 'json', 'locale', 'logging', 'math', 'operator', 'pickle', 'random', 're']
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

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<Esc>i"
