call plug#begin('~/.local/share/nvim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'

call plug#end()

nnoremap <Leader><space> :noh<cr>

set background=dark
set hidden
set nu
set nuw=4

let g:gruvbox_italic = 1                 "Enable italics in Gruvbox colorscheme
let g:gruvbox_invert_selection = 0       "Do not invert selection in Gruvbox colorscheme
let g:gruvbox_sign_column = 'bg0'        "Use default bg color in sign column
let g:gruvbox_vert_split='bg1'
colorscheme gruvbox
set fillchars+=vert:\ 
set fillchars+=eob:\ 
set termguicolors

let g:rustfmt_autosave = 1

nnoremap <silent> <c-l> <c-w>l
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-j> <c-w>j

map <c-m> :NERDTreeToggle<cr>

" FZF
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
  set grepprg=rg\ --vimgrep
endif

let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :FzfTags<cr>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>

  if executable('rg')
    " :Find <term> runs `rg <term>` and passes it to fzf
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
    nnoremap <leader>/ :Find 
    nnoremap <leader>' :execute "Find " . expand("<cword>")<cr>
  endif
else
  nnoremap <leader>v :CtrlP<Space><cr>
endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" arrow keys disable
noremap <right> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <up> <nop>
noremap <up> <nop>

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

