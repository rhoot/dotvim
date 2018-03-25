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
colorscheme tomorrow-night
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" ack.vim
if executable("ag")
	let g:ackprg = "ag --vimgrep"
endif


" ctrlp
let g:ctrlp_cmd = "CtrlP"

if has("mac")
	map <D-p> :CtrlP<CR>
	map <D-P> :CtrlPTag<CR>
	let g:ctrlp_map = "<D-p>"
else
	map <C-p> :CtrlP<CR>
	map <C-P> :CtrlPTag<CR>
	let g:ctrlp_map = "<C-p>"
endif

" vim-airline
let g:airline_theme = "deus"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

if has("gui_running")
	set guifont=Menlo\ for\ Powerline:h12
	let g:airline_powerline_fonts = 1
endif

" vim-gutentags
if has("mac")
	let g:gutentags_cache_dir = "~/.vim/tagscache"
	let g:gutentags_ctags_executable = "/usr/local/bin/ctags"
endif

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
set tabstop=4

map ]q :cnext<CR>
map [q :cprev<CR>
