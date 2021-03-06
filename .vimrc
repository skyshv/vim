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
"Plugin 'https://github.com/Shougo/neocomplete.vim.git'
Plugin 'https://github.com/Shougo/echodoc.vim.git'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'mkitt/tabline.vim'
Plugin 'vim-syntastic/syntastic'
"Plugin 'https://github.com/seebi/dircolors-solarized.git'
"Plugin 'tomasr/molokai'
call vundle#end()
syntax on
filetype on
filetype plugin on
filetype plugin indent on
color PaperColor
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_list_hide='.*\.pyc$,.*\.swp$,^\..*'
let g:netrw_keepdir=0
let g:netrw_altv=1
let g:netrw_winsize=80
let g:netrw_banner=0
"let g:ycm_add_preview_to_completeopt=1
"let g:ycm_autoclose_preview_window_after_insertion=1
nmap <C-J> :bprev <CR>
nmap <C-K> :bnext <CR>
nmap gh <C-W>h<C-W>h<C-W>h$B"5y0"zy$?^\(<C-R>5\)\@!<CR><CR><CR>/<C-R>z<CR>
nmap gb <C-^>:bd#<CR>
nmap <C-H> <C-W>h 
nmap <C-L> <C-W>l
nmap <F8> :TagbarToggle<CR>
nmap <F7> :ls<CR>:b
nmap gx :vs<CR><C-W>T
nmap [f :1find :execute "lcd" .g:mycurdir<CR>:find **/<cfile>:t<CR>
nmap <leader>f :execute "lcd" .g:mycurdir<CR>:find **/<cfile>:t<CR>
nmap [s :vimgrep <C-R><C-W> **/*.*<CR>
nmap gc :q<CR>
nmap gn :let g:netrw_winsize=20 <CR> :Ve<CR> :let g:netrw_winsize=80<CR>
nmap gN <C-W>hgcgn
nmap g> :mksession! ~/.1.sess<CR>
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
set completeopt-=preview
set cmdheight=1
set tags+=./tags
"let g:echodoc_enable_at_startup=1
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
function Settags()
    let g:mycurdir=getcwd()
    execute "set tags+=" . getcwd() . "/tags"
    execute "set path+=" . getcwd()
endfunction

au VimEnter * call Settags()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
