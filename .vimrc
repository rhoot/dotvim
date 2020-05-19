set nocompatible
so $VIMRUNTIME/mswin.vim

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
set listchars=tab:>-,extends:>,precedes:<,nbsp:-

" colors
colorscheme tomorrow-night
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" ack.vim
if executable("ag")
	let g:ackprg = "ag --vimgrep"
endif

" ale
let g:ale_linters_explicit = 1
let g:ale_linters = {
	\ 'c': ['ccls'],
	\ 'cpp': ['ccls'],
	\ 'objc': ['ccls'],
	\ 'lua': ['lua-language-server'],
	\ }
let g:ale_cpp_ccls_init_options = {
	\ 'cacheDirectory': '/tmp/ccls',
	\ 'cacheFormat': 'binary',
	\ }

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

" deoplete.nvim
if has("python3")
	try
		python3 import pynvim
		let g:deoplete#enable_at_startup = 1
	catch
	endtry
endif

set complete-=i
set completeopt=longest,menuone,noinsert
inoremap <expr><TAB> pumvisible() ? '<C-y>' : '<TAB>'
inoremap <expr><CR> pumvisible() ? '<C-e><CR>' : '<CR>'

" nerdtree
map <leader>f :NERDTreeToggle<CR>

" vim-airline
let g:airline_theme = "deus"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

if has("gui_running")
	if has("mac")
		set guifont=Menlo\ for\ Powerline:h12
	elseif has("linux")
		set guifont=Menlo\ for\ Powerline\ 10
	else
		set guifont=Menlo\ for\ Powerline:h9
	endif
	let g:airline_powerline_fonts = 1
endif

" vim-argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>

" vim-workspace
let g:workspace_session_name = '.session.vim'

nnoremap <leader>s :ToggleWorkspace<CR>

" misc customization
set autoindent
set autoread
set autowrite
set backspace=2
set encoding=utf-8
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noerrorbells
set nofoldenable
set nowrap
set number
set ruler
set shiftround
set shiftwidth=4
set showmatch
set sidescroll=1
set smartcase
set smarttab
set tabstop=4

if has("gui_running")
	set columns=185
	set lines=56
	set guioptions-=T
end

map ]q :cnext<CR>
map [q :cprev<CR>
map ]b :bnext<CR>
map [b :bprevious<CR>
map <S-BS> :Bdelete<CR>
