set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'groenewege/vim-less'

" All of your Plugins must be added before the following line
call vundle#end() " required

" Places to try making swp files, in order of priority
set dir=.,~/tmp,/var/tmp,/tmp

" Tab Stuff
set expandtab " tabs into spaces
set shiftwidth=2 
set tabstop=2
set softtabstop=2
set shiftround 
" Copy indentation from current line when creating a new line
set autoindent
" Add an indent where it makes sense (e.g., on a new line after {)
set smartindent

set textwidth=78

" Make backspace work as expected
set backspace=indent,eol,start

" Start scrolling the window if we are within so many lines of the edge
" (pun not intended).
set so=7

" Match <> like (), [], etc.
set matchpairs+=<:>

" Make things a bit more readable
set bg=dark

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Toggle whitespace visibility
map <F11> :set list!<Bar>set list?<CR>
" Toggle paste mode
map <F12> :set paste!<Bar>set paste?<CR>

" Delete trailing white space, and keep Andrew from having a conniption ;)
func! DeleteTrailingWS()
  exe "normal mz"
  " e tells :substitute that not finding a match is not an error.
  %s/\s\+$//ge
  exe "normal `z"
endfunc

if has("autocmd")
  
  " Remove all autocommands for the current group
  autocmd! FileType perl
  autocmd FileType perl let &formatprg='perltidy'
  
  " Marks files as html so we have some syntax highlighting
  autocmd BufRead,BufNewFile *.tt setfiletype html
  autocmd BufRead,BufNewFile *.tt2 setfiletype html
  autocmd BufRead,BufNewFile *.ng setfiletype html
  autocmd BufRead,BufNewFile *.less setfiletype less
  autocmd BufRead,BufNewFile *.css setfiletype css
  
  " Delete trailing whitespace on save
  autocmd BufWrite *.pl :call DeleteTrailingWS()
  autocmd BufWrite *.pm :call DeleteTrailingWS()
  autocmd BufWrite *.tt2 :call DeleteTrailingWS()
  autocmd BufWrite *.tt :call DeleteTrailingWS()
  autocmd BufWrite *.html :call DeleteTrailingWS()
  autocmd BufWrite *.js :call DeleteTrailingWS()
  autocmd BufWrite *.jsx :call DeleteTrailingWS()

endif

" So we can use aliases with !, e.g. agrep=ack-grep
let $BASH_ENV = "~/.bash_aliases"

" Plugins
filetype plugin on

" Text expansion
source ~/.vim/my_dict.vim

syntax on
