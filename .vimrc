set nocompatible

execute pathogen#infect()
filetype plugin indent on
syntax on

" no history
set viminfo='0,:0,<0,@0,f0

" no swp and ~ files
set noswapfile
set nobackup

" show whitespace
set list
set listchars=tab:>-,space:.,extends:>,precedes:<,nbsp:-

" colors
colorscheme evening
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" vim-airline
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" misc customization
set autoindent
set backspace=2
set hlsearch
set incsearch
set noerrorbells
set nowrap
set number
set ruler
set shiftround
set shiftwidth=4
set showmatch
set smartcase
set smarttab

if has("gui_running")
	set guifont=Menlo\ for\ Powerline:h12
	let g:airline_powerline_fonts = 1
endif

if has("mac")
	" ctrlp
	map <D-p> :CtrlP<CR>
	let g:ctrlp_map = '<D-p>'
	let g:ctrlp_cmd = 'CtrlP'

	" vim-gutentags
	let g:gutentags_ctags_executable = '/usr/local/bin/ctags'
endif
