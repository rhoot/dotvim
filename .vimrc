set nocompatible

execute pathogen#infect()
filetype plugin indent on
syntax on

" vim-airline
AirlineTheme deus
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" misc customization
set autoindent
set backspace=2
set hlsearch
set ruler

if has("gui_running")
	colorscheme evening
	set guifont=Menlo\ for\ Powerline:h12
endif

