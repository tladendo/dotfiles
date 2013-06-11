" .vimrc file
" author: tladendo (tom@tomladendorf.com)

" Basic settings {{{
" 1. Options
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent smartindent
set number
set numberwidth=3
set statusline=%f
set statusline+=%=
set statusline+=[%03l
set statusline+=/
set statusline+=%03L]
set statusline+=\ \|
set statusline+=\ [%03c]
set laststatus=2
" 2. Variables
let mapleader=","
" 3. Misc.
filetype indent on
syntax on
" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" javascript file settings {{{
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript let javaScript_fold=1
    autocmd FileType javascript setlocal foldmethod=syntax
augroup END
" }}}

" Cool shortcuts {{{
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>sz :!source ~/.zshrc<cr>
" }}}

" Pathogen {{{
execute pathogen#infect()
" }}}


