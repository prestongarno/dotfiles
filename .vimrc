execute pathogen#infect()
syntax on
filetype plugin indent on
set nu
set relativenumber
" show existing tab with 4 spaces width
set tabstop=3
" when indenting with '>', use 4 spaces width
set shiftwidth=3
" On pressing tab, insert 4 spaces
set expandtab
set nocompatible              
filetype off                  

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'reedes/vim-pencil'
Plugin 'dbmrq/vim-ditto'
Plugin 'reedes/vim-wordy'
Plugin 'junegunn/limelight.vim'
"Plugin 'itchyny/dictionary'

call vundle#end()
filetype plugin indent on



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

syntax enable
set background=dark
colorscheme solarized
let g:lexical#thesaurus_key = '<leader><S-t>'

func! WordProcessorMode() 
    setlocal formatoptions=1 
    map j gj 
    map k gk
    nnoremap <leader>c :!wc -w %<CR>
    setlocal spell spelllang=en_us 
    set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
    set complete+=s
    set formatprg=par
    setlocal wrap 
    set linespace=3
    setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

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
