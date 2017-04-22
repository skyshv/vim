set expandtab
set ai
set ts=4
set sw=4
set nocompatible
set t_Co=256
set ruler
set nu
set rnu
set complete-=i
set noea
set backspace=indent,eol,start
set mouse=a
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/Shougo/neocomplete.vim.git'
Plugin 'https://github.com/Shougo/echodoc.vim.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
call vundle#end()
syntax on
filetype on
filetype plugin on
filetype plugin indent on
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=80
let g:netrw_banner=0
let g:neocomplete#enable_at_startup = 1
nmap <C-J> :bprev <CR>
nmap <C-K> :bnext <CR>
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <F8> :TagbarToggle<CR>
nmap <F7> :ls<CR>:b
nmap [f :find **/<C-R><C-f><CR>
nmap <leader>f :find **/<C-R><C-W><CR>
nmap [s :vimgrep <C-R><C-W> **/*.*<CR>
nmap gc :hide<CR>
nmap gn :let g:netrw_winsize=20 <CR> :Ve<CR> :let g:netrw_winsize=80<CR>
nmap gN <C-W>hgcgn
nmap g> :mksession! 1<CR>
nmap [b :%bd\|e#<CR> 
nmap cs' ciw'<C-R>"'<C-C>
nmap cs" ciw"<C-R>""<C-C>
nmap cs{ ciw{<C-R>"}<C-C>
nmap cs( ciw(<C-R>")<C-C>
nmap cs[ ciw[<C-R>"]<C-C>
nmap cs< ciw<<C-R>"><C-C>
nmap cs0 ciw${<C-R>"}<C-C>
nmap <leader>d :YcmCompleter GoToDefinition<CR>
nmap <leader>r :YcmCompleter GoToReferences<CR>
nmap <C-N> gt
nmap <C-P> gT
set cmdheight=1
set completeopt-=preview


function Setuppython()
python3 << EOL
import os
import sys
import vim
for s in sys.path:
    if os.path.isdir(s):
        vim.command(r'set path+=%s' %(s.replace(" ", r"\ ")))
EOL
set suffixesadd=.py
endfunction
au BufNewFile,BufRead *.py call Setuppython()
