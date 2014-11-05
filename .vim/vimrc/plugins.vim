" File: plugins.vim
" -----------------
" This file lists the Vim plugins to be installed with Vundle.


" Set the runtime path to include Vundle and initialize.
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()


" Let Vundle manage Vundle.
Plugin 'gmarik/Vundle.vim'

" Auto-complete for open-close character pairs.
Plugin 'Raimondi/delimitMate'

" Jade syntax highlighting.
Plugin 'digitaltoad/vim-jade'


call vundle#end()
