" Vim color file
" by tappi

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "tappi"

" General colors

hi Cursor          ctermfg=234   ctermbg=228   cterm=none      guifg=#1c1c1c guibg=#ffff87 gui=NONE
hi CursorLine      ctermfg=none  ctermbg=238   cterm=none      guifg=NONE    guibg=#444444 gui=NONE
hi ErrorMsg        ctermfg=196   ctermbg=none  cterm=bold      guifg=#ff0000 guibg=NONE    gui=bold
hi ExtraWhitespace ctermfg=none  ctermbg=red   cterm=none      guifg=NONE    guibg=red     gui=NONE
hi Folded          ctermfg=103   ctermbg=237   cterm=none      guifg=#8787af guibg=#3a3a3a gui=NONE
hi LineNr          ctermfg=245   ctermbg=235   cterm=none      guifg=#8a8a8a guibg=#262626 gui=NONE
hi MatchParen      ctermfg=none  ctermbg=242   cterm=none      guifg=NONE    guibg=#6c6c6c gui=NONE
hi NonText         ctermfg=white ctermbg=none  cterm=none      guifg=#ffffff guibg=NONE    gui=NONE
hi Normal          ctermfg=252   ctermbg=235   cterm=none      guifg=#d0d0d0 guibg=#262626 gui=NONE
hi Pmenu           ctermfg=40    ctermbg=238   cterm=none      guifg=#00d700 guibg=#444444 gui=NONE
hi PmenuSel        ctermfg=28    ctermbg=248   cterm=none      guifg=#008700 guibg=#a8a8a8 gui=NONE
hi Search          ctermfg=black ctermbg=63    cterm=none      guifg=#000000 guibg=#5f5fff gui=NONE
hi SignColumn      ctermfg=248   ctermbg=238   cterm=none      guifg=#a8a8a8 guibg=#444444 gui=NONE
hi StatusLine      ctermfg=black ctermbg=248   cterm=none      guifg=#000000 guibg=#a8a8a8 gui=NONE
hi StatusLineNC    ctermfg=248   ctermbg=238   cterm=none      guifg=#a8a8a8 guibg=#444444 gui=NONE
hi TabLine         ctermfg=248   ctermbg=238   cterm=underline guifg=#a8a8a8 guibg=#444444 gui=underline
hi TabLineFill     ctermfg=248   ctermbg=238   cterm=underline guifg=#a8a8a8 guibg=#444444 gui=underline
hi TabLineSel      ctermfg=black ctermbg=248   cterm=none      guifg=#000000 guibg=#a8a8a8 gui=NONE
hi VertSplit       ctermfg=248   ctermbg=238   cterm=none      guifg=#a8a8a8 guibg=#444444 gui=NONE
hi Visual          ctermfg=none  ctermbg=black cterm=reverse   guifg=NONE    guibg=#000000 gui=reverse
hi WarningMsg      ctermfg=203   ctermbg=none  cterm=none      guifg=#ff5f5f guibg=NONE    gui=NONE

" Syntax highlighting
hi Comment         ctermfg=63    ctermbg=none  cterm=none      guifg=#5f5fff guibg=NONE    gui=NONE
hi Constant        ctermfg=173   ctermbg=none  cterm=none      guifg=#d7875f guibg=NONE    gui=NONE
hi Error           ctermfg=203   ctermbg=none  cterm=none      guifg=#ff5f5f guibg=NONE    gui=NONE
hi Identifier      ctermfg=51    ctermbg=none  cterm=none      guifg=#00ffff guibg=NONE    gui=NONE
hi Special         ctermfg=173   ctermbg=none  cterm=none      guifg=#d7875f guibg=NONE    gui=NONE
hi Statement       ctermfg=130   ctermbg=none  cterm=none      guifg=#af5f00 guibg=NONE    gui=NONE
hi String          ctermfg=207   ctermbg=none  cterm=none      guifg=#ff5fff guibg=NONE    gui=NONE
hi Todo            ctermfg=63    ctermbg=none  cterm=none      guifg=#5f5fff guibg=NONE    gui=NONE
hi Type            ctermfg=34    ctermbg=none  cterm=none      guifg=#00af00 guibg=NONE    gui=NONE

" Diff highlighting
hi DiffAdd         ctermfg=none  ctermbg=22    cterm=none      guifg=NONE    guibg=#005f00 gui=NONE
hi DiffChange      ctermbg=24    ctermbg=none  cterm=none      guifg=NONE    guibg=#005f87 gui=NONE
hi DiffDelete      ctermfg=234   ctermbg=52    cterm=none      guifg=#1c1c1c guibg=#5f0000 gui=NONE
hi DiffText        ctermfg=none  ctermbg=53    cterm=none      guifg=NONE    guibg=#5f005f gui=NONE

" Links
hi! link FoldColumn        Folded
hi! link CursorColumn      CursorLine
hi! link SpecialKey        Constant
"hi! link SyntasticError   ErrorMsg
"hi! link SyntasticWarning WarningMsg
