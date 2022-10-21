
" neovim-qt ignores guifont...
if exists(":GuiFont")
	:GuiFont! JetBrains\ Mono:h10
end

" disable GUI tab line
if exists(":GuiTabline")
	:GuiTabline 0
end

" neovim-qt cwd title
set title
let &titlestring=fnamemodify(getcwd(), ":t") . " — nvim"
augroup dirchange
	autocmd!
	autocmd DirChanged * let &titlestring=fnamemodify(v:event["cwd"], ":t") . " — nvim"
augroup END
