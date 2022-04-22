
" neovim-qt ignores guifont...
if exists(":GuiFont")
	:GuiFont! JetBrains\ Mono:h10
end

" disable GUI tab line
if exists(":GuiTabLine")
	:GuiTabline 0
end

