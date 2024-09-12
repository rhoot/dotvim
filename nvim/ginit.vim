
" neovim-qt ignores guifont...
if exists(":GuiFont")
	if has("mac")
		:GuiFont! JetBrainsMono\ Nerd\ Font:h12
	else
		:GuiFont! JetBrainsMono\ Nerd\ Font:h10
	endif
endif

" disable GUI tab line
if exists(":GuiTabline")
	:GuiTabline 0
endif
