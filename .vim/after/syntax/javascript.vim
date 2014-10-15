" File: javascript.vim
" --------------------
" This file contains code that fixes some default Vim JavaScript syntax
" deficiencies.


" Regular int like number with - + or nothing in front.
syn match javaScriptNumber '\d\+'
syn match javaScriptNumber '[-+]\d\+'

" Floating point number with decimal no E or e (-,+).
syn match javaScriptNumber '\d\+\.\d*'
syn match javaScriptNumber '[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (-,+).
syn match javaScriptNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match javaScriptNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (-,+).
syn match javaScriptNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match javaScriptNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'


hi link javaScriptNumber Number
