" File: ftypes.vim
" ----------------
" This file contains filetype specific settings for filetypes that require
" different settings from the defaults.


" C.
au BufNewFile,BufRead *.c setlocal sw=4 ts=4

" C++.
au BufNewFile,BufRead *.cpp setlocal sw=4 ts=4

" Objective-C.
au BufNewFile,BufRead *.m set ft=objc
au BufNewFile,BufRead *.m setlocal cc=100 sw=4 ts=4

" C, C++, Objective-C etc. header files.
au BufNewFile,BufRead *.h setlocal sw=4 ts=4

" Python.
au BufNewFile,BufRead *.py setlocal sw=4 ts=4

" JSON.
au BufNewFile,BufRead *.json set ft=javascript
