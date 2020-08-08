call plug#begin('~/.local/share/nvim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tikhomirov/vim-glsl'

call plug#end()

map <space> <leader>
nnoremap <leader>c :noh<cr>

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

"" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)
"
"" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)
"
"" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)
"
"" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)

nnoremap <silent> <c-l> <c-w>l
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-j> <c-w>j

map <leader>m :NERDTreeToggle<cr>

" FZF
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
  set grepprg=rg\ --vimgrep
endif

let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>o :FzfFiles<cr>
  nnoremap <leader>t :FzfTags<cr>
  nnoremap <leader>g :!~/.cargo/bin/rusty-tags vi -O tags<cr>
  nnoremap <leader>l :call fzf#vim#tags("".expand('<cword>'))<cr>

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

