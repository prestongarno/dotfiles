execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible              
filetype off                  

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

func! WordProcessorMode() 
	  setlocal formatoptions=1 
	    setlocal noexpandtab 
	      map j gj 
	        map k gk
		  setlocal spell spelllang=en_us 
		    set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
		      set complete+=s
		        set formatprg=par
			  setlocal wrap 
			    setlocal linebreak 
		    endfu 
		    com! WP call WordProcessorMode()
