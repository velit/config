" Vim color file
" by tappi

set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "tappi"


" General colors
hi Cursor		ctermfg=234		ctermbg=228		cterm=none
hi CursorLine	ctermfg=none	ctermbg=236		cterm=none
hi ErrorMsg		ctermfg=196		ctermbg=236		cterm=bold
hi Folded		ctermfg=103		ctermbg=237		cterm=none
hi LineNr		ctermfg=248		ctermbg=0		cterm=none
hi MatchParen	ctermfg=none	ctermbg=none	cterm=reverse
hi Normal		ctermfg=252		ctermbg=235		cterm=none
hi NonText		ctermfg=232		ctermbg=none	cterm=none
hi Search		ctermfg=248		ctermbg=12		term=reverse
hi SpecialKey	ctermfg=232		ctermbg=none	cterm=none
hi StatusLine	ctermfg=232		ctermbg=248		cterm=none
hi StatusLineNC	ctermfg=248		ctermbg=238		cterm=none
hi TabLine		ctermfg=248		ctermbg=238		cterm=none
hi TabLineFill	ctermfg=none	ctermbg=238		cterm=none
hi VertSplit	ctermfg=238		ctermbg=238		cterm=none
hi Visual		ctermfg=none	ctermbg=242		cterm=reverse
hi WarningMsg	ctermfg=203

" Diff highlighting
hi DiffAdd						ctermbg=22		cterm=none
hi DiffDelete	ctermfg=234		ctermbg=52		cterm=none
hi DiffText						ctermbg=53		cterm=none
hi DiffChange					ctermbg=24		cterm=none


" Syntax highlighting
hi Comment		ctermfg=12		ctermbg=none	cterm=none
hi Constant		ctermfg=173		ctermbg=none	cterm=none
hi Error		ctermfg=9		ctermbg=1		cterm=none
hi Identifier	ctermfg=14		ctermbg=none	cterm=none
hi Special		ctermfg=3		ctermbg=none	cterm=none
hi Statement	ctermfg=3		ctermbg=none	cterm=none
hi String		ctermfg=13		ctermbg=none	cterm=none
hi Todo			ctermfg=none	ctermbg=30		cterm=none
hi Type			ctermfg=2		ctermbg=none	cterm=none


" Links
hi! link FoldColumn		Folded
hi! link CursorColumn	CursorLine
