" File: smyck.vim
" ---------------
" This file is lightly customized.
"
"     The original can be found here: http://color.smyck.org


hi clear


if exists("syntax_on")
  syntax reset
endif


set background=dark


let g:colors_name="smyck"


hi Normal        cterm=none ctermbg=none ctermfg=15
hi LineNr        cterm=none ctermbg=none ctermfg=8
hi StatusLine    cterm=none ctermbg=8    ctermfg=15
hi StatusLineNC  cterm=none ctermbg=15   ctermfg=8
hi Search        cterm=none ctermbg=6    ctermfg=15
hi IncSearch     cterm=none ctermbg=3    ctermfg=8
hi ColumnMargin  cterm=none ctermbg=0
hi Error         cterm=none ctermbg=1    ctermfg=15
hi ErrorMsg      cterm=none ctermbg=1    ctermfg=15
hi Folded        cterm=none ctermbg=8    ctermfg=2
hi FoldColumn    cterm=none ctermbg=8    ctermfg=2
hi NonText       cterm=bold ctermbg=none ctermfg=8
hi ModeMsg       cterm=bold ctermbg=none ctermfg=10
hi Pmenu         cterm=none ctermbg=8    ctermfg=15
hi PmenuSel      cterm=none ctermbg=15   ctermfg=8
hi PmenuSbar     cterm=none ctermbg=15   ctermfg=8
hi SpellBad      cterm=none ctermbg=1    ctermfg=15
hi SpellCap      cterm=none ctermbg=4    ctermfg=15
hi SpellRare     cterm=none ctermbg=4    ctermfg=15
hi SpellLocal    cterm=none ctermbg=4    ctermfg=15
hi Visual        cterm=none ctermbg=15   ctermfg=8
hi Directory     cterm=none ctermbg=none ctermfg=4
hi SpecialKey    cterm=none ctermbg=none ctermfg=8
hi DiffAdd       cterm=bold ctermbg=2    ctermfg=15
hi DiffChange    cterm=bold ctermbg=4    ctermfg=15
hi DiffDelete    cterm=bold ctermbg=1    ctermfg=15
hi DiffText      cterm=bold ctermbg=3    ctermfg=8
hi MatchParen    cterm=none ctermbg=6    ctermfg=15
hi CursorLine    cterm=none ctermbg=8    ctermfg=none
hi CursorColumn  cterm=none ctermbg=8    ctermfg=none
hi Title         cterm=none ctermbg=none ctermfg=4
hi ColorColumn   cterm=none ctermbg=8    ctermfg=none

hi Keyword       cterm=none ctermbg=none ctermfg=10
hi Comment       cterm=none ctermbg=none ctermfg=8
hi Delimiter     cterm=none ctermbg=none ctermfg=15
hi Identifier    cterm=none ctermbg=none ctermfg=12
hi Structure     cterm=none ctermbg=none ctermfg=12
hi Ignore        cterm=none ctermbg=none ctermfg=8
hi Constant      cterm=none ctermbg=none ctermfg=12
hi PreProc       cterm=none ctermbg=none ctermfg=10
hi Type          cterm=none ctermbg=none ctermfg=12
hi Statement     cterm=none ctermbg=none ctermfg=10
hi Special       cterm=none ctermbg=none ctermfg=6
hi String        cterm=none ctermbg=none ctermfg=3
hi Number        cterm=none ctermbg=none ctermfg=3
hi Underlined    cterm=none ctermbg=none ctermfg=magenta
hi Symbol        cterm=none ctermbg=none ctermfg=9
hi Method        cterm=none ctermbg=none ctermfg=15
hi Interpolation cterm=none ctermbg=none ctermfg=6
