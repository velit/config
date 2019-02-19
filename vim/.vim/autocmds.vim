augroup vimrc
    autocmd!
    autocmd FileType python call PythonOptions()
    autocmd FileType java call JavaOptions()
    autocmd FileType jsp call JavaOptions()
    autocmd FileType javascript call JavaOptions()
    autocmd FileType xml call JavaOptions()

    autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    autocmd BufReadPost *.jspf set filetype=jsp

    "autocmd BufWritePost * match ExtraWhitespace /\s\+\%#\@<!$/
augroup end

function! PythonOptions()
    call ExpandTab()
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
    setlocal expandtab
    setlocal tabstop=4
    setlocal textwidth=120
    inoremap <C-@> <C-x><C-u>
    nnoremap öi :JavaImport<CR>
endfunction

function! ExpandTab()
    setlocal expandtab
    setlocal tabstop=8
endfunction

function! NoExpandTab()
    setlocal noexpandtab
    setlocal tabstop=4
endfunction
