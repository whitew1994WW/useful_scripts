syntax on
source $HOME/.config/nvim/_init.lua
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set guicursor=n-v-c:block-Cursor
set number
set laststatus=2
set ruler
set nofixendofline
set wildmenu
set nocompatible
set path+=**

runtime ftplugin/man.vim
set re=0
" Net rw config
let g:netrw_altv=1
let g:netrw_liststyle=3
highlight link cUserType cType

augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

call plug#begin()
Plug 'morhetz/gruvbox', {'branch':'master'}
Plug 'vim-scripts/dbext.vim'
Plug 'https://github.com/preservim/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()



colorscheme codedark

:set number

"neoterm settings
let g:neoterm_default_mod='botright'
let g:neoterm_size = '0.2'

"Escape from the terminal using uu 
:tnoremap uu  <C-\><C-n>
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"

au BufReadPost *.HC set syntax=cpp
au BufReadPost *.HH set syntax=cpp


hi Normal ctermbg=NONE guibg=NONE

set breakindent
set breakindentopt=shift:4
set statusline=%#CustomColour#
set statusline+=%{&ff}   " File system
set statusline+=%y       " Filetype of the file
set statusline+=\ %m       " Is file modified?
set statusline+=%=%c     " Column
set statusline+=%6l/     " Current line
set statusline+=%-4L     " Total lines

nnoremap <C-j> <C-i>
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
" Use <c-space> to trigger completion.
inoremap uu <esc>

vnoremap uu <esc>
autocmd TextChanged,TextChangedI <buffer> silent write

