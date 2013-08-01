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
  set wrap
  set linebreak
  set nolist
  set showbreak=>>\ \ 
  " 2. Statusline
  set statusline=%f
  set statusline+=%=
  set statusline+=[%03l
  set statusline+=/
  set statusline+=%03L]
  set statusline+=\ \|
  set statusline+=\ [%03c]
  set laststatus=2
  " 3. Variables
  let mapleader=","
  " 4. Misc.
  filetype indent on
  " off because it turns jslint on
  " filetype plugin on
  syntax on
  autocmd vimenter * if !argc() | NERDTree | endif " if noargs -> open NERDtree
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

" markdown file settings {{{
augroup filetype_markdown
    autocmd!
    au BufRead,BufNewFile *.md set tw=80
    au BufRead,BufNewFile *.md syntax off
augroup END
" }}}

" shortcuts {{{
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>sz :!source ~/.zshrc<cr>
nnoremap <leader>t :tabnew 
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>r :r !
" }}}

" Pathogen {{{
execute pathogen#infect()
" }}}

" trying to hack lorem ipsum into the shape I want it in {{{
function! Li(x)
  execute "normal! maGo|"
  execute ":Loremipsum " . a:x . "<cr>"
  execute "normal! Gxy$`apGdd`a"
endfunction
" }}}
" fold to the end {{{
function! FoldRest()
  let curr=line(".")
  while curr < line("$")
    execute "normal! zfatj"
    let curr += 1
  endwhile
endfunction
" }}}
" zen coding {{{
let g:user_zen_leader_key = '<c-z>'
" }}}

" angular conversion stuff {{{

" }}}

" indent-guides configuration {{{
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=blue ctermbg=1
let g:indent_guides_guide_size=2
let g:indent_guides_soft_pattern = '\s'
" }}}
