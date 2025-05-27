set nocompatible

" required plugins (https://github.com/sainnhe/gruvbox-material/issues/60)
packadd! sonokai

" optional plugins
if executable("ag") || executable("ack")
	packadd ack.vim
endif

if !has("nvim")
	packadd vim-polyglot

	if executable("fzf")
		packadd fzf
		packadd fzf.vim
	endif
endif

filetype plugin indent on
syntax on

" remote session check (https://stackoverflow.com/a/16188077)
let g:remoteSession = ($STY == "")

" no history
set viminfo='0,:0,<0,@0,f0

" no swp and ~ files
set noswapfile
set nobackup

" show whitespace
set list
set listchars=tab:>\ \ ,space:.,extends:>,precedes:<,nbsp:-

" system clipboard
map  <S-Insert> "+p
map  <C-Insert> "+y
map! <S-Insert> <C-R>+

" arrow keys -> screen lines
nnoremap <Up> gk
xnoremap <Up> gk
inoremap <Up> <C-o>gk
nnoremap <Down> gj
xnoremap <Down> gj
inoremap <Down> <C-o>gj

" completion
set complete-=i
set completeopt=fuzzy,menuone,noinsert

" colors
if has('termguicolors') && !g:remoteSession
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
		set guifont=JetBrainsMonoNF-Regular:h12
	elseif has("linux")
		set guifont=JetBrainsMono\ Nerd\ Font\ 10
	else
		set guifont=JetBrainsMono\ Nerd\ Font:h10
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
set shiftwidth=3
set showmatch
set sidescroll=1
set signcolumn=yes
set smartcase
set smarttab
set tabstop=3
set updatetime=1000
set wildmenu
set wildmode=longest,list

if has("gui_running")
	set columns=185
	set lines=56
	set guioptions-=T
end

" stop overriding my settings please...
let g:sass_recommended_style = 0

map ]q :cnext<CR>
map [q :cprev<CR>
map ]b :bnext<CR>
map [b :bprevious<CR>

" stdpath is nvim exclusive
if has("nvim")
	augroup templates
		if filereadable(stdpath("data")."/site/skeleton.cpp")
			autocmd BufNewFile *.cpp execute "0read ".stdpath("data")."/site/skeleton.cpp"
		endif
		if filereadable(stdpath("data")."/site/skeleton.h")
			autocmd BufNewFile *.h execute "0read ".stdpath("data")."/site/skeleton.h"
		endif
	augroup END
endif

" ack.vim
if executable("rg")
	let g:ackprg = "rg --vimgrep"
elseif executable("ag")
	let g:ackprg = "ag --vimgrep"
endif

" bbye
map <BS> :Bdelete<CR>

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
let g:argwrap_wrap_closing_brace = 0

nnoremap <silent> <leader>a :ArgWrap<CR>

" vim-go
let g:go_imports_autosave = 0
