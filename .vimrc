syntax on
set mouse=a
set nocompatible
set incsearch
set textwidth=80
set expandtab
set tags=tags;/
set cursorline
set modeline
set modelines=2
"set cursorline
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tfnico/vim-gradle'
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-fugitive'
Plugin 'ocr/vim-sessions'
Plugin 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

" JS Beautifier {{{

Plugin 'beautify-web/js-beautify'
augroup JsBeautify_au
 autocmd!
 " Beautifier
 autocmd FileType javascript noremap <buffer> ff :call JsBeautify()<cr>
 " for html
 autocmd FileType html noremap <buffer> ff :call HtmlBeautify()<cr>
 " for css or scss
 autocmd FileType css noremap <buffer> ff :call CSSBeautify()<cr>
augroup END

" }}}

Plugin 'lukaszb/vim-web-indent'

call vundle#end()
filetype plugin indent on

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_include_dirs = [
            \ '/usr/include/qt4/QtCore',
            \ '/usr/include/qt4/QtGui',
            \ '/usr/include/qt4/QtNetwork']

" Status bar
let g:airline_powerline_fonts = 1
set laststatus=2

" Beautifier
autocmd FileType javascript noremap <buffer> <leader>ff :call JsBeautify()<cr>

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
