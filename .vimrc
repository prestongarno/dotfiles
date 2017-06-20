call pathogen#infect()
syntax on
filetype plugin indent on
set nu
set relativenumber
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
set nocompatible              
filetype off                  

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'

call vundle#end()
filetype plugin indent on

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'
call plug#end()


nnoremap gb :ls<CR>:b<Space>
nnoremap <leader>r :MRU<CR>
nnoremap <leader><Tab> :FZF ./<CR>

"Auto plugin commands config
au FileType markdown,text,tex DittoOn
""""""""""""""""""""""""""""""""""""""""""
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
""""""""""""""""""""""""""""""""""""""""""
" Set leader
let mapleader = ","
"map to dev/null
map <leader>d "_x

" changing directory shortcuts
nnoremap <leader>ch :cd ../<CR><CR>:pwd<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


set cul
set gcr=n:lCursor
set colorcolumn=80

"test
"=============================
" Custom shortcuts
"=============================

" TimeStamp
noremap <leader>ts i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
" map source rc command
noremap <leader>! :source ~/.vimrc<CR>
" map save func
nnoremap <leader>w :w<CR>

map <leader>f "qp

let g:lexical#thesaurus_key = '<leader><S-t>'


"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

so ~/.vim/colors/smyck.vim
