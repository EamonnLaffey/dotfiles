filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
syntax on
map <F6> :setlocal spell! spelllang=en_au<CR>
map <F2> :!pdflatex %
set relativenumber
set tabstop=4

vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+P
