syntax on
set mouse=a
set nocompatible
set incsearch
set textwidth=100
set expandtab
set tags=tags;/
set cursorline
"set cursorline
filetype plugin indent on

"Emacs like key mappings for moving the cursor arround
:map <C-e> $
:map <C-a> 0
:map <C-k> d$

"Automatically comment OCaml code:
:vmap oc :s/\(.*\)/(\* \1 \*\)/<Enter>
"Same for uncommenting
:vmap ou :s/\(.*\)(\*\(.*\)\*)\(.*\)/\1\2\3/<Enter>

"Automatically comment LaTeX code
:vmap lc :s/\(.*\)/%\1/<Enter>
"Same for uncommenting
:vmap lu :s/%\(.*\)/\1/<Enter>

"Tab completion for file names
set wildmode=longest,list,full
set wildmenu

set showtabline=2

" Default tabstop and shiftwidth
" Need to be executed before any
" languages specific value
au FileType * set tabstop=4
au FileType * set shiftwidth=4


au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2

" Set FileType javascript for .json files
autocmd BufNewFile,BufRead *.json set ft=javascript

" Start pathogen to load all the plugins
call pathogen#infect() 
