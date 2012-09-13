" Vim color file
" by tappi
" vim:ts=8

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "tappi"


" General colors
hi Cursor	ctermfg=234	ctermbg=228	cterm=none	term=none
hi CursorLine	ctermfg=none	ctermbg=238	cterm=none	term=none
hi ErrorMsg	ctermfg=196	ctermbg=none	cterm=bold	term=none
hi Folded	ctermfg=103	ctermbg=237	cterm=none	term=none
hi LineNr	ctermfg=245	ctermbg=235	cterm=none	term=none
hi MatchParen	ctermfg=none	ctermbg=242	cterm=none	term=none
hi Normal	ctermfg=252	ctermbg=235	cterm=none	term=none
hi NonText	ctermfg=16	ctermbg=none	cterm=none	term=none
hi Search	ctermfg=232	ctermbg=63	cterm=none	term=none
hi StatusLine	ctermfg=16	ctermbg=248	cterm=none	term=none
hi StatusLineNC	ctermfg=248	ctermbg=238	cterm=none	term=none
hi TabLineSel	ctermfg=252	ctermbg=none	cterm=none	term=none
hi TabLine	ctermfg=248	ctermbg=238	cterm=underline	term=none
hi TabLineFill	ctermfg=248	ctermbg=238	cterm=underline	term=none
hi VertSplit	ctermfg=238	ctermbg=238	cterm=none	term=none
hi Visual	ctermfg=none	ctermbg=16	cterm=reverse	term=none
hi WarningMsg	ctermfg=203	ctermbg=none	cterm=none	term=none

" Diff highlighting
hi DiffAdd	ctermfg=none	ctermbg=22	cterm=none	term=none
hi DiffDelete	ctermfg=234	ctermbg=52	cterm=none	term=none
hi DiffText	ctermfg=none	ctermbg=53	cterm=none	term=none
hi DiffChange	ctermbg=24	cterm=none	cterm=none	term=none


" Syntax highlighting
hi Comment	ctermfg=63	ctermbg=none	cterm=none	term=none
hi Constant	ctermfg=173	ctermbg=none	cterm=none	term=none
hi Error	ctermfg=124	ctermbg=none	cterm=reverse	term=none
hi Identifier	ctermfg=51	ctermbg=none	cterm=none	term=none
hi Special	ctermfg=173	ctermbg=none	cterm=none  	term=none
hi Statement	ctermfg=130	ctermbg=none	cterm=none  	term=none
hi String	ctermfg=207	ctermbg=none	cterm=none  	term=none
hi Todo		ctermfg=none	ctermbg=30	cterm=none  	term=none
hi Type		ctermfg=34	ctermbg=none	cterm=none  	term=none


" Links
hi! link FoldColumn		Folded
hi! link CursorColumn		CursorLine
hi! link SpecialKey		Constant
hi! link SyntasticError		ErrorMsg
hi! link SyntasticWarning	WarningMsg
