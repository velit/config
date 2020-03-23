augroup vimrc
    autocmd!
    autocmd FileType python call PythonOptions()
    autocmd FileType java call JavaOptions()
    autocmd FileType jsp call JavaOptions()
    autocmd FileType javascript call JavaOptions()
    autocmd FileType xml call JavaOptions()
    autocmd FileType yaml call Expand(2)

    autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    autocmd BufReadPost *.jspf set filetype=jsp

    "autocmd BufWritePost * match ExtraWhitespace /\s\+\%#\@<!$/
augroup end

function! PythonOptions()
    call Expand(4)
    setlocal complete+=t
    setlocal commentstring=#%s
    setlocal textwidth=105
    setlocal define=^\s*\\(def\\\\|class\\)

    " Python efm
    setlocal efm+=%E\ \ File\ \"%f\"\\,\ line\ %l%.%#
    setlocal efm+=%C\ \ \ \ %.%#
    setlocal efm+=%Z%m
    setlocal efm+=%-GTraceback\ (most\ recent\ call\ last):
endfunction

function! JavaOptions()
    call NoExpand(4)
    setlocal textwidth=120
    inoremap <C-@> <C-x><C-u>
    nnoremap öi :JavaImport<CR>
endfunction

function! Expand(n)
    setlocal expandtab
    execute "setlocal shiftwidth=".a:n
    execute "setlocal softtabstop=".a:n
    setlocal tabstop=8
endfunction

function! NoExpand(n)
    setlocal noexpandtab
    execute "setlocal shiftwidth=".a:n
    execute "setlocal softtabstop=".a:n
    execute "setlocal tabstop=".a:n
endfunction
