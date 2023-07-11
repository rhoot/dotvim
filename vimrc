set nocompatible

" required plugins (https://github.com/sainnhe/gruvbox-material/issues/60)
packadd! sonokai

" optional plugins
if executable("ag") || executable("ack")
	packadd ack.vim
endif

if executable("fzf")
	packadd fzf
	packadd fzf.vim
endif

if !has("nvim")
	packadd vim-polyglot
endif

filetype plugin indent on
syntax on

" no history
set viminfo='0,:0,<0,@0,f0

" no swp and ~ files
set noswapfile
set nobackup

" show whitespace
set list
set listchars=tab:-->,space:.,extends:>,precedes:<,nbsp:-

" system clipboard
map  <S-Insert> "+p
map  <C-Insert> "+y
map! <S-Insert> <C-R>+

" completion
set complete-=i
set completeopt=longest,menuone,noinsert
inoremap <expr><TAB> pumvisible() ? '<C-y>' : '<TAB>'
inoremap <expr><CR> pumvisible() ? '<C-e><CR>' : '<CR>'

" colors
if has('termguicolors')
	set termguicolors
endif

let g:sonokai_better_performance = 1
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_virtual_text = 'colored'

if !has("gui_running")
	augroup trans_bg
		au ColorScheme * highlight Normal ctermbg=none guibg=#111111
		au ColorScheme * highlight NonText ctermbg=none guibg=#111111
		au ColorScheme * highlight EndOfBuffer ctermbg=none guibg=#111111
	augroup END
end

colorscheme sonokai

" GVim/MacVim fonts
if has("gui_running")
	if has("mac")
		set guifont=JetBrainsMono-Regular:h12
	elseif has("linux")
		set guifont=JetBrains\ Mono\ 10
	else
		set guifont=JetBrains\ Mono:h10
	endif
endif

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
set linebreak
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
set wildmenu
set wildmode=longest,list

if has("gui_running")
	set columns=185
	set lines=56
	set guioptions-=T
end

map ]q :cnext<CR>
map [q :cprev<CR>
map ]b :bnext<CR>
map [b :bprevious<CR>

" ack.vim
if executable("ag")
	let g:ackprg = "ag --vimgrep"
endif

" bbye
map <S-BS> :Bdelete<CR>

" fzf
if executable("ag")
	let $FZF_DEFAULT_COMMAND = 'ag -g ""'
endif

if executable("fzf")
	if has("mac")
		map <D-p> :Files<CR>
	else
		map <C-p> :Files<CR>
	endif
endif

" nerdtree
map <leader>f :NERDTreeToggle<CR>

" vim-airline
let g:airline_theme = "deus"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" vim-argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>

" vim-go
let g:go_imports_autosave = 0
